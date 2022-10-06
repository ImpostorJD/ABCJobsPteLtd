package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Job;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobApplication;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.JobService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * 	JobController --- Controller responsible for job listing, posting, viewing, applying.
 * @author John Daniel Tejero
 *
 */
@Controller
public class JobController {

	@Autowired
	LoginUserService loguser;
	
	@Autowired
	UserService registry;
	
	@Autowired
	JobService jobs;
	/**
	 * Method for selecting view for job listing
	 * @return displayData
	 */
	@GetMapping("/Jobs")
	public ModelAndView jobListing() {
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("JobListing");
		displayData.addObject("UID", loguser.getid()); /*get ID of authenticated user*/
		displayData.addObject("userProfile", registry.selectUser(loguser.getid())); /*get user information of authenticated user*/
		
		List<Job> joblistDisplay = new ArrayList<>();
		jobs.jobListing().forEach(job -> {
			
			//format Dates
			Date deadline;
			Date posted;
			
			try {
				deadline = new SimpleDateFormat("yyyy-MM-dd").parse(job.getDeadline());
				job.setDeadline(new SimpleDateFormat("dd MMMM yyyy").format(deadline));
				posted = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(job.getPosted());
				
				if(posted.getDate() == new Date().getDate() && posted.getMonth() == new Date().getMonth() 
						&& posted.getYear() == new Date().getYear()) {
					job.setPosted(new SimpleDateFormat("HH:mm").format(posted));
				}else {
					job.setPosted(new SimpleDateFormat("dd MMMM yyyy").format(posted));
				}
				//adding author
				job.setAuthor(registry.selectUserByID(job.getUser_id()).getFirstName().concat(" "
						.concat(registry.selectUserByID(job.getUser_id()).getLastName())));
				
				joblistDisplay.add(job);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		});
	
		displayData.addObject("Jobs", joblistDisplay);
		return displayData;
	}

	/**
	 * delete job method for deleting a job entry
	 * @param id refers to the job id
	 * @return String type to redirect user to job
	 */
	@PostMapping("/deletejobentry")
	public String deleteJob(@RequestParam("id") int id) {
		jobs.deleteJob(id);
		return "redirect:/Jobs";
	}
	
	//make use of @pathVariable and in get mapping ("/Details/{id}")
	/**
	 * Method for job details view resolver.
	 * @return displayData
	 */
	@GetMapping("/Details/Job/{jid}")
	public ModelAndView jobDetails(@PathVariable("jid")Integer jid) {
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("JobDetails");
		displayData.addObject("isAuthor", false);
		displayData.addObject("UID", loguser.getid()); /*get ID of authenticated user*/
		displayData.addObject("userProfile", registry.selectUser(loguser.getid())); /*get user information of authenticated user*/
		
		Job jobDetails = jobs.searchForJob(jid);
		JobApplication isAppliedTo = jobs.retrieveUserApplication(loguser.getid(), jid);
		
		if (loguser.getid() == jobDetails.getUser_id()) {
			List<JobApplication> applicants = jobs.retrieveApplicants(jid);
			
			displayData.addObject("isAuthor", true);
			List<UserContainer> userApplicants = new ArrayList<UserContainer>();
			
			for (JobApplication extractId: applicants) {
				userApplicants.add(registry.selectUser(extractId.getUserId()));
			}
			displayData.addObject("applicants", userApplicants);
		}
		//format Dates
		Date deadline;
		Date posted;
		try {
			deadline = new SimpleDateFormat("yyyy-MM-dd").parse(jobDetails.getDeadline());
			jobDetails.setDeadline(new SimpleDateFormat("dd MMMM yyyy").format(deadline));
			posted = new SimpleDateFormat("yyyy-MM-dd").parse(jobDetails.getPosted());
			jobDetails.setPosted(new SimpleDateFormat("dd MMMM yyyy").format(posted));
			
			//adding author
			jobDetails.setAuthor(registry.selectUserByID(jobDetails.getUser_id()).getFirstName().concat(" "
					.concat(registry.selectUserByID(jobDetails.getUser_id()).getLastName())));
		
			//splitting responsibilities
			jobDetails.setResponsibilitiesList(Arrays.asList(jobDetails.getResponsibilities().split(";")));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(isAppliedTo != null) {
			displayData.addObject("canApply", "no");
		}
		
		displayData.addObject("jobDetails", jobDetails);
		displayData.addObject("jobID",jid);
		return displayData;
	}
	
	/**
	 * method for retrieving the view for job posting
	 * @return displayData
	 */
	@GetMapping("/jobposting")
	public ModelAndView jobPosting(@ModelAttribute("jobForm")Job job) {
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("JobPosting");
		displayData.addObject("UID", loguser.getid()); /*get ID of authenticated user*/
		displayData.addObject("userProfile", registry.selectUser(loguser.getid())); /*get user information of authenticated user*/
		return displayData;
	}
	
	/**
	 * method for posting job
	 * @param job
	 * @return displayData
	 */
	@PostMapping("/createJob")
	public ModelAndView jobPost(@Valid @ModelAttribute("jobForm")Job job, BindingResult result) {
		
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("JobPosting");
		displayData.addObject("UID", loguser.getid()); /*get ID of authenticated user*/
		displayData.addObject("userProfile", registry.selectUser(loguser.getid())); /*get user information of authenticated user*/
		
		if (result.hasErrors()) {
			return displayData;
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		job.setPosted(dateFormat.format(new Date()));
		job.setUser_id(loguser.getid());
		jobs.jobPosting(job);
		return displayData;
	}
	/**
	 * method for applying for job
	 * @param jid this is the job id
	 * @param uid this is the user id
	 * @return String that is for redirection
	 */
	@PostMapping("/applyForJob/{uid}")
	public String applyForJob(@PathVariable("uid")Integer jid, @RequestParam("userid") int uid) {
		jobs.applyJob(uid, jid);
		return "redirect:/Details/Job/{uid}";
	}

	/**
	 * 
	 * @param id this is the job ID
	 * @param uid this is the user ID
	 * @return String that redirects to job details
	 */
	@PostMapping("/DeleteApplication/{uid}")
	public String deleteApplicant(@PathVariable("uid")Integer id, @RequestParam("u") int uid) {
		jobs.deleteApplicant(id, uid);
		return "redirect:/Details/Job/{uid}";
	}
}

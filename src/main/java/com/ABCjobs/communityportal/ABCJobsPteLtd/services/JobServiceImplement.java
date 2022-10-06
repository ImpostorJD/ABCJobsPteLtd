package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Job;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobApplication;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.JobApplicationRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.JobRepository;

/**
 * JobServiceImplement --- implementation of job service
 * @author John Daniel Tejero
 *
 */
@Service
public class JobServiceImplement implements JobService{

	@Autowired
	JobRepository jobs; /*repository for jobs*/

	@Autowired
	JobApplicationRepository apply; /*repository for apply*/
	
	/**
	 * jobListing --- retrieves all available jobs
	 * @return List<Job> --- List of job object
	 */
	@Override
	public List<Job> jobListing() {
		return jobs.findAll();
	}

	/**
	 * jobPosting --- method for creating new job
	 * @param Job --- job information binded from front end
	 */
	@Override
	public void jobPosting(Job job) {
		try {
			Date deadline = new SimpleDateFormat("yyyy-MM-dd").parse(job.getDeadline());
			Date posted = new SimpleDateFormat("yyyy-MM-dd").parse(job.getPosted());
			if ((deadline.getYear() - posted.getYear())<0) {
				job.setStatus("closed");
			}else {
				job.setStatus("open");
			}
			jobs.save(job);
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 	searchForJob --- method for selecting particular job
	 * @param id --- refers to job id
	 * @return Job object
	 */
	@Override
	public Job searchForJob(int id) {
		return jobs.findByJobId(id);
	}

	/**
	 * deleteJob --- method for deleting a job
	 * @param id --- refers to job id
	 */
	@Override
	public void deleteJob(int id) {
		if (apply.findAllByJobId(id) !=null) {
			apply.deleteByJobId(id);
		}
		jobs.deleteById(id);
		
	}

	/**
	 * applyJob --- method for applying for job
	 * @param uid --- refers to user id
	 * @param jid --- refers to job id
	 */
	@Override
	public void applyJob(int uid, int jid) {
		apply.save(new JobApplication(uid, jid));
	}

	/**
	 * retrieveUserApplication --- method for retrieving user application
	 * @param uid --- refers to user id
	 * @param jid --- refers to job id
	 * @return JobApplication object
	 */
	@Override
	public JobApplication retrieveUserApplication(int uid, int jid) {
		return apply.findByUserIdAndJobId(uid, jid);
	}

	/**
	 *  retrieveApplicants --- retrieve all applicants
	 *  @param jid --- refers to job id
	 *  @return List<JobApplication> --- list of job application object
	 */
	@Override
	public List<JobApplication> retrieveApplicants(int jid) {
		return apply.findAllByJobId(jid);
	}

	/**
	 * deleteApplicant --- method for deleting user application on job
	 * @param uid --- refers to user id
	 * @param jid --- refers to job id
	 */
	@Override
	public void deleteApplicant(int jid, int uid) {
		apply.deleteApplicantFromJob(jid, uid);
	}

}

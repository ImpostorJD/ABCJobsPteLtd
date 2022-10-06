package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.EducationQualification;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobExperiences;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.UserInformation;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.ThreadService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * ProfileController --- handles URL for Profile processes for both post and get method
 * @author John Daniel Tejero
 */
@Controller
public class ProfileController {
	
	@Autowired
	UserService userRegistered; //service responsible for UserRepository and UserInformationRepository
	@Autowired
	LoginUserService loguser; //service responsible for identifying authenticated users
	@Autowired
	ServletContext context; //component for identifying the context of the web page
	@Autowired
	ThreadService threadPosted;
	/**
	 * Maps the URL with /Profile and retrieves the corresponding view for profile page
	 * @return Model and view to pass models and display it inside the view
	 * @param int ID for identifying which user is to be displayed
	 * 
	 */
	@GetMapping("/Profile")
	public ModelAndView userProfile(@RequestParam("UID")int Id) {
		ModelAndView displayData = new ModelAndView();
		
		displayData.setViewName("profilepage"); /*sets view name as file name of profile page*/
		displayData.addObject("UID",loguser.getid()); /*sets ID as the id of logged user*/
		displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*retrieves user profile of the authenticated user*/
		displayData.addObject("Threads", threadPosted.postedThreadsByUser(Id));
		UserContainer user = userRegistered.selectUser(Id); /*retrieves user profile of the target user*/
		user.setDisplayName(user.getFirstName() +" "+user.getLastName()); /*set the default display name for profile*/
		
		UserInformation userInfo = userRegistered.getPublicInfo(Id); /*retrieves the user information of the target user*/
		
		if(userInfo!=null) {/*checks if a record is existing*/
			user.setDisplayName(userInfo.getDisplayName()); /*overwrite the default display name*/
		}
	
		displayData.addObject("Profile",user); /*adds the user object as an object for the view*/
		displayData.addObject("UIDcompare",Id); /*sets the ID for comparing the ID if auth user*/
		
		return displayData;/*return model and view*/
	}

	/**
	 * Maps the URL with /edit-profile and retrieves the corresponding view for edit-profile page
	 * @return Model and view to pass models and display it inside the view
	 * @param UserContainer to map the ModelAttribute with SF form
	 * 
	 */
	@GetMapping("/edit-profile")
	public ModelAndView editProfile(@ModelAttribute("updateUserInfo") UserContainer user) {
		
		user = userRegistered.selectUser(loguser.getid()); /*set the user as the current logged user for default values*/
		
		ModelAndView displayData = new ModelAndView();
		
		displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*for user display in header*/
		displayData.setViewName("profile-edit");/*set the view by calling the filename of target JSP page*/
		displayData.addObject("contact", "none"); /*set contact to none for error*/
		displayData.addObject("user", user); /*adds the object user to view with key "user"*/
		displayData.addObject("UID",loguser.getid()); /*sets the UID object to the ID of authenticated user*/
		
		return displayData; /*returns model and view*/
	}
	
	/**
	 * Maps the URL with /edit-primary-information and process the data input on edit profile page
	 * @return Model and view to pass models and display it inside the view
	 * @param UserContainer to map the ModelAttribute with SF form
	 * 
	 */
	@PostMapping("/edit-primary-information")
	public ModelAndView appendPrimaryInfo(@ModelAttribute("updateUserInfo") UserContainer user) {
		
		if(userRegistered.getPublicInfo(loguser.getid())==null) { /*checks if user information record is null*/
			
			/*set default value for user information*/
			UserInformation newPublicProfile = new UserInformation("default", "default", userRegistered.selectUser(loguser.getid()).getFirstName()
					+ " " + userRegistered.selectUser(loguser.getid()).getLastName(), "default", "none", "default", 
					"default", "default", "none", loguser.getid());
			
			userRegistered.setPublicInfo(newPublicProfile); /*insert new record to user information table*/
		}
		
		ModelAndView displayData = new ModelAndView(); 
		UserContainer placeholder = new UserContainer(); /*container for the updated user information*/
		UserInformation personalInfo = userRegistered.getPublicInfo(loguser.getid()); /*retrieves user information record of user*/
		
		displayData.addObject("contact", "none"); /*set default error message for contact*/

		/*update user information validation*/
		if (!user.getDisplayName().isEmpty()) { /*checks if display name field is not empty*/
			placeholder.setDisplayName(user.getDisplayName()); /*set placeholder display name*/
		}
		
		if(!user.getCity().isEmpty()) { /*check if city field is not empty*/
			placeholder.setCity(user.getCity()); /*set placeholder city*/
		}
		
		if(!user.getCountry().equals("none")) { /*check if country field is not empty*/
			placeholder.setCountry(user.getCountry()); /*set placeholder country*/
		}
		
		if (!user.getNationality().equals("none")) { /*check if nationality field is not empty*/
			placeholder.setNationality(user.getNationality()); /*set placeholder nationality*/
		}
		
		if (!user.getCompany().isEmpty()) { /*check if company field is not empty*/
			placeholder.setCompany(user.getCompany()); /*set placeholder company*/
		}
		
		if(!user.getContactNumber().isEmpty()) { /*check if contact number field is not empty*/
			
			if(userRegistered.validateContact(user.getContactNumber())) { /*calls upon service to verify number with regex*/
				placeholder.setContactNumber(user.getContactNumber()); /*set placeholder contact number*/
				displayData.addObject("contact", "none"); /*set default error message*/
				
			}else { /*if contact number is invalid*/
				displayData.addObject("contact", "invalid"); /*set error message for contact number*/
			}
		}
		
		if (!user.getJob().isEmpty()) { /*checks if job field is not empty*/
			placeholder.setJob(user.getJob()); /*set placeholder job*/
		}
		
		if (!user.getAddress().isEmpty()) { /*checks if address field is empty*/
			placeholder.setAddress(user.getAddress()); /*set placeholder address*/
		}
		
		/**
		 * Final stop to check if all placeholder fields specified below is null or is in their default state
		 * Sets their value to user information retrieved data: see line 109
		 */
		if (placeholder.getDisplayName() == null) placeholder.setDisplayName(personalInfo.getDisplayName());
		if (placeholder.getCity() == null) placeholder.setCity(personalInfo.getCity());
		if (placeholder.getCountry().equals("none") || placeholder.getCountry() == null) placeholder.setCountry(personalInfo.getCountry());
		if (placeholder.getNationality().equals("none") || placeholder.getNationality() == null) placeholder.setNationality(personalInfo.getNationality());
		if (placeholder.getContactNumber() == null) placeholder.setContactNumber(personalInfo.getContactNumber());
		if (placeholder.getJob()==null) placeholder.setJob(personalInfo.getJobPosition());
		if (placeholder.getCompany()== null) placeholder.setCompany(personalInfo.getCompany());
		if (placeholder.getAddress() == null) placeholder.setAddress(personalInfo.getAddress());
		if (placeholder.getBiography()== null) placeholder.setBiography(personalInfo.getBio());
		
		/*calls service to update public information while passing the field values of placeholder*/
		userRegistered.updatePublicInfo(loguser.getid(), placeholder.getContactNumber(), placeholder.getJob(), 
				placeholder.getDisplayName(), placeholder.getAddress(),	placeholder.getCountry(), placeholder.getCity(), 
				placeholder.getNationality(), placeholder.getBiography(), placeholder.getCompany());
	
		displayData.addObject("user", user); /*set user object as user for default values*/
		displayData.addObject("UID",loguser.getid()); /*set userID to authenticated user*/
		displayData.setViewName("profile-edit"); /*returns profile edit file name as view name*/
		
		return displayData; /*returns model and view*/
	}
	
	
	/**
	 * Maps the URL with /change-image and process the data input on edit profile page
	 * @return Model and view to pass models and display it inside the view
	 * @param MultipartFile image to take a file for processing profile image
	 * @param Multipartfile banner to take a file for processing banner image
	 * 
	 */
	@PostMapping("/change-image")
	public ModelAndView changeImage(@RequestParam("displayPicture") MultipartFile image, @RequestParam("bannerPicture") MultipartFile banner) {
		
		if(userRegistered.getPublicInfo(loguser.getid())==null) { /*checks if user information record for the target user is null*/
			
			/*create new user information with default values*/
			UserInformation newPublicProfile = new UserInformation("default", "default", userRegistered.selectUser(loguser.getid()).getFirstName()
					+ " " + userRegistered.selectUser(loguser.getid()).getLastName(), "default", "default", "default",
					"default", "default", "default", loguser.getid());
			
			userRegistered.setPublicInfo(newPublicProfile); /*calls on service to insert new record to user information*/
		}
		
		UserInformation profile = userRegistered.getPublicInfo(loguser.getid()); /*retrieves user information of specified user*/
		ModelAndView displayData = new ModelAndView();
	
		if (image !=null || !image.isEmpty()) { /*checks if image field has value*/
			
			/*string for path and filename, context retrieves the classpath of the web*/
			String filename = context.getRealPath("/") + "usersProfile\\displayPicture\\" + profile.getDisplayName() 
					+image.getOriginalFilename();
			try {
				image.transferTo(new File(filename)); /*uploads the file to the project directory*/
				profile.setDisplayPicture(profile.getDisplayName() + image.getOriginalFilename()); /*set the profile image path*/

			}catch(IOException e) {
				e.printStackTrace(); /*catches any exception thrown by the process*/
			}
			
		}
		if (banner != null || !banner.isEmpty()) { /*checks if banner field has value*/
			
			/*string for path and filename, context retrieves the classpath of the web*/
			String filename = context.getRealPath("/") + "usersProfile\\bannerPicture\\" +  profile.getDisplayName() + banner.getOriginalFilename();
			
			try {
				banner.transferTo(new File(filename)); /*uploads the file to project directory*/
				profile.setBanner(profile.getDisplayName() + banner.getOriginalFilename()); /*set the banner image path*/
				
			}catch(IOException e) {
				e.printStackTrace(); /*catches any exception thrown by the process*/
			}
		}
		
		/*updates the user information for image path and banner path*/
		userRegistered.updateImage(profile.getBanner(), profile.getDisplayPicture(), loguser.getid()); 
		
		displayData.setViewName("redirect:/edit-profile"); /*set view name to redirect to edit profile page*/
		return displayData; /**return model and view*/
	}
	
	/**
	 * Maps the URL with /edit-biography and process the data input on edit profile page
	 * @return Model and view to pass models and display it inside the view
	 * @param String bio takes in value from input field named "biography"
	 * 
	 */
	@PostMapping("/edit-biography")
	public ModelAndView appendBio(@RequestParam("biography") String bio) {
		ModelAndView displayData = new ModelAndView();

		if(userRegistered.getPublicInfo(loguser.getid())==null) { /*checks if user has no user information record*/
			
			/*create new user information with default values*/
			UserInformation newPublicProfile = new UserInformation("default", "default", userRegistered.selectUser(loguser.getid()).getFirstName()
					+ " " + userRegistered.selectUser(loguser.getid()).getLastName(), "default", "default", "default",
					"default", "default", "default", loguser.getid());
			
			
			userRegistered.setPublicInfo(newPublicProfile);/*insert new user information record*/
		}
		
		UserInformation personalInfo = userRegistered.getPublicInfo(loguser.getid()); /*retrieves user information record of target user*/
		UserContainer placeholder = new UserContainer(); //placeholder class
		
		/*
		 * Checks if placeholder with the given field below is null, set the retrieved user information values to 
		 * the corresponding placeholder field
		 * */
		if (placeholder.getDisplayName() == null) placeholder.setDisplayName(personalInfo.getDisplayName());
		if (placeholder.getCity() == null) placeholder.setCity(personalInfo.getCity());
		if (placeholder.getCountry() == null || placeholder.getCountry().equals("none")) placeholder.setCountry(personalInfo.getCountry());
		if (placeholder.getNationality()==null || placeholder.getNationality().equals("none")) placeholder.setNationality(personalInfo.getNationality());
		if (placeholder.getContactNumber() == null) placeholder.setContactNumber(personalInfo.getContactNumber());
		if (placeholder.getJob()==null) placeholder.setJob(personalInfo.getJobPosition());
		if (placeholder.getCompany()==null) placeholder.setCompany(personalInfo.getCompany());
		if (placeholder.getAddress() ==null) placeholder.setAddress(personalInfo.getAddress());
		
		if(!bio.isEmpty()) { /*checks if bio field is not empty*/
			placeholder.setBiography(bio); /*set the placeholder bio*/
		}
		
		/*calls service to interact with repository which will call method to update user information record*/
		userRegistered.updatePublicInfo(loguser.getid(), placeholder.getContactNumber(), placeholder.getJob(), 
				placeholder.getDisplayName(), placeholder.getAddress(), placeholder.getCountry(), 
				placeholder.getCity(), placeholder.getNationality(), placeholder.getBiography(), placeholder.getCompany());
		
		displayData.addObject("user", userRegistered.getPublicInfo(loguser.getid())); /*add object for default values*/
		displayData.addObject("UID",loguser.getid()); /*object needed for header*/
		displayData.setViewName("redirect:/edit-profile"); /*set view name to redirect to edit-profile*/
		
		return displayData; /*return model and view*/
	}
	
	@GetMapping("/education/{id}")
	public ModelAndView educationDetails(@PathVariable("id")int id, @ModelAttribute("education")EducationQualification education) {
		ModelAndView displayData = new ModelAndView();
		displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*retrieves user profile of the authenticated user*/
		displayData.addObject("UID",loguser.getid()); /*object needed for header*/
		displayData.addObject("educationDisplayUserId", id);
		displayData.addObject("Educations", userRegistered.educationBackground(id));
		displayData.setViewName("EducationDetails");
		
		//retrieve all education by user ID
		return displayData;
	}
	
	@GetMapping("/deleteEducationBackground")
	public String deleteEducation(@RequestParam("e") int eid) {
		userRegistered.deleteEducation(eid);
		return "redirect:/education/" + loguser.getid();
	}
	
	@PostMapping("/addEducationBackground")
	public String addEducation(@ModelAttribute("education")EducationQualification education) {
		education.setUserId(loguser.getid());
		if(education.getAchievement().isEmpty()) education.setAchievement("none");
		userRegistered.addEducation(education);
		return "redirect:/education/" + loguser.getid();
	}
	
	@GetMapping("/JobExperience/{id}")
	public ModelAndView jobExperienceDetails(@PathVariable("id")int id, @ModelAttribute("job")JobExperiences job) {
		ModelAndView displayData = new ModelAndView();
		displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*retrieves user profile of the authenticated user*/
		displayData.addObject("UID",loguser.getid()); /*object needed for header*/
		displayData.addObject("jobDisplayUserId", id);
		displayData.addObject("careers", userRegistered.jobExperiences(id));
		displayData.setViewName("JobExperiencesDetails");
		
		//retrieve all education by user ID
		return displayData;
	}
	
	@GetMapping("/deleteJobExp")
	public String deleteJobExperience(@RequestParam("id") int id) {
		userRegistered.deleteJobExperience(id);
		return "redirect:/JobExperience/" + loguser.getid();
	}
	
	@PostMapping("/addJobExp")
	public String addJobExperience(@ModelAttribute("job")JobExperiences job) {
		job.setUserId(loguser.getid());
		userRegistered.addJobExperience(job);
		return "redirect:/JobExperience/" + loguser.getid();
	}
}

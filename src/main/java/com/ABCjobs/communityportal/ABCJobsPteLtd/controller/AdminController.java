package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;


import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Admin;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.BulkEmail;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.UserInformation;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.AdminService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.BulkEmailService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * AdminController --- handles URL for admin processes for both get and post method
 * @author John Daniel Tejero
 */
@Controller
public class AdminController {

	@Autowired
	UserService registry; //service responsible for UserRepository and UserInformationRepository
	
	@Autowired
	LoginUserService userLogged; //service responsible for identifying authenticated users
	
	@Autowired
	BulkEmailService bulkEmailService; //service responsible for interacting with email repository
	
	@Autowired
	AdminService administrator; //service that interacts with admin table by DAO
	
	/**
	 * Maps the URL with /dashboard and retrieves the corresponding view for dashboard page
	 * @return Model and view to pass models and display it inside the view
	 * 
	 */
	@GetMapping("/dashboard")
	public ModelAndView dashboard(@ModelAttribute("emailForm")BulkEmail emailForm) {
		
		ModelAndView displayData = new ModelAndView();	
		
		List<UserContainer> users = registry.retrieveUsersforAdmin(); /*gets all users registered and store it in list*/
		List<BulkEmail> emailList = new ArrayList<BulkEmail>();
		
		for (BulkEmail email: bulkEmailService.collectAllEmail()) { /*loops thru all email*/
			
			Admin adminUser = administrator.selectAdmin(email.getAdminId()); /*retrieves admin record*/
			UserContainer tempUser = registry.selectUser(adminUser.getUserId()); /*retrieves user record*/
			email.setAuthor(tempUser.getFirstName().concat(" " + tempUser.getLastName())); /*assign author name*/
			emailList.add(email); /*adds to arrayList*/
			
		}
		
		displayData.setViewName("admin-dashboard"); /*default view for dashboard*/
		displayData.addObject("UID",userLogged.getid()); /*get ID of authenticated user*/
		displayData.addObject("userProfile", registry.selectUser(userLogged.getid())); /*gets the profile of authenticated user for header*/
		displayData.addObject("listEmail", emailList); /*sets listEmail as object for all email*/
		
		if(users != null) { /*checks if users List has content*/
			displayData.addObject("usersList", users); /*add lists of users as object for view*/
		}
		
		return displayData; /*return model and view*/
	}
	
	/**
	 * Maps the URL for /user-delete and process end-user request from interaction
	 * @param id takes in value of ID which targets a specific user
	 * @return model and view type to pass data as object of the view
	 */
	@PostMapping("/user-delete")
	public ModelAndView deleteUser(@RequestParam("UID") int id) {
		
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("redirect:/dashboard"); /*set view name to redirect user*/
		registry.deleteUser(id); /*calls service to call for appropriate method DELETE from repository*/

		return displayData; /*return model and view*/
	}
	
	/**
	 * Maps the URL for /admin and response with the appropriate view
	 * @param id takes in value of ID which targets a specific user
	 * @param UserContainer type to get all values from input fields mapped by model attribute
	 * @return model and view type to pass data and use it inside the view
	 */
	@GetMapping("/adminEditProfile")
	public ModelAndView editProfile(@ModelAttribute ("userToModify")UserContainer user, @RequestParam ("UID") int id) {
		ModelAndView displayData = new ModelAndView();
		
		displayData.setViewName("AdminEdit"); /*set default view for editing profile page using administrator*/
		displayData.addObject("userProfile", registry.selectUser(userLogged.getid())); /*for profile display in header*/
		displayData.addObject("user", registry.selectUser(id)); /*set default value for each fields*/
		displayData.addObject("id",id); /*sets the id of the user*/
		
		return displayData; /*return model and view*/
	}
	
	/**
	 * Maps the URL for /admin and process end-user request from interaction
	 * @param id takes in value of ID which targets a specific user
	 * @param UserContainer type to get all values from input fields mapped by model attribute
	 * @return model and view type to pass data and use it inside the view
	 */
	@PostMapping("/admin-update-user-info")
	public ModelAndView saveModifiedProfile(@ModelAttribute("userToModify")UserContainer user, @RequestParam("UID") int id) {
		ModelAndView displayData = new ModelAndView(); 
		displayData.setViewName("redirect:/adminEditProfile?UID="+id); /*set the view name to redirect user to admin edit profile page*/
		
		//for validation process
		boolean firstNameSatisfied = false; /*set default value of fn field satisfaction to false*/
		boolean lastNameSatisfied = false; /*set default value of ln field satisfaction to false*/
		
		User updateUser = registry.selectUserByID(id); /*retrieve user by using ID*/
		
		/*creates new user container and assign values from updateUser object*/
		UserContainer updateContainer = new UserContainer(updateUser.getFirstName(), updateUser.getLastName(), 
				updateUser.getEmailAddress(), updateUser.getPassword());	
		updateContainer.setUserID(id); /*set container ID to userID*/
		
		//first name
		if(!user.getFirstName().isEmpty()) { /*checks if first name field is not empty*/
			
			if (registry.validateName(user.getFirstName())) { /*calls service to validate if first name satisfies constraints*/
				firstNameSatisfied = true; /*set firstNameSatisfied to true*/
				updateContainer.setFirstName(user.getFirstName()); /*set container's first name to first name field value*/
			}
		}
		
		//last name
		if(!user.getLastName().isEmpty()) { /*checks if last name field is not empty*/
			
			if (registry.validateName(user.getLastName())){ /*calls service to validate if last name satisfies constraints*/
				lastNameSatisfied = true; /*set lastNameSatisfied to true*/
				updateContainer.setLastName(user.getLastName()); /*set container's last name to the value of last name field*/
			}
		}
		
		if (firstNameSatisfied && lastNameSatisfied) { /*checks if both satisfied boolean is true*/
			registry.updateUserInformation(updateContainer); /*execute query by calling service method responsible for calling appropriate DAO*/
		}
		
		//primary information
		if(registry.getPublicInfo(id)==null) { /*checks if user has no existing record of user information*/
			
			/*create new UserInformation object with default values*/
			UserInformation newPublicProfile = new UserInformation("default", "default",registry.selectUser(id).getFirstName()
					+ " " + registry.selectUser(id).getLastName(), "default", "default", "default", 
					"default", "default", "default", id);
			
			/*insert new userinformation record*/
			registry.setPublicInfo(newPublicProfile);
		}
		
		UserInformation personalInfo = registry.getPublicInfo(id); /*retrieves user information of specified user*/
		
		//field validation
		if (!user.getDisplayName().isEmpty()) { /*check if display name field is not empty*/
			updateContainer.setDisplayName(user.getDisplayName()); /*set container display name*/
		} 
		
		if(!user.getCity().isEmpty()) { /*checks if city field is not empty*/
			updateContainer.setCity(user.getCity()); /*set container city*/
		}
		
		if(!user.getCountry().equals("none")) { /*checks if country field has no value of none*/  
			updateContainer.setCountry(user.getCountry()); /*set container country*/
		}
		if (!user.getNationality().equals("none")) { /*checks if nationality has no value of none*/
			updateContainer.setNationality(user.getNationality()); /*set container nationality*/
		}
		
		if (!user.getCompany().isEmpty()) { /*checks if company field is not empty*/
			updateContainer.setCompany(user.getCompany()); /*set container company*/
		}
		
		if(!user.getContactNumber().isEmpty()) { /*check if contact number field is not empty*/
			if(registry.validateContact(user.getContactNumber())) { /*calls on service to validate contact number*/
				updateContainer.setContactNumber(user.getContactNumber()); /*set container contact number*/
			}
		}
		
		if (!user.getJob().isEmpty()) { /*check if job field is not empty*/
			updateContainer.setJob(user.getJob()); /*set container job*/
		}
		
		if (!user.getAddress().isEmpty()) { /*check if address field is not empty*/
			updateContainer.setAddress(user.getAddress()); /*set container address*/
		}
		
		/**
		 * Finally checks if container fields is not null and not in default field.
		 * Set the value of fields that violates the constraints to values of user information 
		 * From line 122
		 * 
		 */
		if (updateContainer.getDisplayName() == null) updateContainer.setDisplayName(personalInfo.getDisplayName());
		if (updateContainer.getCity() == null) updateContainer.setCity(personalInfo.getCity());
		if (updateContainer.getCountry().equals("none") || updateContainer.getCountry() == null) updateContainer.setCountry(personalInfo.getCountry());
		if (updateContainer.getNationality().equals("none") || updateContainer.getNationality() ==null) updateContainer.setNationality(personalInfo.getNationality());
		if (updateContainer.getContactNumber() == null) updateContainer.setContactNumber(personalInfo.getContactNumber());
		if (updateContainer.getJob()==null) updateContainer.setJob(personalInfo.getJobPosition());
		if (updateContainer.getCompany()==null) updateContainer.setCompany(personalInfo.getCompany());
		if (updateContainer.getAddress() ==null) updateContainer.setAddress(personalInfo.getAddress());
		if (updateContainer.getBiography()==null) updateContainer.setBiography(personalInfo.getBio());
		
		/*calls service to execute method that interacts with repository for updating user information*/
		registry.updatePublicInfo(id, updateContainer.getContactNumber(), updateContainer.getJob(), updateContainer.getDisplayName(), 
				updateContainer.getAddress(), updateContainer.getCountry(), updateContainer.getCity(), updateContainer.getNationality(), 
				updateContainer.getBiography(), updateContainer.getCompany());
		
		return displayData; /*return model and view*/
	}
	
	/**
	 * Method for post mapping of submit email.
	 * @return model and view which directs user to admin-dashboard page.
	 */
	@PostMapping("/dashboard")
	public ModelAndView submitEmail(@Valid @ModelAttribute("emailForm")BulkEmail emailForm, BindingResult result) {
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("admin-dashboard"); /*set view name*/
		
		List<UserContainer> users = registry.retrieveUsersforAdmin(); /*gets all users registered and store it in list*/
		List<BulkEmail> emailList = new ArrayList<BulkEmail>();
		
		for (BulkEmail email: bulkEmailService.collectAllEmail()) { /*loops thru all email*/	
			Admin adminUser = administrator.selectAdmin(email.getAdminId()); /*retrieves admin record*/
			UserContainer tempUser = registry.selectUser(adminUser.getUserId()); /*retrieves user record*/
			email.setAuthor(tempUser.getFirstName().concat(" " + tempUser.getLastName())); /*assign author name*/
			emailList.add(email); /*adds to arrayList*/
		}

		displayData.addObject("UID",userLogged.getid()); /*get ID of authenticated user*/
		displayData.addObject("userProfile", registry.selectUser(userLogged.getid())); /*gets the profile of authenticated user for header*/
		displayData.addObject("listEmail", emailList); /*sets listEmail as object for all email*/
		
		if(users!=null) { /*checks if users List has content*/
			displayData.addObject("usersList", users); /*add lists of users as object for view*/
		}
		
		if (result.hasErrors()) { /*return immediately if there is errors*/
			return displayData;
		}
		
		if (bulkEmailService.validate(emailForm)) {
			
			emailForm.setStatus("draft"); /*upon submitting set status to draft for review*/
			emailForm.setAdminId(administrator.selectAdminById(userLogged.getid()).getAdminId()); /*set the author*/
			bulkEmailService.createEmail(emailForm); /*calls BulkEmailService to add new bulk email*/
			
			displayData.setViewName("redirect:/dashboard");
		}else {
			displayData.addObject("emailError","invalid email address");
		}
		
		return displayData;
	}
	
	/**
	 * Method that deletes email
	 * @param id selects email ID to be deleted
	 * @return redirect to dashboard
	 */
	@PostMapping("/deleteMail")
	public String deleteMail(@RequestParam("EID") int id) {
		bulkEmailService.deleteEmail(id);
		return "redirect:/dashboard";
	}
	
	/**
	 * Method for applying the send bulk email
	 * @param id which locates the bulk email Id
	 * @return String type of argument which is the view name
	 */
	@PostMapping("/sendBulk")
	public String sendBulk(@RequestParam("beid")int id) {
		bulkEmailService.sendBulk(id);
		return "redirect:/dashboard";
	}
}

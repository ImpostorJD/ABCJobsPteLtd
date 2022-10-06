package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.EmailService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * RegisterController --- handles URL for registration processes for both post and get method
 * @author John Daniel Tejero
 */
@Controller
public class RegisterController {

	private PasswordEncoder passwordencoder; /*for password encoding*/
	
	@Autowired
	UserService userregistered; //service responsible for UserRepository and UserInformationRepository
	
	@Autowired
	LoginUserService logged; //service responsible for identifying authenticated users
	
	@Autowired
	EmailService emailServices; //service responsible for SMTP utility
	
	@Autowired
	public RegisterController(PasswordEncoder encode) { /*sets the password encoder*/
	this.passwordencoder = encode;
	}
	/**
	 * Maps the URL with /Register and retrieves the corresponding view for registration page
	 * @return Model and view to pass models and display it inside the view
	 * @param UserContainer model for retrieving data from form with spring form tag library
	 * 
	 */
	@GetMapping("/Register")
	public ModelAndView registration(@ModelAttribute("registerUser")UserContainer user) {
		
		ModelAndView displayData = new ModelAndView();
		
		displayData.setViewName("Register"); /*default view for registration*/
		displayData.addObject("errorFN", "none"); /*default error message*/
		displayData.addObject("errorLN", "none"); /*default error message*/
		displayData.addObject("errorEmail", "none"); /*default error message*/
		displayData.addObject("errorCPW", "none"); /*default error message*/
		
		if(logged.authenticatedUser()) { /*checks if user is authenticated*/
			displayData.setViewName("redirect:/home"); /* set view as redirect to home page*/
		}
		
		return displayData; /*return model and view*/
	}
	
	/**
	 * Maps the URL with /Register and processes the data submitted in the form inside register view
	 * @return Model and view to pass models and display it inside the view
	 * @param UserContainer model for retrieving data from form with spring form tag library and checks if it is valid with hibernate validation
	 * @param Binding result takes in result taken from validation under model used
	 * @param Retrieves singular field to validate password
	 * 
	 */
	@PostMapping("/Register")
	public ModelAndView registerPrompt(@Valid @ModelAttribute("registerUser")UserContainer user, 
			BindingResult result, @RequestParam("cpw") String cpw) {
		
		Boolean fnIsSatisfied = false; //for checking if the constraint in field is satisfied
		Boolean lnIsSatisfied = false; //for checking if the constraint in field is satisfied
		Boolean emailIsSatisfied = true; //for checking if the constraint in field is not satisfied
		Boolean cpwIsSatisfied = false; //for checking if the constraint in field is satisfied
		
		ModelAndView displayData = new ModelAndView();
		
		displayData.setViewName("Register"); /*default view for Register*/
		displayData.addObject("errorFN", "none"); /*default error message*/
		displayData.addObject("errorLN", "none"); /*default error message*/
		displayData.addObject("errorEmail", "none"); /*default error message*/
		displayData.addObject("errorCPW", "none"); /*default error message*/
		
		/*validation for fields*/
		//password
		if (cpw.isEmpty()) { /*checks if cpw field has no value*/

			displayData.addObject("errorCPW", "this field cannot be empty"); /*set error message for cpw*/
			
		}else { /*default process if not satisfied*/
			
			if (!user.getPassword().equals(cpw)) { /*checks if cpw is not equals to password field*/
				displayData.addObject("errorCPW", "mismatched password input"); /*set error message for cpw*/
			}else {
				cpwIsSatisfied = true; /*set cpwIsSatisfied boolean to true*/
			}
		}
		
		if (result.hasErrors()) { /*checks if any of the modelAttribute fields has error generated from hibernate validator*/
			return displayData;/*immediately return display if this catches an error*/
		}
		
		//first name validation
		if (!userregistered.validateName(user.getFirstName())) { /*checks if first name satisfies regex under service*/
			displayData.addObject("errorFN", "invalid name format"); /*set error message for first name*/
		}else {
			fnIsSatisfied = true; /*set fnIsSatisfied boolean to true*/ 
		}
		
		//last name validation
		if (!userregistered.validateName(user.getLastName())) { /*checks if last name satisfies regex under service*/
			displayData.addObject("errorLN", "invalid name format"); /*set error message for last name*/
		}else { 
			lnIsSatisfied = true; /*set lnIsSatisfied boolean to true*/
		}
		
		//email validation
		if (!userregistered.validateEmail(user.getEmailAddress())) { /*checks if email satisfies regex under service*/
			
			displayData.addObject("errorEmail", "invalid email format"); /*set error message for email*/
			emailIsSatisfied = false; /*set emailIsSatisfied to false*/
			
		}else {

			User checkCreds = userregistered.getUser(user.getEmailAddress()); //retrieves user with specified email
			if (checkCreds != null) { /*checks if a user is retrieved*/
				displayData.addObject("errorEmail", "email already in use"); /*set error message for email*/
				emailIsSatisfied = false; /*set emailIsSatisfied to false*/
			}
		}
		
		
		if (fnIsSatisfied && lnIsSatisfied && emailIsSatisfied && cpwIsSatisfied) { /*checks if all boolean is satisfied*/	
			user.setPassword(passwordencoder.encode(user.getPassword()));
			userregistered.addUser(user); /*calls service to add user in the database with repository*/
			displayData.setViewName("redirect:/confirmationEmail?U=" + user.getEmailAddress()); /*redirect user to confirmation page*/
		}
		return displayData; /*returns model and view*/
	}
	
	/**
	 * Maps the URL with /confirmationEmail and retrieves the appropriate view
	 * @return Model and view to pass models and display it inside the view
	 * @param String email for displaying the email used for registration and pending of account activation
	 * 
	 */
	@GetMapping("/confirmationEmail")
	public ModelAndView activateAccount(@RequestParam("U")String email) {
		
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("Confirm-Email"); /*default view for confirm-email*/
		displayData.addObject("user", email); /*add email as an object for display*/
		
		if(logged.authenticatedUser()) {/*checks if user is authenticated*/
			displayData.setViewName("redirect:/home"); /*set view name as redirection to home*/
		}
		
		return displayData; /*return model and view*/
	}
	
	/**
	 * Maps the URL with /Register-success and retrieves the corresponding view
	 * @return String type which is the file name of the view
	 * 
	 */
	@PostMapping("/verifyUser")
	public String accountActivation(@RequestParam("email") String email, HttpServletRequest request) {
		String siteUrl = request.getRequestURL().toString();
		siteUrl = siteUrl.replace(request.getServletPath(), "");
		try {
			emailServices.sendAccountActivation(email, "Account Activation", siteUrl);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/login";
	}
	@GetMapping("/Register-Success")
	public String successfulRegistration(@RequestParam("u")String email) {
		userregistered.activateAccount(email);
		if(logged.authenticatedUser()) { /*checks if user is authenticated*/
			return "redirect:/home"; /*return a redirection string to home*/
		}
		return "RegistrationThankYou"; /*return default JSP appropriate for the URL*/
		
	}
}

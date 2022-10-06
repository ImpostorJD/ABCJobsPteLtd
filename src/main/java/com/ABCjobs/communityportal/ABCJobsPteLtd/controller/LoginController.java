package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.ChangePassService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.EmailService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * LoginController --- handles URL for login and forget password for both get and post method
 * @author John Daniel Tejero
 */
@Controller
public class LoginController {
	
	private PasswordEncoder passwordencoder;
	@Autowired
	UserService userRegistered; //service responsible for UserRepository and UserInformationRepository 
	@Autowired
	LoginUserService loguser; //service responsible for identifying authenticated users
	@Autowired
	ChangePassService userchangepass; //service responsible for temporarily storing email and generating code verification
	@Autowired
	EmailService emailServices;
	
	@Autowired
	public LoginController(PasswordEncoder encode) {
	this.passwordencoder = encode;
	}
	
	/**
	 * Maps the URL with /login and retrieves the corresponding view
	 * @return the jsp file name as string for view mapping.
	 * 
	 */
	@GetMapping("/login")
	public String loginPage() {
	
		if(loguser.authenticatedUser()) { /*checks if user is authenticated*/
			return "redirect:/home"; /*returns user to home page if authenticated*/
		}
		
		return "loginCustom"; /*directs user to login page*/
	}
	
	/**
	 * Maps the URL with /password-recovery and retrieves the corresponding view
	 * @return a model and view with ModelAndView class, in which setViewName is the file name of the view, 
	 * and the objects are added with .addObject method which can be embedded inside the view.
	 * 
	 */
	@GetMapping("/password-recovery")
	public ModelAndView recoveryPage() {
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("forgot-password");
		
		if(loguser.authenticatedUser()) {
			displayData.setViewName("redirect:/home");
		}
		
		displayData.addObject("errorMSG", "none");
		
		return displayData; /*returns model and view*/
	}
	
	/**
	 * Maps the URL with /password-recovery and processes the data sent by user in the view
	 * @param email A string parameter passed by the form with @RequestParam annotation which targets an input field with the same name as value specified
	 * @return a model and view with ModelAndView class, in which setViewName is the file name of the view, 
	 * and the objects are added with .addObject method which can be embedded inside the view.
	 */
	@PostMapping("/password-recovery")
	public ModelAndView recoverAccount(@RequestParam(value = "emailInput") String email){
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("forgot-password");
		displayData.addObject("errorMSG", "none");
		
		//return error message and view to stop the code from executing the rest of the code
		if (email.isEmpty()) {
			displayData.addObject("errorMSG", "field is required");
			return displayData; /*returns model and view*/
		}
		
		
		//calls upon the service to get user by means of email
		User checkCreds = userRegistered.getUser(email);
		
		
		// Checks the checkCreds to see if email is existing  
		if (checkCreds == null) {
			/*error message to be passed to JSP*/
			displayData.addObject("errorMSG", "user does not exist"); 
		}else {
			displayData.addObject("errorMSG", "none");
			displayData.setViewName("redirect:/password-change?email=" + email); /*redirect user to the next page for password change*/
		}

		return displayData; /*returns model and view*/
	}
	
	/**
	 * Maps the URL with /forget-success and retrieves the corresponding view
	 * @return String type which is the file name of the view to be displayed to the web site
	 */
	@GetMapping("/forget-success")
	public String recoveredAccount() {
		
		/*checks if user is authenticated*/
		if(loguser.authenticatedUser()) {
			return "redirect:/home";/*return user to home if authenticated*/
		}
		return "forget-password-success";/*return user to appropriate view*/
	}
	
	
	/**
	 * Maps the URL with /password-change and retrieves the corresponding view
	 * @return ModelAndView type in which the view is specified with the setViewName
	 */
	@GetMapping("/password-change")
	public ModelAndView changePassword(@RequestParam("email")String email) {
		ModelAndView displayData = new ModelAndView();
		String verificationCode = userchangepass.generateCode();
		String text = "your verification is " + verificationCode;
		emailServices.sendVerificationCode(email, "Verification Code", text);
		displayData.addObject("email", email);
		displayData.addObject("code", verificationCode); /*code is generated randomly which is passed by the addObject*/
		displayData.setViewName("account-recovery"); /*sets the view name as the filename of the target view*/
		
		/*Set default error message*/
		displayData.addObject("pwErrorMsg", "none");
		displayData.addObject("cpwErrorMsg", "none");
		
		if(loguser.authenticatedUser()) { /*validates user authentication*/
			displayData.setViewName("redirect:/home"); /*sets the view name as the redirect to home if user is logged in*/
		}
		
		return displayData; /*returns model and view*/
	}
	
	/**
	 * Maps the URL with /password-change and processes the data sent by user in the view
	 * @param pass takes in value from field named with "NewPass" from the view
	 * @param cpw takes in value from field named with "ConfirmPass" from the view 
	 * @return a model and view with ModelAndView class, in which setViewName is the file name of the view, 
	 * and the objects are added with .addObject method which can be embedded inside the view.
	 */
	@PostMapping("/password-change")
	public ModelAndView editEntry(@RequestParam("NewPass") String pass, @RequestParam("ConfirmPass") String cpw, @RequestParam("email")String email) {
		
		ModelAndView displayData = new ModelAndView();
		
		displayData.setViewName("account-recovery"); /*set view name with target JSP page*/
		displayData.addObject("pwErrorMsg", "none"); /*set default error message*/
		displayData.addObject("cpwErrorMsg", "none"); /*set default error message*/
		
		//password validation
		if (pass.isEmpty() || cpw.isEmpty()) { /*checks if either field is empty*/
			if (pass.isEmpty()) { /*checks if pass field is empty*/
				displayData.addObject("pwErrorMsg", "this field cannot be empty"); /*add error message as an object*/
			}
			if (cpw.isEmpty()) { /*checks if cpw field is empty*/
				displayData.addObject("cpwErrorMsg", "this field cannot be empty"); /*add error message as an object*/
			}
		}else { /*execute if all field has value*/
			
			if (!pass.equals(cpw)) { /*validates if pass is not equals to cpw*/
				displayData.addObject("cpwErrorMsg", "mismatching password"); /*add error message as an object*/
			}else {
				pass = passwordencoder.encode(pass);
				userRegistered.changePass(pass, email); /*calls service to provide appropriate CRUD operation from repository*/
				displayData.addObject("pwErrorMsg", "none"); /*set default error message*/
				displayData.addObject("cpwErrorMsg", "none"); /*set default error message*/
				displayData.setViewName("redirect:/forget-success"); /*set view name as redirect user to forget-success*/
				
			}
			
		}
		return displayData; /*returns model and view*/
	}
}

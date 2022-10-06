package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Thread;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadUpvote;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.RandomizedUserSuggestionService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.ThreadService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * HomeController --- handles URL for home page for both authenticated and unauthenticated users, error page, and admin home page
 * @author John Daniel Tejero
 */
@Controller
public class HomeController implements ErrorController{

	@Autowired
	UserService userRegistered; //service responsible for UserRepository and UserInformationRepository
	@Autowired
	LoginUserService loguser; //service responsible for identifying authenticated users
	@Autowired
	RandomizedUserSuggestionService randomusers; //service responsible for user suggestions
	@Autowired
	ThreadService threadPosted;
	
	/**
	 * Maps the URL with / and retrieves the corresponding view for landing page
	 * @return Model and view to pass models and display it inside the view
	 * 
	 */
	@GetMapping("/")
	public ModelAndView landingPage() {
		ModelAndView displayData = new ModelAndView();
		
		displayData.setViewName("index"); /*default view name for index*/
		
		if(loguser.authenticatedUser()) { /*checks whether a user is authenticated*/
			
		displayData.setViewName("redirect:/home");/*set view name as redirection to home page*/
		
		}
	
		return displayData; /*return model and view*/
	}
	
	/**
	 * Maps the URL with /home and retrieves the corresponding view for home page
	 * @return Model and view to pass models and display it inside the view
	 * 
	 */
	@GetMapping("/home")
	public ModelAndView authHomePage(@ModelAttribute("threadModel")Thread thread) {		
		ModelAndView displayData = new ModelAndView(); 
		displayData.setViewName("home"); /*default view name for home page*/
		displayData.addObject("UID", loguser.getid()); /*get ID of authenticated user*/
		displayData.addObject("Threads", threadPosted.postedThreads());
		displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*get user information of authenticated user*/
		displayData.addObject("usersto", randomusers.suggestedUsers()); /*get lists of three random users*/
		return displayData; /*return model and view*/
	}
	
	/**
	 * Maps the URL with /logout and retrieves the corresponding view for logout
	 * @return a string redirecting users to landing page
	 * 
	 */
	@GetMapping("/logout")
	public String logout() {
		return "redirect:/"; /*returns a redirection*/
	}

	/**
	 * Maps the URL for default error page and retrieves the corresponding view
	 * @return Model and view to pass models and display it inside the view
	 * @param takes in a parameter as httpServletRequest for processing appropriate error
	 * 
	 */
	@GetMapping("/error")
	public ModelAndView handleError(HttpServletRequest req) { 
		
		ModelAndView displayData = new ModelAndView();
		if (loguser.authenticatedUser()) {
			displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*profile display for header*/
		}
		displayData.setViewName("error"); /*default view for error*/

		Object status = req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE); //gets error status as object
		
		 if (status != null) { /*checks if status retrieved an error as object*/
			 
	            int statusCode = Integer.parseInt(status.toString()); /*converts status code to int*/
	           
	            displayData.addObject("code", statusCode); /*takes in error code for code display in the view*/
	            
	            if (statusCode == HttpStatus.NOT_FOUND.value()) { /*checks if error is 404*/
	                displayData.addObject("error", "The page you are trying to view cannot be found"); /*set specific error message*/
	                displayData.addObject("imgErr", "images/404notfound.png");
	                
	            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) { /*checks if error is 500*/
	            	
	            	displayData.addObject("error", "The server has encountered an error"); /*set specific error message*//*set specific error message*/
	            	displayData.addObject("imgErr", "images/500internalerror.png");
	            	
	            } else if (statusCode == HttpStatus.FORBIDDEN.value()) { /*checks if error is 403*/
	            	
	            	displayData.addObject("error", "You do not have permission to view this page"); /*set specific error message*/
	            	displayData.addObject("imgErr", "images/403forbidden.png");
	            	
	            }else { /*default error message*/
	            	
	            	displayData.addObject("error","There was an error"); /*set error message*/
	            	displayData.addObject("imgErr", "images/ErrorFront.png");
	            }
	        }
		return displayData; /*return model an view*/
		
	}
	
}

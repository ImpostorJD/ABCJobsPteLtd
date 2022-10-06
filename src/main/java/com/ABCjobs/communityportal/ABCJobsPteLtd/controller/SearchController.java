package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.SearchService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * SearchController --- handles URL for Search processes for get method
 * @author John Daniel Tejero
 */
@Controller
public class SearchController {
	
	@Autowired
	UserService userRegistered; //service responsible for UserRepository and UserInformationRepository
	
	@Autowired
	LoginUserService loguser; //service responsible for identifying authenticated users
	
	@Autowired
	SearchService searchFunction; //service responsible for search function
	
	/**
	 * Maps the URL with /search and retrieves the corresponding view for search page
	 * @return Model and view to pass models and display it inside the view
	 * @param String search takes in value from input field named "search"
	 * 
	 */
	@GetMapping("/search")
	public ModelAndView getUserList(@RequestParam("search") String search) {

		ModelAndView displayData = new ModelAndView();
		
		displayData.addObject("UID", loguser.getid()); /*sets ID as the id of logged user*/
		displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*retrieves user profile of the authenticated user*/
		displayData.setViewName("search-page"); /*default view for search page*/

		List<UserContainer> results = searchFunction.searchUser(search);  /*calls upon search service to call appropriate repository method*/
		if (results!=null) { /*checks if results is not empty*/
			displayData.addObject("retrieveUsers", results); /*add result as object to view*/
		}
		
		return displayData; /*return model and view*/
	}
}

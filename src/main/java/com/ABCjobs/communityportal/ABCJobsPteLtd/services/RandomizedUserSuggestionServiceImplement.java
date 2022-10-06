package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;

/**
 * RandomizedUserSuggestionServiceImplement --- implements the method for RandomizedUserSuggestionService
 * @author John Daniel Tejero
 *
 */
@Service
public class RandomizedUserSuggestionServiceImplement implements RandomizedUserSuggestionService{

	@Autowired
	UserService registry; //service responsible for interacting with UserRepository and UserInformationService
	
	@Autowired
	LoginUserService loggedIn; //service responsible for indicating authenticated user
	
	 /**
	  * Method which randomly selects user to be displayed as suggestions
	  * @return List type containing three UserContainer objects
	  */
	@Override
	public List<UserContainer> suggestedUsers() {
		List<UserContainer> userLists = new ArrayList<UserContainer>(); 
		List<UserContainer> suggestion = registry.retrieveUsersforAdmin(); /*Retrieves all users from UserService*/
		UserContainer placeholder = new UserContainer();
	
		int count = 0; //initializing count
		
		while (count < 3) {
			placeholder = suggestion.get((int) Math.floor(Math.random()*suggestion.size())); /*randomized user*/
			
			if (placeholder !=null) { /*checks if placeholder has a record*/
				if (userLists == null) { /*checks if userLists arrayList is null*/
					userLists.add(placeholder); /*add new object to list
					*/
				}else { 
					for (UserContainer container: userLists) { /*iterates through userLists*/
						if(container.getUserID() == placeholder.getUserID()) { /*checks if placeholder is equals to random user*/
							placeholder = suggestion.get((int) Math.floor(Math.random()*suggestion.size())); /*re-randomize*/
						}
					}
				}
				if(placeholder.getUserID() == loggedIn.getid()) { /*checks if placeholder ID is equals to authenticated user's ID*/
					placeholder = suggestion.get((int) Math.floor(Math.random()*suggestion.size())); /*re-randomize*/
				}else {
					userLists.add(placeholder);/*insert new object to list*/
					count++; /*increment count*/
				}
			}
		}	 
		return userLists; /*return collection of usercontainer objects*/
	}

}

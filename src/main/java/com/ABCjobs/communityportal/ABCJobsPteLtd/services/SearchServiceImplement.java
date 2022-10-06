package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.UserInformation;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.UserInformationRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.UserRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;

/**
 * SearchServiceImplement --- implements methods for SearchService
 * @author John Daniel Tejero
 *
 */
@Service
@Transactional
public class SearchServiceImplement implements SearchService{

	@Autowired
	UserRepository searchUser; //DAO layer responsible for interacting with the table User from database
	
	@Autowired
	UserInformationRepository infoDao; //DAO later responsible for interacting with table UserInformation from database

	/**
	 * Method that returns all users that matches the name passed through parameter
	 * @param String search selects the record that matches the first and last name
	 * @return List<UserContainer> retrieved list of users collected from search
	 */
	@Override
	public List<UserContainer> searchUser(String search) {
		 List<UserContainer> retrieved = new ArrayList<>();
		 //List<User> retrievedUsers = searchUser.searchbyName(search); /*Searches through the database with custom query from UserRepository*/
		 //changed this search by name to purely retrieving user from database.
		 search = search.toLowerCase();
		 for (User userclass: searchUser.findAll()) { /*Iterate through the users retrieved*/
			 /*creates new object as placeholder*/
			 UserContainer getUser = new UserContainer(userclass.getFirstName(), userclass.getLastName(), 
					 userclass.getEmailAddress(), userclass.getPassword());
			 getUser.setUserID(userclass.getUser_Id());	
			 
			 /*creates new UserInformation Object by retrieving UserInformation from database specified by the user_id*/
			 UserInformation getUserInformation = infoDao.userProfile(getUser.getUserID());
			 
			 if(getUserInformation!=null) { /*checks if UserInformation is not null*/
				 getUser.setDisplayName(getUserInformation.getDisplayName()); /*set the display name of the placeholder*/
				 getUser.setProfileImagePath(getUserInformation.getDisplayPicture()); /*set the image path of the placeholder*/
				 
				 if (getUser.getFirstName().toLowerCase().contains(search) || getUser.getLastName().toLowerCase().contains(search) 
					|| (getUser.getDisplayName().toLowerCase().contains(search) && getUser.getDisplayName() != null) 
					|| (getUserInformation.getCity().toLowerCase().contains(search) && getUserInformation.getCity() != null) 
					|| (getUserInformation.getCompany().toLowerCase().contains(search) && getUserInformation.getCompany() != null)
					|| (getUserInformation.getCountry().toLowerCase().contains(search) && getUserInformation.getCountry() != null) 
					|| (getUserInformation.getNationality().toLowerCase().contains(search) && getUserInformation.getNationality() != null)) {
					
					 	retrieved.add(getUser); /*adds the user to the list*/
				 }
			 }else {
				 if (getUser.getFirstName().toLowerCase().contains(search) 
						 || getUser.getLastName().toLowerCase().contains(search)) {
					 retrieved.add(getUser); /*adds the user to the list*/
				 } 
			 }
					 
		 }
		 return retrieved; /*returns array list of users*/
	}	

}

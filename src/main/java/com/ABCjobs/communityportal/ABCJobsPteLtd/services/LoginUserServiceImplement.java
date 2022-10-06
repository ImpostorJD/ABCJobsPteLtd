package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.UserRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.security.IAuthenticationFacade;

/**
 * LoginUserServiceImplement --- implements the method of LoginUserService
 * @author John Daniel Tejero
 *
 */
@Service
public class LoginUserServiceImplement implements LoginUserService{
	
	@Autowired
	IAuthenticationFacade authenticationFacade; //calls on component authenticationFacade
	
	@Autowired
	UserRepository userRegistry; //DAO layer responsible for interacting with the table User from the database
	
	/**
	 * Method that retrieves the ID of authenticated user
	 * @return int ID of the authenticated user
	 */
	@Override
	public int getid() {
		/*return ID by selecting from UserRepository by means of email address taken from authenticationFacade*/
		return userRegistry.loginCheck(authenticationFacade.getAuthentication().getName().toString()).getUser_Id();
	}

	/**
	 * Method that checks if user is authenticated
	 * @return boolean of either true or false for validating user authentication
	 */
	@Override
	public boolean authenticatedUser() {
		return authenticationFacade.isAuthenticated(); /*retrieves authenticated instance and return appropriate boolean value*/
	}


}

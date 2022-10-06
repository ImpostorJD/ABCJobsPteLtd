package com.ABCjobs.communityportal.ABCJobsPteLtd.services.security;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * AuthenticationFacade --- implements the method of IAuthenticationFacade
 * @author John Daniel Tejero
 *
 */

@Component
public class AuthenticationFacade implements IAuthenticationFacade {

	/**
	 * Method that retrieves the object of authenticated users by means of Authentication class
	 * @return Authentication instance of user
	 */
	@Override
	public Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	/**
	 * Method that checks if a user is authenticated
	 * @return boolean type of true or false
	 */
	@Override
	public boolean isAuthenticated() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		 if (authentication == null || AnonymousAuthenticationToken.class.
			      isAssignableFrom(authentication.getClass())) {
			 return false;
		}
		return authentication.isAuthenticated();
	}
	
}

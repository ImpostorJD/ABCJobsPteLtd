package com.ABCjobs.communityportal.ABCJobsPteLtd.services.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.UserRepository;

/**
 * UserDetailsServiceUsers --- implements UserDetailsService for creating new user for spring security from database
 * @author John Daniel Tejero
 *
 */
@Service
public class UserDetailsServiceUsers implements UserDetailsService{
	
	/*Calls upon user repository for user processing from database*/
	private final UserRepository userRepository;

	/**
	 * Constructor for UserDetailsServiceUser
	 * @param UserRepository for assigning user repository to the UserRepository field
	 */
	public UserDetailsServiceUsers(UserRepository userRepo) {
		this.userRepository = userRepo;
	}
	
	/**
	 * Methods which loads the username and creates new Principal object for spring security
	 * @param username - is the email to be retrieved from the database
	 * @return UserPrincipal which processes the user and handles roles appropriately
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		User user = this.userRepository.loginCheck(username); /*creates new user object to search from the database*/
		
		if (user==null) { /*checks if username is not found*/
			throw new UsernameNotFoundException("email does not exist");
		}
		/*return an object that process the user from database to be of use to the spring security*/
		return new UserPrincipals(user);
	}

}

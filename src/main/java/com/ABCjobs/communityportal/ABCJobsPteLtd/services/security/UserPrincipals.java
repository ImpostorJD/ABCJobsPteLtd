package com.ABCjobs.communityportal.ABCJobsPteLtd.services.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;

/**
 * UserPrincipals --- implements UserDetails interface for assigning of roles for different access method for different types of users
 * @author John Daniel tejero
 *
 */
public class UserPrincipals implements UserDetails{

	private User user; //Creating user object
	
	/**
	 * Bean type method for encrypting password
	 * @return an encrypted password with BCrypt
	 */
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder(10);
	}
	
	/**
	 * Constructor to set the User to an object
	 */
	public UserPrincipals(User user) {
		super();
		this.user = user;
	}
	
	/**
	 * Assigns role to the user with collections.singleton for accessing the web pages
	 * @return SimpleGrantedAuthority of either admin or user which will put constraints to user access on web application
	 */
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		if (user.getRoleID() == 2) {
			return Collections.singleton(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
		return Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
	}

	/**
	 * gets the password of user from database and encrypt it
	 * @return Password encrypted by BCrypt
	 */
	@Override
	public String getPassword() {
		return this.user.getPassword();
	}

	/**
	 * gets the email address as username of the user from database
	 * @return username as email address
	 */
	@Override
	public String getUsername() {
		return this.user.getEmailAddress();
	}
	
	/**
	 * Default value for account
	 * Might change depending on web application implementation
	 * Such as additional features like account deactivation, suspension, and such
	 * @return all is default to true
	 */
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return this.user.getEnabled();
	}

}

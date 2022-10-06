package com.ABCjobs.communityportal.ABCJobsPteLtd.services.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * LoginErrorHandler --- class that implements AuthenticationFailureHandler for handling invalid authentication
 * @author John Daniel Tejero
 *
 */
@Component
public class LoginErrorHandler implements AuthenticationFailureHandler {

	@Autowired
	PasswordEncoder encoder; //built-in spring security password encoder for displaying error
	
	@Autowired
	UserService registry; //service for retrieving users from database
	
	/**
	 * overrides onAuthenticationFailure method
	 * @param HttpServletRequest for processing authentication request
	 * @param HttpServletResponse for processing authentication response
	 */
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
			
		String u = request.getParameter("username"); //retrieve username from login page
		String pw = request.getParameter("password"); //retrieve password from login page
		
		String url= "/login?"; //set default URL
		User user = registry.getUser(u); //search through database to retrieve user
		
		String error = null; //error default is null
		
		if (u.isEmpty()|| pw.isEmpty()) { /*checks if any field is empty*/
			if (u.isEmpty()) { /*assign error to username field if empty*/
				u = "empty";
			}else {
				u = encoder.encode(u); /*encrypts the email address*/
			}
			
			if(pw.isEmpty()) { /*assign error to password field if empty*/
				pw = "empty";
			}else {
				pw = encoder.encode(pw); /*encrypts the password*/
			}
			error = "EM="+u + "&" + "PW="+ pw; /*set error URL*/
		}else {
			if(user==null) { /*checks if user is not found*/
				error = "error=u";
			}
			if (user!=null && user.getPassword()!=pw) { /*checks if password is incorrect*/
				error ="error=pw";
			}
		}
		
		url = url.concat(error); /*set URL to be passed*/
		new DefaultRedirectStrategy().sendRedirect(request, response, url); /*passes request and response along with URL for redirection*/
	}

}

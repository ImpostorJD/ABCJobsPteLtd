package com.ABCjobs.communityportal.ABCJobsPteLtd.services.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

/**
 * RolesHandler --- extends AuthenticationSuccessHandler for handling any successful authentication
 * @author John Daniel Tejero
 *
 */
@Component
public class RolesHandler implements AuthenticationSuccessHandler{

	/**
	 * overrides onAuthenticationSuccess method
	 * @param HttpServletRequest for processing authentication request
	 * @param HttpServletResponse for processing authentication response
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		Collection<? extends GrantedAuthority> auth = authentication.getAuthorities(); /*gets the role of user trying to authenticate*/
		String myurl = null; //url for redirection
		
		for(GrantedAuthority gAuth : auth) {
			if(gAuth.getAuthority().equals("ROLE_ADMIN")) { /*checks if user has role admin*/
				myurl="/dashboard"; /*set url redirection*/
				break;
			}else if(gAuth.getAuthority().equals("ROLE_USER")) { /*checks if user has role user*/
				myurl="/home";  /*set url redirection*/
				break;
			} 
		}
		new DefaultRedirectStrategy().sendRedirect(request, response, myurl); /*passes request and response along with URL for redirection*/
		
	}

}

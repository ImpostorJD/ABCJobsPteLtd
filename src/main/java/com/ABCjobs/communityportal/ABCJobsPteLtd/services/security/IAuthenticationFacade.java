package com.ABCjobs.communityportal.ABCJobsPteLtd.services.security;

import org.springframework.security.core.Authentication;

/**
 * IAuthenticationFacade --- abstracts the method for retrieving current authenticated user
 * See implementation at AuthenticationFacade
 * @author John Daniel Tejero
 *
 */
public interface IAuthenticationFacade {
	Authentication getAuthentication();
	boolean isAuthenticated();
}

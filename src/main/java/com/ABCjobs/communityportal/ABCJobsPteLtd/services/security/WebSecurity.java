package com.ABCjobs.communityportal.ABCJobsPteLtd.services.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * WebSecurity --- Configuration of spring security to be implemented in the web application
 * @author John Daniel Tejero
 *
 */
@Configuration
@EnableWebSecurity
public class WebSecurity extends WebSecurityConfigurerAdapter{

	private PasswordEncoder passwordencoder;
	
	public WebSecurity(PasswordEncoder encoder){
		this.passwordencoder = encoder;
	}
	
	@Autowired
	LoginErrorHandler error; //Service for handling error upon logging in
	
	@Autowired
	RolesHandler roles; //Service for handling success upon logging in
	
	@Autowired
	private UserDetailsServiceUsers service;  //Custom service for creating users for spring security from database
	
	/**
	 * Methods which is for providing authentication from users in database
	 * @return provider containing user object from spring security
	 */
	@Bean
	public DaoAuthenticationProvider authProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(service);
		provider.setPasswordEncoder(passwordencoder);
		
		return provider;
	}
	
	/**
	 * Method that configures which authentication provider to be used 
	 * for logging users for the web application
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider());
	}

	/**
	 * Method for configuration access for any users with specific roles
	 * Configuration of login authentication and logout mechanism provided by Spring security
	 * calls on service to handle login response if success or failure
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
			/*ant matcher add all mapping*/
			.antMatchers("/Register", "/confirmationEmail", "/Register-Success",
					"/password-recovery","/forget-success","/password-change", "/verifyUser").permitAll()
			.antMatchers("/dashboard","/adminEditProfile","/admin-update-user-info","/jobposting","/createJob","/DeleteApplication").hasRole("ADMIN")
			.antMatchers("/","/css/**","/images/**","/js/**", "/login","/error","/displayPicture/**","/bannerPicture/**").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/login")
			.usernameParameter("username")
			.passwordParameter("password")
			.successHandler(roles)
			.failureHandler(error)
			.and()
			.logout()
			.invalidateHttpSession(true)
			.clearAuthentication(true)
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			.logoutSuccessUrl("/").permitAll();
	}

}

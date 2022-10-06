package com.ABCjobs.communityportal.ABCJobsPteLtd;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * AppInitializer --- implements WebApplicationInitializer for the booting spring web application.
 * @author John Daniel Tejero
 */
public class AppInitializer implements WebApplicationInitializer{

	/**
	 * onStartup bootstraps the dispatcher serlvet which implements 
	 * configuration for the dispatcher servlet
	 */
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		
		/*configures the dispatcher servlet*/
		ServletRegistration.Dynamic servletRegistration = 
				servletContext.addServlet("dispatcher", new DispatcherServlet(context));
				
		/*registers the configuration on the Appconfig as components*/
		context.register(AppConfig.class);
		servletRegistration.setLoadOnStartup(1); /*sets the loadup priority of the dispatcher serlvet as 1*/
		servletRegistration.addMapping("/");/*add mapping to the servlet*/
	
	}

	
}

package com.ABCjobs.communityportal.ABCJobsPteLtd;


import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;



/**
 * AppConfig --- extends WebMvcConfigurationSupport for mapping resources
 * @author John Daniel Tejero
 */
@Configuration
@ComponentScan(basePackages="com.ABCjobs.communityportal")
@EnableJpaRepositories
public class AppConfig extends WebMvcConfigurationSupport{
	
	
	/**
	 * Mapping the resources by using the ResourceHandlerRegistry
	 */
	@Override
	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**","/images/**","/js/**","/displayPicture/**","/bannerPicture/**")
				.addResourceLocations("classpath:/static/css/","classpath:/static/images/", "classpath:/static/js/",
									  "/usersProfile/displayPicture/","/usersProfile/bannerPicture/");
	}
	
	/**
	 * Resolves view by specifying the path file and the file extension
	 * 
	 */
	@Bean
	public InternalResourceViewResolver jspViewRevolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setViewClass(JstlView.class);
		
		return viewResolver;
	}
	
	/**
	 * Resolver which will be used for file upload in the web application
	 * Resolves the default encoding.
	 */
	@Bean
	public CommonsMultipartResolver createMultipartResolver() {
	    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
	    resolver.setDefaultEncoding("utf-8");
	    return resolver;
	}
	
	/**
	 * Data source bean which resolves the database connectivity
	 * by means of specifying the jdbc driver
	 * database server URL along with the schema to be used
	 * username and password of user with privileges in the database
	 */
	 @Bean
	    public DataSource datasource() {
	        return DataSourceBuilder.create()
	          .driverClassName("com.mysql.cj.jdbc.Driver")
	          .url("jdbc:mysql://localhost:3306/abc_jobs")
	          .username("root")
	          .password("Ks1auhJ!")
	          .build();	
	    }

}

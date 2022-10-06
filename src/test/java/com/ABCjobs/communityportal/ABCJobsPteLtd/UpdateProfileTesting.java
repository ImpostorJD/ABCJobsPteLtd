package com.ABCjobs.communityportal.ABCJobsPteLtd;


import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.UserInformation;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserServiceImplement;

@SpringBootTest
public class UpdateProfileTesting {
	
	@Autowired
	UserServiceImplement userservice;
	private UserInformation testuserinformation;
	/**
	 * This method is for unit testing Update profile upon successful registration
	 */
	@Test
	void updateProfile() {
		//searching for test user
		User testuser = userservice.getUser("ainostasia@gmail.com");
		
		//creating model for binding updates before passing to DTO as per code structure
		UserContainer testusercontainer = new UserContainer();
		testuserinformation = userservice.getPublicInfo(testuser.getUser_Id());
		if ( testuserinformation == null) { /*this condition is for newly registered user*/
			
			//creating new user information record to the database
			userservice.setPublicInfo(new UserInformation("default", "default",userservice.selectUser(testuser.getUser_Id())
					.getFirstName() + " " + userservice.selectUser(testuser.getUser_Id()).getLastName(), "default", "default", 
					"default", "none", "default", "none", testuser.getUser_Id()));
			testuserinformation = userservice.getPublicInfo(testuser.getUser_Id());
			//appending update to container then pass to userinformation
			testusercontainer.setDisplayName("Display");
			testusercontainer.setAddress("Cutcot, Pulilan, Bulacan");
			testusercontainer.setCity("Bulacan");
			testusercontainer.setCountry("Philippines");
			testusercontainer.setContactNumber("+63 939 841 6091");
			testusercontainer.setNationality("Filipino");
			testusercontainer.setJob("Software Tester");
			testusercontainer.setCompany("ABC");
			
			//final check 
			if (testusercontainer.getDisplayName() == null) testusercontainer.setDisplayName(testuserinformation.getDisplayName());
			if (testusercontainer.getCity() == null) testusercontainer.setCity(testuserinformation.getCity());
			if (testusercontainer.getCountry().equals("none") || testusercontainer.getCountry() == null) testusercontainer.setCountry(testuserinformation.getCountry());
			if (testusercontainer.getNationality().equals("none") || testusercontainer.getNationality() == null) testusercontainer.setNationality(testuserinformation.getNationality());
			if (testusercontainer.getContactNumber() == null) testusercontainer.setContactNumber(testuserinformation.getContactNumber());
			if (testusercontainer.getJob()==null) testusercontainer.setJob(testuserinformation.getJobPosition());
			if (testusercontainer.getCompany()== null) testusercontainer.setCompany(testuserinformation.getCompany());
			if (testusercontainer.getAddress() == null) testusercontainer.setAddress(testuserinformation.getAddress());
			if (testusercontainer.getBiography()== null) testusercontainer.setBiography(testuserinformation.getBio());
			
			//update through service
			userservice.updatePublicInfo(testuser.getUser_Id(), testusercontainer.getContactNumber(), testusercontainer.getJob(), 
					testusercontainer.getDisplayName(), testusercontainer.getAddress(), testusercontainer.getCountry(), 
					testusercontainer.getCity(), testusercontainer.getNationality(), testusercontainer.getBiography(), 
					testusercontainer.getCompany());
			
			//call userinformation again for updating its content
			 testuserinformation = userservice.getPublicInfo(testuser.getUser_Id());
			 
			 //asserting to check that it is not null
			 assertThat(testuserinformation.getDisplayName()).isNotNull();
			 assertThat(testuserinformation.getAddress()).isNotNull();
			 assertThat(testuserinformation.getCity()).isNotNull();
			 assertThat(testuserinformation.getCountry()).isNotNull();
			 assertThat(testuserinformation.getContactNumber()).isNotNull();
			 assertThat(testuserinformation.getNationality()).isNotNull();
			 assertThat(testuserinformation.getJobPosition()).isNotNull();
			 assertThat(testuserinformation.getCompany()).isNotNull();
			 
			 //asserting to check that testuserinformation is not in default state
			 assertThat(testuserinformation.getDisplayName()).isNotEqualTo("default");
			 assertThat(testuserinformation.getAddress()).isNotEqualTo("default");
			 assertThat(testuserinformation.getCity()).isNotEqualTo("default");
			 assertThat(testuserinformation.getCountry()).isNotEqualTo("none");
			 assertThat(testuserinformation.getContactNumber()).isNotEqualTo("default");
			 assertThat(testuserinformation.getNationality()).isNotEqualTo("none");
			 assertThat(testuserinformation.getJobPosition()).isNotEqualTo("default");
			 assertThat(testuserinformation.getCompany()).isNotEqualTo("default");
			 
			 //finally, asserting if our "intended" information is saved
			 assertThat(testuserinformation.getDisplayName()).isEqualTo("Display");
			 assertThat(testuserinformation.getAddress()).isEqualTo("Cutcot, Pulilan, Bulacan");
			 assertThat(testuserinformation.getCity()).isEqualTo("Bulacan");
			 assertThat(testuserinformation.getCountry()).isEqualTo("Philippines");
			 assertThat(testuserinformation.getContactNumber()).isEqualTo("+63 939 841 6091");
			 assertThat(testuserinformation.getNationality()).isEqualTo("Filipino");
			 assertThat(testuserinformation.getJobPosition()).isEqualTo("Software Tester");
			 assertThat(testuserinformation.getCompany()).isEqualTo("ABC");
		
		}else { /*This condition fires up if the user has pre-existing user information record*/
			//appending update to container then pass to userinformation
			testusercontainer.setAddress("Bulacan");
			testusercontainer.setCountry("Singapore");	
			testusercontainer.setJob("Software Engineer");
		
			//final check 
			if (testusercontainer.getDisplayName() == null) testusercontainer.setDisplayName(testuserinformation.getDisplayName());
			if (testusercontainer.getCity() == null) testusercontainer.setCity(testuserinformation.getCity());
			if (testusercontainer.getCountry().equals("none") || testusercontainer.getCountry() == null) testusercontainer.setCountry(testuserinformation.getCountry());
			if (testusercontainer.getNationality().equals("none") || testusercontainer.getNationality() == null) testusercontainer.setNationality(testuserinformation.getNationality());
			if (testusercontainer.getContactNumber() == null) testusercontainer.setContactNumber(testuserinformation.getContactNumber());
			if (testusercontainer.getJob()==null) testusercontainer.setJob(testuserinformation.getJobPosition());
			if (testusercontainer.getCompany()== null) testusercontainer.setCompany(testuserinformation.getCompany());
			if (testusercontainer.getAddress() == null) testusercontainer.setAddress(testuserinformation.getAddress());
			if (testusercontainer.getBiography()== null) testusercontainer.setBiography(testuserinformation.getBio());
			
			//update through service
			userservice.updatePublicInfo(testuser.getUser_Id(), testusercontainer.getContactNumber(), testusercontainer.getJob(), 
					testusercontainer.getDisplayName(), testusercontainer.getAddress(), testusercontainer.getCountry(), 
					testusercontainer.getCity(), testusercontainer.getNationality(), testusercontainer.getBiography(), 
					testusercontainer.getCompany());
			
			//call userinformation again for updating its content
			 testuserinformation = userservice.getPublicInfo(testuser.getUser_Id());
			
			//asserting to check that it is not null
			 assertThat(testuserinformation.getDisplayName()).isNotNull();
			 assertThat(testuserinformation.getAddress()).isNotNull();
			 assertThat(testuserinformation.getCity()).isNotNull();
			 assertThat(testuserinformation.getCountry()).isNotNull();
			 assertThat(testuserinformation.getContactNumber()).isNotNull();
			 assertThat(testuserinformation.getNationality()).isNotNull();
			 assertThat(testuserinformation.getJobPosition()).isNotNull();
			 assertThat(testuserinformation.getCompany()).isNotNull();
			 
			 //asserting to check that testuserinformation is not in default state
			 assertThat(testuserinformation.getDisplayName()).isNotEqualTo("default");
			 assertThat(testuserinformation.getAddress()).isNotEqualTo("default");
			 assertThat(testuserinformation.getCity()).isNotEqualTo("default");
			 assertThat(testuserinformation.getCountry()).isNotEqualTo("none");
			 assertThat(testuserinformation.getContactNumber()).isNotEqualTo("default");
			 assertThat(testuserinformation.getNationality()).isNotEqualTo("none");
			 assertThat(testuserinformation.getJobPosition()).isNotEqualTo("default");
			 assertThat(testuserinformation.getCompany()).isNotEqualTo("default");
			 
			 //finally, asserting if our "intended" information is saved;
			 assertThat(testuserinformation.getAddress()).isEqualTo("Bulacan");
			 assertThat(testuserinformation.getCountry()).isEqualTo("Singapore");
			 assertThat(testuserinformation.getJobPosition()).isEqualTo("Software Engineer");
			
		}
		
	}
}

package com.ABCjobs.communityportal.ABCJobsPteLtd;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserServiceImplement;

@RunWith(SpringRunner.class)
@SpringBootTest
class RegistrationUnitTesting {
	
	private PasswordEncoder passwordencoder;
	
	@Autowired
	RegistrationUnitTesting(PasswordEncoder encoder){
		this.passwordencoder = encoder;
	}
	
	@Autowired
	UserServiceImplement userservice;
	
	/**
	 * This method is for unit testing registration
	 */
	@Test
	void registerUser() {
		//simulating registration process
		String password = passwordencoder.encode("dad");/*this is for encrypting password*/
		UserContainer user = new UserContainer("Aino","Ishmael","ainostasia@gmail.com", password);
		
		userservice.addUser(user);/*Inserting the user*/
		
		User insertUser = userservice.getUser("ainostasia@gmail.com"); /*Retrieving user recently inserted*/
		//asserting inserted user record is not null.
		assertThat(insertUser).isNotNull();
		
		//asserting if user record is not null
		assertThat(insertUser.getUser_Id()).isNotNull();
		assertThat(insertUser.getFirstName()).isNotNull();
		assertThat(insertUser.getLastName()).isNotNull();
		assertThat(insertUser.getEmailAddress()).isNotNull();
		assertThat(insertUser.getPassword()).isNotNull();
		
		//checking user record to match this
		assertThat(insertUser.getFirstName()).isEqualTo("Aino"); 
		assertThat(insertUser.getLastName()).isEqualTo("Ishmael");
		assertThat(insertUser.getEmailAddress()).isEqualTo("ainostasia@gmail.com");
		assertThat(insertUser.getPassword()).isEqualTo(password);
		assertThat(insertUser.getRoleID()).isEqualTo(1);
	
	}
	
}

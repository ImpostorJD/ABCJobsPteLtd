package com.ABCjobs.communityportal.ABCJobsPteLtd;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.UserRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserServiceImplement;


@RunWith(SpringRunner.class) /*integration testing*/
//@RunWith(MockitoJUnitRunner.class) /*unit testing*/
@SpringBootTest
class AbcJobsPteLtdApplicationTest {
	
	private PasswordEncoder passwordencoder;
	
	@Autowired
	AbcJobsPteLtdApplicationTest(PasswordEncoder encoder){
		this.passwordencoder = encoder;
	}
	//@Mock
	//private UserRepository repo;
	
	//@InjectMocks
	@Autowired
	UserServiceImplement userservice;
	//@Autowired
	//LoginUserService login;

	@Before
	void setup() {
		
	}
//	@Test
//	void contextLoads() {
//		
//	}
//
//	@Test
//	void searchUserByName() {
//		List<User> searchUser = repo.searchbyName("John Daniel");
//		assertThat(searchUser.size()).isNotEqualTo(0);	
//	}
//	
	
	/*integration testing*/
	@Test
	void registerUser() {
		UserContainer user = new UserContainer("John","Doe","johndoe@gmail.com","doe");
		userservice.addUser(user);
		User insertUser = userservice.getUser("johndoe@gmail.com");
		
		assertThat(insertUser.getUser_Id()).isNotNull();
		assertThat(insertUser.getFirstName()).isNotNull();
		assertThat(insertUser.getLastName()).isNotNull();
		assertThat(insertUser.getEmailAddress()).isNotNull();
		assertThat(insertUser.getPassword()).isNotNull();
		
		//checking if user
		assertThat(insertUser.getFirstName()).isEqualTo("John"); 
		assertThat(insertUser.getLastName()).isEqualTo("Doe");
		assertThat(insertUser.getEmailAddress()).isEqualTo("johndoe@gmail.com");
		assertThat(insertUser.getPassword()).isEqualTo(passwordencoder.encode("doe"));
		assertThat(insertUser.getRoleID()).isEqualTo(1);
	
	}
	/*unit testing*/
/*	@Test
	void registerUserUnit() {
		UserContainer user = new UserContainer("Camille","Brown","cbrown@gmail.com","doe");
		User insertUser = new User(user);
		
		when(repo.save(any(User.class))).thenReturn(insertUser);
		//when(repo.save(new User(user))).thenReturn(insertUser);
		assertThat(insertUser.getEmailAddress()).isEqualTo("cbrown@gmail.com");
	}
*/
//	@Test
//	void findAuth() {
//		boolean checkAuth = login.authenticatedUser();
//		assertThat(checkAuth).isNotEqualTo(false);
//	}
}

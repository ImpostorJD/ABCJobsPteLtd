package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;

/**
 * UserRepository --- Data Access Object responsible for interacting with table User
 * @author John Daniel Tejero
 */
@Repository						   
public interface UserRepository extends JpaRepository<User, Integer>{

	/**
	 * custom abstract method along with custom query used to search for user's name
	 * Retrieves user record by means of user first name or last name.
	 * @param string name A string which specify the database what to retrieve
	 */
	@Query(value = "select u from User u where u.firstName like %:name% or u.lastName like %:name%")
	public List<User> searchbyName(@Param("name") String name); 
	
	/** 
	 * Custom abstract method with custom query that retrieves user by means of email
	 * Retrieves user record by using email as the selector.
	 * @param String email A string that specify which record to retrieve 
	 */
	@Query(value ="select x from User x where x.emailAddress = :email")
	public User loginCheck(@Param("email")String email);
	
	/**
	 * Custom abstract method with custom query that updates user password
	 * Modifying annotation specifies that the query will change a data from the record
	 * Selecting a record from which to update password by means of email.
	 * @param String pass A string which will replace the old password
	 * @param String email A string which specify which user record to be updated 
	 */
	@Modifying
	@Query(value = "update User u set u.password = :password where u.emailAddress = :email")
	public void changePass(@Param("password")String pass, @Param("email") String email);
	
	/**
	 * Custom abstract method with custom query that selects user from user table
	 * Record is selected by using user ID as selector.
	 * @param int uid an int type which specify which user record to be retrieved
	 */
	@Query(value = "select u from User u where u.user_Id = :userID")
	public User searchById(@Param("userID")int uid);
	
	/**
	 * enableAccount --- method for enabling user account
	 * @param email
	 */
	@Modifying
	@Transactional
	@Query(value = "update User u set u.isEnabled = true where u.emailAddress = :email")
	public void enableAccount(@Param("email") String email);

}

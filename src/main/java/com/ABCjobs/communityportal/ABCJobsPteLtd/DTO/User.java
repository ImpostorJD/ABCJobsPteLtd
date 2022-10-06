package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;

/**
 * User --- DTO layer for modeling user table
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "user")
public class User {
	
	/*Fields of user table*/
	@Id
	@Column(name = "User_ID")
	private int user_Id; /*primary key*/
	
	@Column(name = "User_firstname")
	private String firstName;

	@Column(name = "User_lastname")
	private String lastName;
	
	@Column(name = "User_Email")
	private String emailAddress;																		

	@Column(name = "User_Password")
	private String password;
	
	@Column(name ="Role_ID")
	private int RoleID = 1;

	@Column(name = "user_isenabled")
	private boolean isEnabled;
	
	/*Constructors*/
	public User() {
		
	}
	
	public User(UserContainer user) {
		this.user_Id = user.getUserID();
		this.firstName = user.getFirstName();
		this.lastName = user.getLastName();
		this.emailAddress = user.getEmailAddress();
		this.password = user.getPassword();
		this.RoleID = user.getRoleID();
	
	}
	public User (int id, String fname, String lname, String email, String pass, int roleid) {
		this.user_Id = id;
		this.firstName = fname;
		this.lastName = lname;
		this.emailAddress = email;
		this.password = pass;
		this.RoleID = roleid;
	}
	
	public User (String fname, String lname, String email, String pass) {
		this.firstName = fname;
		this.lastName = lname;
		this.emailAddress = email;
		this.password = pass;
	}
	
	
	/*Setters and Getters of the field*/
	public int getUser_Id() {
		return user_Id;
	}
	
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
	
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	
	public int getRoleID() {
		return RoleID;
	}
	
	public void setRoleID(int roleID) {
		RoleID = roleID;
	}
	
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	
	public boolean getEnabled() {
		return this.isEnabled;
	}

}

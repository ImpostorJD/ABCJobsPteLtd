package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.EducationQualification;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobExperiences;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.UserInformation;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;
/**
 * UserService --- Abstracts the method to be implemented in the service
 * See implementation at UserServiceImplement.java
 * @author John Daniel Tejero
 */
public interface UserService {

	public void addUser(UserContainer user);
	public void deleteUser(int id);
	public UserContainer selectUser(int uid);
	public List<UserContainer> retrieveUsersforAdmin();
	public List<UserContainer> retrieveUsers();
	public Boolean validateName(String name);
	public Boolean validateEmail(String email);
	public Boolean validateContact(String contact);
	public User getUser(String email);
	public void changePass(String pw, String email);
	public UserInformation getPublicInfo(int id);
	public void setPublicInfo(UserInformation personalInformation);
	public void updatePublicInfo(int userID, String contact, String job,String dname, String address, 
			String country,String city, String nationality, String bio, String company);
	public User selectUserByID(int id);
	public void updateImage(String banner, String picture, int id);
	public void updateUserInformation(UserContainer user); 
	public void activateAccount(String email);
	public List<EducationQualification> educationBackground(int id);
	public List<JobExperiences> jobExperiences(int id);
	public void deleteEducation(int id);
	public void deleteJobExperience(int id);
	public void addEducation(EducationQualification education);
	public void addJobExperience(JobExperiences job);
}

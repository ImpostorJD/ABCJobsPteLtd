package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.UserInformation;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.AdminRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.BulkEmailRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.EducationBackgroundRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.JobApplicationRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.JobQualificationRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.JobRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.MessageRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.ThreadRepliesRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.ThreadRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.ThreadUpvoteRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.UserInformationRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.UserRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.EducationQualification;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobExperiences;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.User;
import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;

/**
 * UserServiceImplement --- Implements the methods for the UserService interface
 * @author John Daniel Tejero
 */
@Service
@Transactional
public class UserServiceImplement implements UserService{

	@Autowired
	UserRepository userSelection; //DAO layer for accessing user table
	
	@Autowired
	UserInformationRepository userInfoCollection; //DAO layer for accessing user information table
	
	@Autowired
	EducationBackgroundRepository educationCollection; //DAO layer for accessing education background
	
	@Autowired
	JobQualificationRepository jobQualificationCollection; //DAO layer for accessing job experience table
	
	@Autowired
	BulkEmailRepository emailRepo; //DAO layer for accessing bulk emai ltable
	
	@Autowired
	ThreadRepository threadRepo; //DAO layer for accessing thread table
	
	@Autowired
	JobApplicationRepository jobApplyRepo; //DAO layer for apply table
	
	@Autowired
	ThreadUpvoteRepository upvoteRepo; //DAO layer for accessing upvote table
	
	@Autowired
	ThreadRepliesRepository replyRepo; //DAO layer for accessing reply table
	
	@Autowired
	AdminRepository adminRepo; //DAO layer for accessing admin table
	
	@Autowired
	JobRepository jobRepo; //DAO layer for accessing job table
	
	@Autowired
	MessageRepository messages;//DAO layer for message
	
	/**
	 * Method responsible for calling repository method responsible for inserting new record
	 * @param UserContainer user takes in a UserContainer object with values and process it for
	 * the User class to insert it to the user table in the database
	 */
	@Override
	public void addUser(UserContainer user) {
		/*creates new user object with values from the UserContainer*/
		User reguser = new User(user.getFirstName(), user.getLastName(), user.getEmailAddress(), user.getPassword()); 
		userSelection.save(reguser); /*built-in JPA repository method in inserting record*/
	}

	/**
	 * Method responsible for calling the repository method which retrieves all records
	 * All administrator gets filter out in the collection.
	 * @return allUsers as list or collection of users in UserContainer
	 */
	@Override
	public List<UserContainer> retrieveUsersforAdmin() {
		List<User> user = userSelection.findAll(); /*built-in JPA repository method in retrieving all records*/
		
		/*Object Instantiation*/
		List<UserContainer> allUsers = new ArrayList<>();
		UserContainer userInfo;
		UserInformation publicInformation;
		
		/*Iterates through all users*/
		for (User userList : user) {
			
			/*Creates new userContainer containing the fields from user object*/
			userInfo = new UserContainer(userList.getFirstName(),userList.getLastName(),
					userList.getEmailAddress(),userList.getPassword());
			
			userInfo.setUserID(userList.getUser_Id()); /*sets the UserContainer ID*/
			publicInformation = userInfoCollection.findByUserID(userInfo.getUserID()); /*retrieves user information record for user ID*/

			if(publicInformation != null) { /*checks if a record were retrieved*/
				
				/*Set all UserContainer field with user_information data*/
				userInfo.setBiography(publicInformation.getBio());
				userInfo.setCity(publicInformation.getCity());
				userInfo.setCountry(publicInformation.getCountry());
				userInfo.setContactNumber(publicInformation.getContactNumber());
				userInfo.setNationality(publicInformation.getNationality());
				userInfo.setAddress(publicInformation.getAddress());
				userInfo.setCompany(publicInformation.getCompany());
				userInfo.setJob(publicInformation.getJobPosition());
				userInfo.setBannerImagepath(publicInformation.getBanner());
				userInfo.setProfileImagePath(publicInformation.getDisplayPicture());
				userInfo.setDisplayName(publicInformation.getDisplayName());	
				
			}
			
			if (userList.getRoleID()!=2) { /*checks if role is not admin*/
				allUsers.add(userInfo); /*add UserContainer to ArrayList*/
			}
		}
		
		return allUsers; /*return collection as ArrayList*/
	}

	/**
	 * Method for name validation
	 * @param String name parameter will be used to pass information
	 * needed to be validated.
	 * @return boolean to indicate if constraints are validated
	 */
	@Override
	public Boolean validateName(String name) {
		String regexp ="[a-zA-Z][a-zA-Z ]*"; /*Regular Expression pattern to be tested*/
		return Pattern.matches(regexp, name); /*Returns a true or false if Regex is satisfied*/
	}

	/**
	 * Method for email validation
	 * @param String email parameter will be used to pass email entry needed to be validated
	 * @return boolean to indicate if constraints are satisfied
	 */
	@Override
	public Boolean validateEmail(String email) { 
		String regexp = "^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$"; /*Regular Expression pattern to be tested*/
		return Pattern.matches(regexp, email); /*Returns a true or false if Regex is satisfied*/
	}
	
	/**
	 * Method to validate contact number entry
	 * @param String contact parameter will be used to pass contact number needed to be validated
	 * @return boolean to indicate if constraints are satisfied
	 */
	@Override
	public Boolean validateContact(String contact) {
		String allCountryRegex = "^(\\+\\d{1,3}( )?)?((\\(\\d{1,3}\\))|\\d{1,3})[- .]?\\d{3,4}[- .]?\\d{4}$"; /*Regular Expression pattern to be tested*/
		return Pattern.matches(allCountryRegex, contact); /*Returns a true or false if Regex is satisfied*/
	}

	/**
	 * Method for selecting a targeted user
	 * @param int uid as selector for retrieving specific record in both user and user_information
	 * @return user as UserContainer to be used for data modelling in view
	 */
	@Override
	public UserContainer selectUser(int uid) {
		
		User selectUser = userSelection.searchById(uid); /*calls UserRepository with the custom method for searching user*/
		
		/*calls UserInformationRepository with the custom method for searching user information*/
		UserInformation publicInformation = userInfoCollection.userProfile(uid); 
		
		/*creates new UserContainer to be displayed*/
		UserContainer user = new UserContainer(selectUser.getFirstName(),selectUser.getLastName(), 
				selectUser.getEmailAddress(), selectUser.getPassword());
		
		user.setDisplayName(user.getFirstName() + " " + user.getLastName()); /*set default display name to the container*/
		user.setUserID(uid);
		user.setRoleID(selectUser.getRoleID()); /*set the role id of the container*/
		
		if(publicInformation != null) { /*checks if UserInformation of the user is not null*/
			
			/*Set all UserInformation records to the container*/
			user.setBiography(publicInformation.getBio());
			user.setCity(publicInformation.getCity());
			user.setCountry(publicInformation.getCountry());
			user.setContactNumber(publicInformation.getContactNumber());
			user.setNationality(publicInformation.getNationality());
			user.setAddress(publicInformation.getAddress());
			user.setCompany(publicInformation.getCompany());
			user.setJob(publicInformation.getJobPosition());
			user.setBannerImagepath(publicInformation.getBanner());
			user.setProfileImagePath(publicInformation.getDisplayPicture());
			user.setDisplayName(publicInformation.getDisplayName());	
			
		}
		return user; /*returns the UserContainer for display*/
	}

	/**
	 * Method which gets user by email
	 * @param String email sends a string which will be used to point a specific record
	 * @return user as record retrieved from the database
	 */
	@Override
	public User getUser(String email) {
		return userSelection.loginCheck(email); /*returns record retrieved by the loginCheck method of UserRepository*/
	}

	/**
	 * Method for changing password of user specified by user Email
	 * @param String pw overwrites the current password
	 * @param String email selects which record to be updated
	 */
	@Override
	public void changePass(String pw, String email) {
		userSelection.changePass(pw, email); /*Calls UserRepository method which is for changing password*/
		
	}

	/**
	 * Method that returns a record of user information
	 * @param int id specifies which record to be retrieved by means of user_id
	 * @return UserInformation retrieved from the database
	 * 
	 */
	@Override
	public UserInformation getPublicInfo(int id) {
		return userInfoCollection.findByUserID(id); /*custom JPA repository method which collects record by user_id*/
	}

	/**
	 * Method that inserts new record to user information
	 * @param UserInformation personalInformation object has all records to be inserted
	 */
	@Override
	public void setPublicInfo(UserInformation personalInformation) {
		userInfoCollection.save(personalInformation); /*built-in JPA repository which inserts new record to user_information*/
	}

	/**
	 * Method for updating userInformation record
	 * @param int userID specifies the record to be updated by means of userID in user information
	 * @param String contact contains contact number to overwrite the current contact number
	 * @param String job contains job to overwrite the current job
	 * @param String dname contains dname to overwrite the current display name
	 * @param String address contains address to overwrite the current address
	 * @param String country contains country to overwrite the current country
	 * @param String city contains city to overwrite the current city
	 * @param String nationality contains nationality to overwrite current nationality
	 * @param String bio contains bio to overwrite current biography
	 * @param String company contains company to overwrite current company
	 */
	@Override
	public void updatePublicInfo(int userID, String contact, String job, String dname, String address, 
			String country, String city, String nationality, String bio, String company) {
		
		/*calls UserInfoRepository to call method for record updation*/
		userInfoCollection.updatePublicInfo(userID, contact, job, dname, address, country, city, nationality, bio, company);
		
	}

	/**
	 * Method specifically for updating image in user_information
	 * @param banner collects banner image path
	 * @param picture collects profile image path
	 * @param id as selector in user_information by means of user_id
	 */
	@Override
	public void updateImage(String banner, String picture, int id) {
		userInfoCollection.updatePublicImg(banner, picture, id); /*calls UserInformationRepository method responsible for image update*/
	}

	/**
	 * Method for deleting user record
	 * @param id specifies which user to be deleted
	 */
	@Override
	public void deleteUser(int id) {
		
		if(userInfoCollection.userProfile(id) != null) { /*Checks whether a user information is existing*/
			/*built-in JPA repository method for deleting userinformation record*/
			userInfoCollection.deleteById(userInfoCollection.userProfile(id).getUserInfoID());
		}
		
		//check if user is an admin
		if(adminRepo.findByUserId(id) != null) {
			
			/*check if admin has any bulk email sent*/
			if (emailRepo.findByAdminId(adminRepo.findByUserId(id).getAdminId()) != null) { 
				emailRepo.deleteByAdminId(adminRepo.findByUserId(id).getAdminId());
			}
		}
		
		//check if user has replies to thread
		if (replyRepo.findByUserId(id) != null) {
			replyRepo.deleteAllByUserId(id);
		}
		
		//check if user has thread posted
		if (threadRepo.findAllByUserIdOrderByPostedDesc(id) != null) {
			threadRepo.deleteByUserId(id);
		}
		
		//check if user has job posted
		if (jobRepo.findAllByUser_id(id) != null) {
			jobRepo.deleteByUser_id(id);
		}
		
		//check if user has education
		if(educationCollection.findAllByUserIdOrderByYearStartDesc(id) != null) {
			educationCollection.deleteByUserId(id);
		}
		
		//check if user has job experience
		if(jobQualificationCollection.findAllByUserIdOrderByYearStartDesc(id) != null) {
			jobQualificationCollection.deleteByUserId(id);
		}
		
		//check if user has any pending application
		if (jobApplyRepo.findAllByUserId(id) != null) {
			jobApplyRepo.deleteAllByUserId(id);
		}
		
		//check if user has any upvoted threads
		if (upvoteRepo.findAllByUserId(id) != null) {
			upvoteRepo.deleteAllByUserId(id);
		}
		
		//checks if user has messages
		if (messages.findAllBySenderIdOrReceiverId(id, id) != null) {
			messages.deleteMessageByUserId(id);
		}
		
		userSelection.deleteById(id); /*deletes user record from the database with built-in JPA repository method*/
		
	}

	/**
	 * Method to retrieve user record by id
	 * @param id specifies which user record to be retrieved
	 * @return either a user record or null
	 */
	@Override
	public User selectUserByID(int id) { 
		User user = userSelection.searchById(id); /*Calls custom query method from UserRepository by using userID*/
		
		if (user!=null) { /*checks if user record retrieved is not null*/
			return user; /*returns user record*/
		}
		return null; /*default return*/
	}

	/**
	 * Method for updating user information in the database
	 * @param UserContainer user contains all values to be inserted for updation of a particular record
	 */
	@Override
	public void updateUserInformation(UserContainer user) {
		
		/*Create new object as placeholder for user updation*/
		User updateUser = new User(user.getFirstName(), user.getLastName(),user.getEmailAddress(), user.getPassword());
		updateUser.setUser_Id(user.getUserID()); /*set the object's ID*/

		userSelection.save(updateUser); /*By using built-in JPA repository method, we can do a partial updation of information in database*/
	
	}

	/**
	 * Method for account activation
	 */
	@Override
	public void activateAccount(String email) {
		userSelection.enableAccount(email);
	}

	/**
	 * Method for retrieving education background
	 * @return List<EducationQualification> --- list of education
	 */
	@Override
	public List<EducationQualification> educationBackground(int id) {
		List<EducationQualification> educations = new ArrayList<EducationQualification>();
		
		for(EducationQualification education : educationCollection.findAllByUserIdOrderByYearStartDesc(id)) {
			
			education.setAchievements(Arrays.asList(education.getAchievement().split(",")));
			educations.add(education);
		}
		
		return educations;
	}

	/**
	 * Method for retrieving job credentials
	 * @return List<JobExperiences> --- list of job experiences
	 */
	@Override
	public List<JobExperiences> jobExperiences(int id) {
		
		return jobQualificationCollection.findAllByUserIdOrderByYearStartDesc(id);
	}

	/**
	 * Method for deleting education background
	 */
	@Override
	public void deleteEducation(int id) {
		educationCollection.deleteById(id);
	}

	/**
	 * Method for deleting job experiences
	 */
	@Override
	public void deleteJobExperience(int id) {
		jobQualificationCollection.deleteById(id);
		
	}

	/**
	 * Method for inserting new education background
	 */
	@Override
	public void addEducation(EducationQualification education) {
		educationCollection.save(education);
	}

	/**
	 * Method for inserting new job experience
	 */
	@Override
	public void addJobExperience(JobExperiences job) {
		jobQualificationCollection.save(job);
	}

	/**
	 * Method for retrieving users
	 */
	@Override
	public List<UserContainer> retrieveUsers() {
		List<User> user = userSelection.findAll(); /*built-in JPA repository method in retrieving all records*/
		
		/*Object Instantiation*/
		List<UserContainer> allUsers = new ArrayList<>();
		UserContainer userInfo;
		UserInformation publicInformation;
		
		/*Iterates through all users*/
		for (User userList : user) {
			
			/*Creates new userContainer containing the fields from user object*/
			userInfo = new UserContainer(userList.getFirstName(),userList.getLastName(),
					userList.getEmailAddress(),userList.getPassword());
			
			userInfo.setUserID(userList.getUser_Id()); /*sets the UserContainer ID*/
			publicInformation = userInfoCollection.findByUserID(userInfo.getUserID()); /*retrieves user information record for user ID*/

			if(publicInformation != null) { /*checks if a record were retrieved*/
				
				/*Set all UserContainer field with user_information data*/
				userInfo.setBiography(publicInformation.getBio());
				userInfo.setCity(publicInformation.getCity());
				userInfo.setCountry(publicInformation.getCountry());
				userInfo.setContactNumber(publicInformation.getContactNumber());
				userInfo.setNationality(publicInformation.getNationality());
				userInfo.setAddress(publicInformation.getAddress());
				userInfo.setCompany(publicInformation.getCompany());
				userInfo.setJob(publicInformation.getJobPosition());
				userInfo.setBannerImagepath(publicInformation.getBanner());
				userInfo.setProfileImagePath(publicInformation.getDisplayPicture());
				userInfo.setDisplayName(publicInformation.getDisplayName());	
				
			}
			allUsers.add(userInfo);
		}
		
		return allUsers; /*return collection as ArrayList*/
	}
	
}

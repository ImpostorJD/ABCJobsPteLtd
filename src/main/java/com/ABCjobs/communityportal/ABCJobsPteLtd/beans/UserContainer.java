package com.ABCjobs.communityportal.ABCJobsPteLtd.beans;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

/**
 * UserContainer --- model of information to merge both user and user_information
 * @author John Daniel Tejero
 */
public class UserContainer {
	
	/**
	 * User data upon registration
	 */
	private int userID;	/*user ID which is empty until used to retrieve a user record from database*/
	@NotEmpty(message = "this field cannot be empty") 
	private String firstName;
	
	@NotEmpty(message = "this field cannot be empty")
	private String lastName;
	
	@NotEmpty(message = "this field cannot be empty")
	private String emailAddress;
	
	@NotEmpty(message = "this field	cannot be empty")
	private String password;
	private int RoleID = 1; /*default value is 1 upon registration*/
	
	/**
	 * Fields to store file information
	 */
	private MultipartFile profileImage; /*for pre-processing of image upload*/
	private MultipartFile bannerImage; /*for pre-processing of banner image upload*/
	
	/**
	 * User information upon updating profile page
	 */
	private String profileImagePath;
	private String bannerImagepath;
	private String displayName;
	private String address;
	private String biography;
	private String city;
	private String country = "none";
	private String contactNumber;
	private String nationality = "none";
	private String company;
	private String job;
	
	/*Constructors for UserContainer class*/
	public UserContainer() {
		
	}
	
	public UserContainer(String fname, String lname, String email, String pw) {
		this.firstName = fname;
		this.lastName = lname;
		this.emailAddress = email;
		this.password = pw;
		this.displayName = fname +" " + lname;
	}
	
	public UserContainer(int id, String fname, String lname, String email, String pw) {
		this.userID = id;
		this.firstName = fname;
		this.lastName = lname;
		this.emailAddress = email;
		this.password = pw;
		this.displayName = fname +" " + lname;
	}
	
	/*Setters and Getters for user data*/
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public int getUserID() {
		return this.userID;
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
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setRoleID(int roleID) {
		RoleID = roleID;
	}
	
	public int getRoleID() {
		return RoleID;
	}
	
	
	/*Setters and Getters for File Uploading process*/
	public void setProfileImage(MultipartFile profileImage) {
		this.profileImage = profileImage;
	}
	
	public MultipartFile getProfileImage() {
		return profileImage;
	}
	
	public void setBannerImagepath(String bannerImagepath) {
		this.bannerImagepath = bannerImagepath;
	}
	
	public MultipartFile getBannerImage() {
		return bannerImage;
	}
	
	/*Setters and Getters for user information*/
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	
	public String getDisplayName() {
		return displayName;
	}
	
	
	public void setBiography(String biography) {
		this.biography = biography;
	}
	
	public String getBiography() {
		return biography;
	}
	
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	public String getContactNumber() {
		return contactNumber;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getCountry() {
		return country;
	}
	
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	public String getNationality() {
		return nationality;
	}
	
	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getCompany() {
		return company;
	}
	
	public String getJob() {
		return job;
	}
	
	public void setJob(String job) {
		this.job = job;
	}
	
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public void setProfileImagePath(String profileImagePath) {
		this.profileImagePath = profileImagePath;
	}
	
	public String getProfileImagePath() {
		return profileImagePath;
	}

	public String getBannerImagePath() {
		return bannerImagepath;
	}
	public void setBannerImage(MultipartFile bannerImage) {
		this.bannerImage = bannerImage;
	}
	
}

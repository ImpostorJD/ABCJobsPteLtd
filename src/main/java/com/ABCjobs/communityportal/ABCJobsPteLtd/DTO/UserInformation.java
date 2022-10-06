package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UserInformation --- DTO layer for modeling user_information table
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "user_information")
public class UserInformation {
	
	/*Fields of the user_information table*/
	@Id
	@Column(name = "userinfo_id")
	private int userInfoID; /*primary key*/
	
	@Column(name = "userinfo_contactno")
	private String contactNumber;
	
	@Column(name = "userinfo_job")
	private String jobPosition;
	
	@Column (name = "userinfo_displayname")
	private String displayName;
	@Column(name = "userinfo_address")
	private String address;
	
	@Column(name = "userinfo_country")
	private String country;
	
	@Column(name = "userinfo_city")
	private String city;
	
	@Column(name = "userinfo_nationality")
	private String nationality;
	
	@Column(name = "userinfo_company")
	private String company;
	
	@Column(name = "user_ID")	
	private int userID;
	
	@Column(name = "userinfo_banner")
	private String banner;
	
	@Column(name = "userinfo_displayimg")
	private String displayPicture;
	
	@Column(name ="userinfo_bio")
	private String bio;
	
	/*constructors*/
	public UserInformation() {
		
	}
	public UserInformation(int userInfoID, String contact, String job, String address, String country, String bio,
			String company, String city, String nationality, int UserID, String imgBannerPath, String imgDisplayPath) {
		this.userInfoID = userInfoID;
		this.address = address;
		this.contactNumber = contact;
		this.jobPosition = job;
		this.address = address;
		this.country = country;
		this.city = city;
		this.nationality = nationality;
		this.userID = UserID;
		this.banner = imgBannerPath;
		this.displayPicture = imgDisplayPath;
		this.company = company;
		this.bio = bio;
	}
	public UserInformation(String contact, String job, String display, String address, String country, String bio,
			String company, String city, String nationality, int UserID) {
		this.displayName = display;
		this.address = address;
		this.contactNumber = contact;
		this.jobPosition = job;
		this.address = address;
		this.country = country;
		this.city = city;
		this.nationality = nationality;
		this.userID = UserID;
		this.company = company;
		this.bio = bio;
	}
	
	
	/*Setters and Getters for fields of user_information table*/
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getUserInfoID() {
		return userInfoID;
	}
	public void setUserInfoID(int userInfoID) {
		this.userInfoID = userInfoID;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCity() {
		return city;
	}
	
	public String getBanner() {
		return banner;
	}
	
	public void setBanner(String banner) {
		this.banner = banner;
	}
	
	public void setDisplayPicture(String displayPicture) {
		this.displayPicture = displayPicture;
	}
	public String getDisplayPicture() {
		return displayPicture;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getNationality() {
		return nationality;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getContactNumber() {
		return contactNumber;
	}
	
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	public String getJobPosition() {
		return jobPosition;
	}
	
	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}
	
	public String getBio() {
		return bio;
	}
	
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getDisplayName() {
		return displayName;
	}
}

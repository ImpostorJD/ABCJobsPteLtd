package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * EducationQualification --- DTO layer for modeling records from educational_background
 * NOTE: This DTO is not yet integrated to the system due to time constraints
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "educational_background")
public class EducationQualification {
	
	/*Fields from educational_background table*/
	@Id
	@Column(name ="Eb_Id")
	private int ebId; /*primary key*/
	
	@Column(name = "Eb_Yearstart")
	private int yearStart;
	
	@Column(name = "Eb_Yearend")
	private int yearEnd;
	
	@Column(name = "Eb_degree")
	private String degree;
	
	@Column(name = "Eb_Schoolname")
	private String schoolName;
	
	@Column(name = "Eb_achievements")
	private String achievement;
	
	@Column(name = "User_ID")
	private int userId;
	
	@Transient
	private List<String> achievements;
	/*constructors*/
	
	public EducationQualification() {
		
	}
	
	public EducationQualification(int id, int yearStart, int yearEnd, String degree, String school, String achievement, int UserID) {
		this.ebId= id;
		this.yearStart = yearStart;
		this.yearEnd = yearEnd;
		this.degree = degree;
		this.schoolName = school;
		this.achievement = achievement;
		this.userId = UserID;
	}
	
	
	/*Setters and Getters for fields*/
	public int getEbId() {
		return ebId;
	}
	
	public void setEbId(int eb_ID) {
		this.ebId = eb_ID;
	}
	
	public int getYearStart() {
		return yearStart;
	}
	
	public void setYearStart(int yearStart) {
		this.yearStart = yearStart;
	}
	
	public int getYearEnd() {
		return yearEnd;
	}
	
	public void setYearEnd(int yearEnd) {
		this.yearEnd = yearEnd;
	}
	
	public String getDegree() {
		return this.degree;
	}
	
	public void setDegree(String degree) {
		this.degree = degree;
	}
	
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	public String getAchievement() {
		return achievement;
	}
	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserId() {
		return userId;
	}

	public void setAchievements(List<String> achievements) {
		this.achievements = achievements;
	}
	
	public List<String> getAchievements() {
		return achievements;
	}
}

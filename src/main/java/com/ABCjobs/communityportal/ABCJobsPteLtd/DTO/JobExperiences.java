package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * JobExperiences --- DTO layer for modeling Job_Experiences table
 * NOTE: this DTO is not yet integrated to the system due to time constraints
 * @author John Daniel Tejero
 *
 */

@Entity
@Table(name = "job_experiences")
public class JobExperiences {

	/*fields of the Job_Experiences table*/
	@Id
	@Column(name = "jobexp_id")
	private int job_ID; /*primary key*/
	
	@Column(name = "jobexp_position")
	private String jobPosition;
	
	@Column(name ="jobexp_company")	
	private String company;
	
	@Column(name ="jobexp_yearstart")
	private String yearStart;

	@Column (name ="jobexp_yearend")
	private String yearEnd;

	@Column(name ="user_id")
	private int userId;
	/*Constructors*/	
	public JobExperiences() {
	}
	public JobExperiences(String job, String company, String yearStart, String yearEnd) {
		this.jobPosition = job;
		this.company = company;
		this.yearStart = yearStart;
		this.yearEnd = yearEnd;
	}
	
	/*Setters and Getters of field*/
	public void setJob_ID(int job_ID) {
		this.job_ID = job_ID;
	}
	
	public int getJob_ID() {
		return job_ID;
	}
	
	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}
	
	public String getJobPosition() {
		return jobPosition;
	}
	
	public void setYearEnd(String yearEnd) {
		this.yearEnd = yearEnd;
	}
	
	public String getYearEnd() {
		return yearEnd;
	}
	public void setYearStart(String yearStart) {
		this.yearStart = yearStart;
	}
	public String getYearStart() {
		return yearStart;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
}

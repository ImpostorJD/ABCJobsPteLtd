package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Job --- Class that maps job table from the database
 * @author John Daniel Tejero
 *
 */
@Entity
@Table (name = "job")
public class Job {

	/**
	 * Fields that represents job table columns
	 */
	@Id
	@Column(name = "job_id")
	private int jobId;
	
	@Column(name = "job_position")
	@NotEmpty(message = "position should not be left blank")
	private String jobPosition;
	
	@Column(name = "job_company")
	@NotEmpty(message = "please specify a company")
	private String company;
	
	@Column(name = "job_overview")
	@NotEmpty(message = "overview is required to be filled")
	private String jobOverview;
	
	@Column(name = "job_desc")
	@NotEmpty()
	private String description;
	
	@Column(name = "job_responsibilities")
	@NotEmpty(message ="please specify responsibilities")
	private String responsibilities;
	
	@Column(name ="job_salary")
	@NotEmpty(message ="please indicate a salary")
	private String salary;
	
	@Column(name = "job_status")
	private String status;
	
	@Column(name = "job_posted")
	private String posted;
	
	@Column(name = "job_deadline")
	@NotEmpty(message ="deadline should be specified")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String deadline;
	
	@Column(name ="user_id")
	private int user_id;
	
	@Transient
	private List<String> responsibilitiesList;
	@Transient
	private String author;
	
	/*Constructors*/
	public Job() {
		
	}
	
	/*Getters and setters*/
	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getJobPosition() {
		return jobPosition;
	}

	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getJobOverview() {
		return jobOverview;
	}

	public void setJobOverview(String jobOverview) {
		this.jobOverview = jobOverview;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getResponsibilities() {
		return responsibilities;
	}

	public void setResponsibilities(String responsibilities) {
		this.responsibilities = responsibilities;
	}

	public String getSalary() {
		return salary;
	}
	
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPosted() {
		return posted;
	}

	public void setPosted(String posted) {
		this.posted = posted;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public List<String> getResponsibilitiesList() {
		return responsibilitiesList;
	}
	
	public void setResponsibilitiesList(List<String> responsibilitesList) {
		this.responsibilitiesList = responsibilitesList;
	}
}

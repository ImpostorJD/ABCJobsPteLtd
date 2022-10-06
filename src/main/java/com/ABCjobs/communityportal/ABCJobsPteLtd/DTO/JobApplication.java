package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

/**
 * JobApplication --- DTO layer for modelling apply table
 * @author John Daniel Tejero
 *
 */
@Entity
@Table (name = "apply")
@IdClass(JobApplicationId.class)
public class JobApplication{

	@Id
	@Column(name = "user_id")
	private int userId;
	
	@Id
	@Column(name = "job_id")
	private int jobId;
	
	public JobApplication() {
		
	}
	public JobApplication(int userId, int jobId) {
		this.userId = userId;
		this.jobId = jobId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	
	
}

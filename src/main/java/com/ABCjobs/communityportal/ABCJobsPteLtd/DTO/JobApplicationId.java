package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import java.io.Serializable;

/**
 * Class for identifying composite key as primary key for JobApplication
 * @author John Daniel Tejero
 *
 */
public class JobApplicationId implements Serializable{

	private Integer jobId;
	private Integer userId;
	
	public JobApplicationId() {
		
	}
	public JobApplicationId(Integer userId, Integer jobId) {
		this.setJobId(jobId);
		this.setUserId(userId);
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
}

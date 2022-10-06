package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import java.io.Serializable;

/**
 * ThreadUpvoteId --- This class is for identifying composite key as primary key
 * @author John Daniel Tejero
 *
 */
public class ThreadUpvoteId implements Serializable{

	private Integer threadId;
	private Integer userId;
	
	public ThreadUpvoteId() {
		
	}
	public ThreadUpvoteId(Integer threadId, Integer userId) {
		this.threadId = threadId;
		this.userId = userId;
	}
	public Integer getThreadId() {
		return threadId;
	}
	public void setThreadId(Integer threadId) {
		this.threadId = threadId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
}

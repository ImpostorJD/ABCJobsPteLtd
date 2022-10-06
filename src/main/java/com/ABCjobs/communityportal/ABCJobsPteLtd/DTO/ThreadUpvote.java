package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

/**
 * ThreadUpvote --- DTO for mapping upvote table
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "upvote")
@IdClass(ThreadUpvoteId.class)
public class ThreadUpvote {
	
	/*Fields that represents the column of the table*/
	@Id
	@Column(name = "user_id")
	private int userId;
	
	@Id
	@Column(name = "th_id")
	private int threadId;
	
	/*Constructors*/
	public ThreadUpvote() {
		
	}
	
	public ThreadUpvote(int userId, int threadId) {
		this.userId = userId;
		this.threadId = threadId;
	}

	/*Getters and Setters*/
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}
	
	
}

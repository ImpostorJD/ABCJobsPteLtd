package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * ThreadReplies --- DTO layer for mapping thread reply table;
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "reply")
public class ThreadReplies {
	 
	/*Fields that represents table column of reply*/
	@Id
	@Column(name = "reply_id")
	private int replyId;

	@Column(name = "reply_body")
	private String comment;
	
	@Column(name = "reply_date")
	private String replyPosted;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "th_id")
	private int threadId;
	
	@Transient
	private String author;

	@Transient
	private  String authorImage;
	
	/*constructor*/
	public ThreadReplies() {
		
	}
	
	public ThreadReplies(String comment, String replyPosted, int userId, int threadId) {
		this.comment = comment;
		this.replyPosted = replyPosted;
		this.userId = userId;
		this.threadId = threadId;
	}
	/*Setters and Getters*/
	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getReplyPosted() {
		return replyPosted;
	}

	public void setReplyPosted(String replyPosted) {
		this.replyPosted = replyPosted;
	}

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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getAuthorImage() {
		return authorImage;
	}
	
	public void setAuthorImage(String authorImage) {
		this.authorImage = authorImage;
	}
	
}

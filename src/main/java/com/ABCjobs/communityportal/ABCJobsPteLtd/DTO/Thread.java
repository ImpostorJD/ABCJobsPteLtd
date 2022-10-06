package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
/**
 * Thread --- DTO for mapping thread table
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "thread")
public class Thread {

	/**
	 * field represents column on thread table
	 */
	@Id
	@Column(name = "th_id")
	private int threadId;
	
	@Column(name = "th_name")
	private String threadName;
	
	@Column(name = "th_viewtype")
	private String visibility;
	
	@Column(name = "th_subject")
	private String subject;
	
	@Column(name = "th_body")
	private String content;
	
	@Column(name = "th_dateposted")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String posted;
	
	@Column(name = "user_id")
	private int userId;

	@Transient
	private String author;
	
	@Transient
	private String authorImage;
	
	@Transient
	private int upvotes;
	
	@Transient
	private List<ThreadUpvote> upvoteList;
	
	@Transient
	private ThreadUpvote userUpvoteInstance; 
	/*constructor*/
	public Thread() {
		
	}
	public Thread(String threadName, String visibility, String subject, String content) {
		this.threadName = threadName;
		this.visibility = visibility;
		this.subject = subject;
		this.content = content;
	}
	
	public Thread(String thname, String subject, String content) {
		this.threadName = thname;
		this.subject = subject;
		this.content = content;
	}
	
	public Thread(String thname, String viewtype, String subject, String content, String date) {
		this.threadName = thname;
		this.visibility = viewtype;
		this.subject = subject;
		this.content = content;
		this.posted = date;
	}
	/*Setters and Getters*/
	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	public String getThreadName() {
		return threadName;
	}

	public void setThreadName(String threadName) {
		this.threadName = threadName;
	}

	public String getVisibility() {
		return visibility;
	}
	
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPosted() {
		return posted;
	}

	public void setPosted(String posted) {
		this.posted = posted;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	
	public int getUpvotes() {
		return upvotes;
	}
	
	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}
	
	public List<ThreadUpvote> getUpvoteList() {
		return upvoteList;
	}
	
	public void setUpvoteList(List<ThreadUpvote> upvoteList) {
		this.upvoteList = upvoteList;
	}
	
	public ThreadUpvote getUserUpvoteInstance() {
		return userUpvoteInstance;
	}
	
	public void setUserUpvoteInstance(ThreadUpvote userUpvoteInstance) {
		this.userUpvoteInstance = userUpvoteInstance;
	}
}

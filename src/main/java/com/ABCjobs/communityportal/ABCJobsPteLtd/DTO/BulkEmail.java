package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

/**
 * BulkEmail --- A java class to map the bulk-email entity or table from database
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "bulk_email")
public class BulkEmail {

	/*Fields for table bulk_email*/
	@Id
	@Column(name ="Be_Id")
	private int BulkID;
	
	@NotEmpty (message = "please specify the subject")
	@Column(name = "be_name")
	private String subject;
	
	@NotEmpty(message = "you cannot send an empty email")
	@Column(name = "be_body")
	private String content;
	
	@NotEmpty(message = "specify your target user/s")
	@Column(name = "be_target")
	private String target;
	
	@Column(name = "be_status")
	private String status;
	
	@Column(name = "admin_id")
	private int adminId;
	
	@Transient
	private String author;
	
	/*Constructor*/
	public BulkEmail() {
		
	}
	
	public BulkEmail(String subject, String content, String target, String status) {
		this.subject = subject;
		this.content = content;
		this.target = target;
		this.status = status;
	}

	/*setters and getters*/
	public int getBulkID() {
		return BulkID;
	}

	public void setBulkID(int bulkID) {
		BulkID = bulkID;
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

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getAuthor() {
		return author;
	}
}

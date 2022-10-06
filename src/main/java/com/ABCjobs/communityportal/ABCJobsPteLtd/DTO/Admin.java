package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Admin --- Entity for mapping admin table
 * @author John Daniel Tejero
 *
 */

@Entity
@Table(name = "admin")
public class Admin {

	/*Fields for admin table*/
	@Id
	@Column(name = "admin_id")
	private int adminId;
	
	@Column(name = "user_id")
	private int userId;
	

	/*constructors*/
	public Admin() {
		
	}
	
	public Admin(int adminId, int userId) {
		super();
		this.adminId = adminId;
		this.userId = userId;
	}


	/*Setters and getters*/
	public int getAdminId() {
		return adminId;
	}


	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}

	
}

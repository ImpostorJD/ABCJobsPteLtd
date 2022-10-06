package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Admin;

/**
 * AdminService --- Service regarding administrator information
 * See implementation at AdminServiceImplement
 * @author John Daniel Tejero
 *
 */
public interface AdminService {
	public void setAdmin(Admin admin);
	public Admin selectAdminById(int id);
	public Admin selectAdmin(int id);
	public List<Admin> retrieveAdmins();
}

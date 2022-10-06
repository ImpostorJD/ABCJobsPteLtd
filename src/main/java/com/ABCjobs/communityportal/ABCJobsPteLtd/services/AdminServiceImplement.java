package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Admin;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.AdminRepository;

/**
 * AdminServiceImplement --- implements method for admin service
 * @author John Daniel Tejero
 *
 */
@Service
public class AdminServiceImplement implements AdminService{

	@Autowired
	AdminRepository adminRepo; //repository that interacts with administrator bean
	
	/**
	 * Method that creates new admin
	 */
	@Override
	public void setAdmin(Admin admin) {
		adminRepo.save(admin);
	}

	/**
	 * Method that selects a particular admin
	 * @return Admin object
	 */
	@Override
	public Admin selectAdminById(int uid) {
		return adminRepo.findByUserId(uid);
	}

	/**
	 * Method that retrieves all administrators
	 */
	@Override
	public List<Admin> retrieveAdmins() {
		return adminRepo.findAll();
	}

	/**
	 * Method that retrieves a particular admin depending on the admin ID
	 */
	@Override
	public Admin selectAdmin(int id){
		
		if (adminRepo.findByAdminId(id) == null) {
			return null;
		}
		return adminRepo.findByAdminId(id);
	}

}

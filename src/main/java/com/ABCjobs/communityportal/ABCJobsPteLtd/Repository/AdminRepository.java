package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Admin;

/**
 * AdminRepository --- Repository or DAO for retrieving admin record
 * @author John Daniel Tejero
 *
 */
public interface AdminRepository extends JpaRepository<Admin, Integer>{
	
	/**
	 * Custom method provided by Jpapersistence to retrieve admin ID by userID
	 * @param id takes in userID and returns admin object
	 * @return admin records
	 */
	public Admin findByUserId(int id);
	
	/**
	 * Custom method with custom query to retrieve admin with the admin ID
	 * @param id points which record to retrieve
	 * @return Admin as admin object
	 */
	@Query(value = "Select a from Admin a where a.adminId = :adminId")
	public Admin findByAdminId(@Param("adminId") int id);
}

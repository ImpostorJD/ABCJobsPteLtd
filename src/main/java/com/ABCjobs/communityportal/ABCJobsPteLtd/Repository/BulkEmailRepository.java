package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.BulkEmail;

/**
 * BulkEmailRepository --- DAO layer for interacting with table bulk-email
 * @author John Daniel Tejero
 *
 */
public interface BulkEmailRepository extends JpaRepository<BulkEmail, Integer>{
	
	/**
	 * findByBulkID --- method for retrieving specific bulk id
	 * @param id --- refers to the bulk id
	 * @return BulkEmail object
	 */
	@Query("select b from BulkEmail b where b.BulkID = :bid")
	public BulkEmail findByBulkID(@Param("bid") int id);
	
	/**
	 * setToSent --- method for updating bulk email status
	 * @param id --- refers to the bulk email id
	 */
	@Modifying
	@Transactional
	@Query("update BulkEmail set status = 'sent' where BulkID = :bid")
	public void setToSent(@Param("bid") int id);
	
	/**
	 * findByAdminId --- auto generated query by JPA for finding bulk email sent by an admin
	 * @param id --- refers to the admin id
	 * @return BulkEmail object
	 */
	public BulkEmail findByAdminId(int id);
	
	/**
	 * deleteByAdminId --- method for deleting all bulk email sent by a specific admin
	 * @param id --- refers to admin id
	 */
	@Modifying
	@Transactional
	@Query("delete from BulkEmail WHERE adminId = :id")
	public void deleteByAdminId(@Param("id") int id);
}

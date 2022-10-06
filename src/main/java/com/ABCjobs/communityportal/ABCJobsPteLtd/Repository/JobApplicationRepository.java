package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobApplication;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobApplicationId;

/**
 * JobApplicationRepository --- DAO layer for accessing apply table
 * @author John Daniel Tejero
 *
 */
public interface JobApplicationRepository extends JpaRepository<JobApplication, JobApplicationId>{

	/**
	 * findByUserIdAndJobId --- auto generate query by the JPA
	 * @param userId --- refers to user id
	 * @param jobId --- refers to job id
	 * @return JobApplication object
	 */
	public JobApplication findByUserIdAndJobId(int userId, int jobId);
	
	/**
	 * findAllByUserIdAndJobId --- auto generate query by the JPA
	 * @param userId --- refers to user id
	 * @param jobId --- refers to job id
	 * @return List<JobApplication> --- list of applications
 	 */
	public List<JobApplication> findAllByUserIdAndJobId(int userId, int jobId);
	
	/**
	 * findAllByJobId --- auto generate query by the JPA
	 * @param jobId --- refers to job id
	 * @return List<JobApplication> --- list of applications
	 */
	public List<JobApplication> findAllByJobId(int jobId);
	
	/**
	 * deleteByJobId --- method for deleting job applications from job
	 * @param id --- refers to jobid
	 */
	@Modifying
	@Transactional
	@Query("delete from JobApplication where jobId = :jobId")
	public void deleteByJobId(@Param("jobId")int id);
	
	/**
	 * deleteApplicantFromJob --- method for removing user from job application
	 * @param jid --- refers to job id
	 * @param uid --- refers to user id
	 */
	@Modifying
	@Transactional
	@Query("delete from JobApplication where jobId = :jobId and userId = :userId")
	public void deleteApplicantFromJob(@Param("jobId")int jid, @Param("userId") int uid);
	
	/**
	 * findAllByUserId --- auto generate query by the JPA
	 * @param id --- refers to user id
	 * @return List<JobApplication> --- list of applications
	 */
	public List<JobApplication> findAllByUserId(int id);
	
	/**
	 * deleteAllByUserId --- method to delete all job application by a user
	 * @param id --- refers to user id
	 */
	@Modifying
	@Transactional
	@Query("delete from JobApplication where userId = :userId")
	public void deleteAllByUserId(@Param("userId") int id);
}

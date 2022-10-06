package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Job;

/**
 * JobRepository --- DAO layer for accessing Job Table
 * @author John Daniel Tejero
 *
 */
public interface JobRepository extends JpaRepository<Job, Integer> {
	
	/**
	 * findByJobId --- auto generate query by the JPA 
	 * @param id --- refers to job id
	 * @return Job object
	 */
	public Job findByJobId(int id);
	
	/**
	 * findAllByUser_id --- method for finding job written by a particular user
	 * @param id --- refers to user id
	 * @return List<Job> --- list of job opportunities
	 */
	@Query("SELECT j FROM Job j WHERE j.user_id = :uid")
	public List<Job> findAllByUser_id(@Param("uid") int id);

	/**
	 * deleteByUser_id --- method for deleting all posted jobs by the particular user
	 * @param id --- refers to user id
	 */
	@Modifying
	@Transactional
	@Query("DELETE FROM Job WHERE user_id = :id")
	public void deleteByUser_id(@Param("id")int id);
}

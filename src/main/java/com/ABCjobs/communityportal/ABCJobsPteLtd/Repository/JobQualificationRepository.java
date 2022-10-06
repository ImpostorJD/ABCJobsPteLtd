package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobExperiences;

/**
 * JobQualificationRepository --- repository for interacting with table jobExperiences
 * @author John Daniel Tejero
 *
 */
public interface JobQualificationRepository extends JpaRepository<JobExperiences, Integer>{
	
	/**
	 * findAllByUserIdOrderByYearStartDesc --- auto generated query by the JPA
	 * @param id --- refers to the user id
	 * @return List<JobExperiences> --- list of job experiences by particular users
	 */
	public List<JobExperiences> findAllByUserIdOrderByYearStartDesc(int id);

	/**
	 * deleteByUserId --- method for deleting all job experiences by user id
	 * @param id --- refers to user id
	 */
	@Modifying
	@Transactional
	@Query("DELETE FROM JobExperiences WHERE userId = :id")
	public void deleteByUserId(@Param("id") int id);
}

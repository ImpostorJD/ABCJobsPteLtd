package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.EducationQualification;

/**
 * EducationBackgroundRepository --- repository for educational qualifiacation
 * @author John Daniel Tejero
 *
 */
public interface EducationBackgroundRepository extends JpaRepository<EducationQualification, Integer>{
	
	/**
	 *  findAllByUserIdOrderByYearStartDesc --- automatically generated query by the JPA
	 * @param id --- refers to the user id
	 * @return
	 */
	public List<EducationQualification> findAllByUserIdOrderByYearStartDesc(int id);

	/**
	 * Deletes all education background of user
	 * @param id --- refers to the user id
	 */
	@Modifying
	@Transactional
	@Query("DELETE FROM EducationQualification WHERE userId = :id")
	public void deleteByUserId(@Param("id") int id);

}

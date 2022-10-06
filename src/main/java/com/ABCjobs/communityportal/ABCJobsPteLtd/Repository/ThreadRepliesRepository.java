package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadReplies;

/**
 * ThreadRepliesRepository --- repository responsible for interacting with reply table
 * @author John Daniel Tejero
 *
 */
public interface ThreadRepliesRepository extends JpaRepository<ThreadReplies, Integer> {
	
	/**
	 * findAllByThreadIdOrderByReplyId --- auto generated query by the JPA
	 * @param id --- refers to the thread id
	 * @return List<ThreadReplies> --- list of thread replies 
	 */
	public List<ThreadReplies> findAllByThreadIdOrderByReplyId(int id);
	
	/**
	 * deleteAllByThreadId --- method for deleting all thread replies based on thread id
	 * @param id --- refers to the thread id
	 */
	@Modifying
	@Transactional
	@Query ("delete from ThreadReplies where threadId = :thid")
	public void deleteAllByThreadId(@Param("thid")int id);
	
	/**
	 * findByUserId --- auto generate query by the JPA
	 * @param id --- refers to the user id
	 * @return List<ThreadReplies> --- returns list of thread replies by the specific user
	 */
	public List<ThreadReplies> findByUserId(int id);
	
	/**
	 * deleteAllByUserId --- delete all threads posted by the user id
	 * @param id --- refers to user id
	 */
	@Modifying
	@Transactional
	@Query ("delete from ThreadReplies where userId = :id")
	public void deleteAllByUserId(@Param("id")int id);
}

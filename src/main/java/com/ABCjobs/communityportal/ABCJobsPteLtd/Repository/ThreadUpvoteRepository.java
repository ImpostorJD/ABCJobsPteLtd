package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadUpvote;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadUpvoteId;

/**
 * ThreadUpvoteRepository --- DAO layer for accessing upvote table
 * @author John Daniel Tejero
 *
 */
public interface ThreadUpvoteRepository extends JpaRepository<ThreadUpvote, ThreadUpvoteId>{
	
	/**
	 * findByThreadId --- auto generated queries by the JPA
	 * @param threadId --- refers to the thread id
	 * @return ThreadUpvote object
	 */
	public ThreadUpvote findByThreadId(int threadId);
	
	/**
	 * findByUserId --- auto generated queries by the JPA
	 * @param uid --- refers to user id
	 * @return ThreadUpvote object
	 */
	public ThreadUpvote findByUserId(int uid);
	
	/**
	 * findByThreadIdAndUserId --- auto generated queries by the JPA
	 * @param threadId --- refers to the thread id
	 * @param userId --- refers to user id
	 * @return ThreadUpvote object
	 */
	public ThreadUpvote findByThreadIdAndUserId(int threadId, int userId);
	
	/**
	 * findAllByThreadId --- auto generated query by the JPA
	 * @param threadId --- refers to the thread id
	 * @return List<ThreadUpvote> --- list of thread upvotes
	 */
	public List<ThreadUpvote> findAllByThreadId(int threadId);
	
	/**
	 * findAllByUserId --- auto generate query by the JPA
	 * @param uid --- refers to user id
	 * @return List<ThreadUpvote> --- list of thread upvotes
	 */
	public List<ThreadUpvote> findAllByUserId(int uid);
	
	/**
	 * findAllByThreadIdAndUserId --- auto generate query by the JPA
	 * @param threadId --- refers to thread id
	 * @param userId --- refers to user id
	 * @return List<ThreadUpvote> --- list of thread upvotes
	 */
	public List<ThreadUpvote> findAllByThreadIdAndUserId(int threadId, int userId);
	
	/**
	 * deleteByThreadIdAndUserId --- method for deleting thread upvote from a particular thread by a user
	 * @param threadId --- refers to thread id
	 * @param userId --- refers user id
	 */
	@Modifying
	@Transactional
	@Query("delete from ThreadUpvote where threadId = :threadID and userId = :userID")
	public void deleteByThreadIdAndUserId(@Param("threadID") int threadId, @Param("userID") int userId);
	
	/**
	 * deleteByThreadId --- method to delete all thread upvotes from a particular thread
	 * @param thid --- refers to thread id
	 */
	@Modifying
	@Transactional
	@Query("delete from ThreadUpvote where threadId = :threadID")
	public void deleteByThreadId(@Param("threadID")int thid);
	
	/**
	 * deleteAllByUserId --- method for deleting all upvotes by a user
	 * @param id --- refers to user id
	 */
	@Modifying
	@Transactional
	@Query("delete from ThreadUpvote where userId = :id")
	public void deleteAllByUserId(@Param("id") int id);
}

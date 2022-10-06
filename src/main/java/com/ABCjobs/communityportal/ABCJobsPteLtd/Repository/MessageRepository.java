package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Message;

/**
 * MessageRepository --- repository for messages
 * @author John Daniel Tejero
 *
 */
public interface MessageRepository extends JpaRepository<Message, Integer>{
	
	/**
	 * findConversation --- method for retrieving chat history
	 * @param sid --- refers to the sender id
	 * @param rid --- refers to the receiver id
	 * @return List<Message> --- list of message sent by both users for each other
	 */
	@Query("select m from Message m WHERE senderId in (:sender, :receiver) and receiverId in (:sender, :receiver) order by dateSent Asc")
	public List<Message> findConversation(@Param("sender") int sid, @Param("receiver")int rid);
	
	/**
	 * findBySenderIdOrReceiverId --- finds message of user;
	 * @param sid --- refers to sender id
	 * @param rid --- refers to receiver id
	 * @return List<Message> --- list of message object
	 */
	public List<Message> findAllBySenderIdOrReceiverId(int sid, int rid);
	
	/**
	 * deleteMessageByUserId --- deletes chat messages by users
	 * @param uid --- refers to user id
	 */
	@Transactional
	@Modifying
	@Query("DELETE FROM Message WHERE senderId = :id OR receiverId = :id")
	public void deleteMessageByUserId(@Param("id") int uid);
}

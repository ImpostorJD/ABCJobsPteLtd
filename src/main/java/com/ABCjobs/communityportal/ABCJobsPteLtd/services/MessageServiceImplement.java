package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Message;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.MessageRepository;

/**
 * MessageServiceImplement --- Implementation of Message Service
 * @author John Daniel Tejero
 *
 */
@Service
public class MessageServiceImplement implements MessageService{
	
	@Autowired
	MessageRepository conversation; /*repository for message table*/
	
	/**
	 * Method for retrieving chat history
	 * @return List<Message> --- list of messages of target user and logged user
	 */
	@Override
	public List<Message> findChatHistory(int sid, int rid) {
		return conversation.findConversation(sid, rid);
	}

	/**
	 * Method for saving chat in the database
	 */
	@Override
	public void sendChat(Message message) {
		conversation.save(message);
	}

}

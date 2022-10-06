package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Message;

/**
 * MessageService --- service for retrieving message and saving message in database
 * See implementation at MessageServiceImplement
 * @author John Daniel Tejero
 *
 */
public interface MessageService {

	public List<Message> findChatHistory(int sid, int rid);
	public void sendChat(Message message);
	
}

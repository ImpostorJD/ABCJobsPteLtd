package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Message;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.MessageService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * MessageController --- controller responsible for mapping the endpoints from where message gets passed
 * @author John Daniel Tejero
 *
 */
@Controller
public class MessageController {

	@Autowired
	LoginUserService loguser; /*service for retrieving authentication context*/
	
	@Autowired
	UserService users; /*service for retrieving users */
	
	@Autowired
	MessageService messageservice; /*service for providing message utilities*/
	
	@Autowired
	GsonBuilder gsonbuilder; /*utility for converting object to string and string to object (JSON)*/

	/**
	 * messageUI method for retrieving page for messaging
	 * @return displayData modeland view containing necessary informations
	 */
	@GetMapping("/message")
	public ModelAndView messageUI() {
		ModelAndView displayData = new ModelAndView(); 
		displayData.setViewName("messaging"); /*default view name for home page*/
		displayData.addObject("UID", loguser.getid()); /*get ID of authenticated user*/
		displayData.addObject("RegisteredUsers", users.retrieveUsers());
		displayData.addObject("userProfile", users.selectUser(loguser.getid())); /*get user information of authenticated user*/
		return displayData;
	}
	
	/**
	 * sendMessage --- method called when user sents a message using web socket
	 * @param message payload received caught as string to be converted as object
	 * @return chatMessage -- the payload which receives some slight refinement such as dates and sender
	 * @throws InterruptedException
	 */
	@MessageMapping("/chat.send")
	@SendTo("/topic/chat")
	public Message sendMessage(String message) throws InterruptedException{
		Thread.sleep(500);
		Gson gson = gsonbuilder.create();
		Message chatMessage = gson.fromJson(message, Message.class);
		chatMessage.setDateSent(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		//save to database
		messageservice.sendChat(chatMessage);
		
		try {
			Date posted = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(chatMessage.getDateSent());
			chatMessage.setDateSent(new SimpleDateFormat("yyyy/MM/dd").format(posted));
			chatMessage.setSender(users.selectUser(chatMessage.getSenderId()).getDisplayName());
			chatMessage.setReceiver(users.selectUser(chatMessage.getReceiverId()).getDisplayName());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return chatMessage;
	}
}

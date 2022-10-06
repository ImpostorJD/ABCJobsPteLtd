package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Message;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.MessageService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * MessageAjaxHandlerController -- Rest Controller for sending JSON to UI
 * @author John Daniel Tejero
 *
 */
@RestController
public class MessageAjaxHandlerController {

	@Autowired
	UserService users; /*service responsible for retrieving users*/
	
	@Autowired
	LoginUserService loggeduser; /*service for retrieving authentication context*/
	
	@Autowired
	MessageService messageServiceProvider; /*service respopnsible for providing message utilities*/
	
	@Autowired
	GsonBuilder gsonbuilder; /*utility for converting json to object and vice versa*/
	
	/**
	 * selectChat method - collects all chat history for the selected user
	 * @param id id of the selected user
	 * @return String as JSON for Front End to consume
	 */
	@GetMapping("/chatUserSelect/{id}")
	public String selectChat(@PathVariable("id") int id) {
		
		List<Message> messages = new ArrayList<>();
		Gson gson = gsonbuilder.create();
		 messageServiceProvider.findChatHistory(loggeduser.getid(), id).forEach(message -> {
			 try {
					Date posted = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(message.getDateSent());
					message.setDateSent(new SimpleDateFormat("yyyy/MM/dd").format(posted));
					message.setSender(users.selectUser(message.getSenderId()).getDisplayName());
					message.setReceiver(users.selectUser(message.getReceiverId()).getDisplayName());
					
					if(message.getSenderId() != message.getReceiverId()) { /*fix for messaging app to avoid bugs*/
						messages.add(message);
					}
					
				} catch (ParseException e) {
					e.printStackTrace();
				}	
		 });
		return gson.toJson(messages);
	}
	
}

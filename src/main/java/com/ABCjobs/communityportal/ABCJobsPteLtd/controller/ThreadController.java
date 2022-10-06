package com.ABCjobs.communityportal.ABCJobsPteLtd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Thread;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadReplies;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.LoginUserService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.ThreadService;
import com.ABCjobs.communityportal.ABCJobsPteLtd.services.UserService;

/**
 * ThreadController --- Java class with controller annotation for processing thread requests
 * @author John Daniel Tejero
 *
 */
@Controller
public class ThreadController {

	@Autowired
	LoginUserService loguser; /*service for retrieving authentication context*/
	
	@Autowired
	ThreadService threadService; /*service for retrieving threads*/
	
	@Autowired
	UserService userRegistered; /*service for retrieving users*/
	
	/**
	 * postThread method --- for creating new thread
	 * @param thread thread for binding user input to thread object
	 * @return String type redirect
	 */
	@PostMapping("/postThread")
	public String postThread(@ModelAttribute("threadModel")Thread thread) {
		thread.setUserId(loguser.getid());
		thread.setPosted(new SimpleDateFormat("yyyy-MM-dd kk:mm:ss").format(new Date()));
		threadService.postThread(thread);
		return "redirect:/home";
	}
	
	/**
	 * upvote --- responsible for the upvote mechanism
	 * @param id --- refers to the thread id
	 * @return String redirect to home page
	 */
	@PostMapping("/upvote")
	public String upvote(@RequestParam("th")int id) {
		threadService.upvote(id, loguser.getid());
		return "redirect:/home";
	}
	
	/**
	 * downvote --- responsible for undoing upvotes
	 * @param id --- refers to the thread id
	 * @return String redirect to home page
	 */
	@PostMapping("/downvote")
	public String downvote(@RequestParam("th")int id) {
		threadService.removeUpvote(id, loguser.getid());
		return "redirect:/home";
	}
	
	/**
	 * deleteThread --- method for deleting thread
	 * @param id --- refers to thread id
	 * @return String redirect to home page
	 */
	@PostMapping("/deleteThread")
	public String deleteThread(@RequestParam("th")int id) {
		threadService.deleteThread(id, loguser.getid());
		return "redirect:/home";
	}
	
	/**
	 * upvoteFromProfile --- responsible for the upvote mechanism
	 * @param id --- refers to the thread id
	 * @return String redirect to current profile user is viewing
	 */
	@PostMapping("/upvoteFromProfile")
	public String upvoteFromProfile(@RequestParam("th")int id, @RequestParam("uid") int uid) {
		threadService.upvote(id, loguser.getid());
		return "redirect:/Profile?UID=" + uid;
	}
	
	/**
	 * downvoteFromProfile --- responsible for undoing upvotes
	 * @param id --- refers to the thread id
	 * @return String redirect to current profile user is viewing
	 */
	@PostMapping("/downvoteFromProfile")
	public String downvoteFromProfile(@RequestParam("th")int id, @RequestParam("uid") int uid) {
		threadService.removeUpvote(id, loguser.getid());
		return "redirect:/Profile?UID=" + uid;
	}
	
	/**
	 * deleteThreadFromProfile --- method for deleting thread
	 * @param id --- refers to thread id
	 * @return String redirect to current profile user is viewing
	 */
	@PostMapping("/deleteThreadFromProfile")
	public String deleteThreadFromProfile(@RequestParam("th")int id, @RequestParam("uid")int uid) {
		threadService.deleteThread(id, loguser.getid());
		return "redirect:/Profile?UID=" + uid;
	}

	/**
	 * threadDetails --- method for retrieving thread information such as replies
	 * @param id --- refers to the thread id
	 * @param reply --- model attribute binded to the reply form
	 * @return displayData --- ModelAndView type which contains all object for thread details
	 */
	@GetMapping("/thread/{thid}")
	public ModelAndView threadDetails(@PathVariable("thid")int id, @ModelAttribute("comment")ThreadReplies reply) {
		ModelAndView displayData = new ModelAndView();
		displayData.setViewName("ThreadDetails");
		displayData.addObject("UID", loguser.getid()); /*get ID of authenticated user*/
		displayData.addObject("thread", threadService.retrieveThread(id));
		displayData.addObject("threadReplies",threadService.retrieveThreadReplies(id));
		displayData.addObject("userProfile", userRegistered.selectUser(loguser.getid())); /*get user information of authenticated user*/
		
		return displayData;
	}
	
	/**
	 * upvoteFromThreadDetails --- responsible for the upvote mechanism
	 * @param id --- refers to the thread id
	 * @return String redirect to current thread details
	 */
	@PostMapping("/upvoteFromThreadDetails")
	public String upvoteFromThreadDetails(@RequestParam("th")int id) {
		threadService.upvote(id, loguser.getid());
		return "redirect:/thread/" + id;
	}
	
	/**
	 * downvoteFromThreadDetails --- responsible for undoing upvotes
	 * @param id --- refers to the thread id
	 * @return String redirect to current thread details
	 */
	@PostMapping("/downvoteFromThreadDetails")
	public String downvoteFromThreadDetails(@RequestParam("th")int id) {
		threadService.removeUpvote(id, loguser.getid());
		return "redirect:/thread/" + id;
	}

	/**
	 * commentToThread --- method for posting comments or thread replies
	 * @param reply --- binded data from thread reply form
	 * @param id --- refers to the thread id
	 * @return String redirect to current thread details
	 */
	@PostMapping("/commentToThread")
	public String commentToThread(@ModelAttribute("comment")ThreadReplies reply, @RequestParam("thid")int id) {
		reply.setReplyPosted(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		reply.setUserId(loguser.getid());
		reply.setThreadId(id);
		threadService.replyToThread(reply);
		return "redirect:/thread/" + id;
	}
	
	/**
	 * deleteReply --- method for deleting replies
	 * @param rid --- refers to the reply Id
	 * @param id --- refers to thread id
	 * @return String redirect to current thread details
	 */
	@PostMapping("/deleteReply")
	public String deleteReply (@RequestParam("RID")int rid, @RequestParam("thid")int id) {
		threadService.deleteReply(rid);
		return "redirect:/thread/" + id;
	}
}

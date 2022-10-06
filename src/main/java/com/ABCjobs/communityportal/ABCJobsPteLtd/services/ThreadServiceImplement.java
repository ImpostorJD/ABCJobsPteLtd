package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Thread;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadReplies;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadUpvote;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.ThreadRepliesRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.ThreadRepository;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.ThreadUpvoteRepository;

/**
 * ThreadServiceImplement --- service for threads
 * @author John Daniel Tejero
 *
 */
@Service
public class ThreadServiceImplement implements ThreadService{

	@Autowired
	UserService users; /*service for interacting with the DAO  layer of users*/
	
	@Autowired
	ThreadRepository threads; /*repository for threads*/
	
	@Autowired
	ThreadUpvoteRepository threadUpvotes; /*repository for thread upvotes*/
	
	@Autowired
	ThreadRepliesRepository threadReplies; /*repository for thread upload*/
	
	@Autowired
	LoginUserService loguser; /*service for retrieving authentication context*/
	
	/**
	 * Method for posting threads
	 */
	@Override
	public void postThread(Thread thread) {
		threads.save(thread);
	}

	/**
	 * Method for retrieving posted threads
	 * @return List<Thread> --- list of thread objects
	 */
	@Override
	public List<Thread> postedThreads() {
		List<Thread> threadPosts = new ArrayList<>();
		threads.findAllByOrderByThreadIdDesc().forEach((thread) -> {
			if(users.selectUser(thread.getUserId()).getDisplayName() != null
					|| !(users.selectUser(thread.getUserId()).getDisplayName()).equals("default")) {
				thread.setAuthor(users.selectUser(thread.getUserId()).getDisplayName());
			}else {
				thread.setAuthor(users.selectUser(thread.getUserId()).getFirstName().concat(" "
						.concat(users.selectUser(thread.getUserId()).getLastName())));
			}
		
			thread.setAuthorImage(users.selectUser(thread.getUserId()).getProfileImagePath());
			//format Dates
			Date posted;
			try {
				posted = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss").parse(thread.getPosted());
				if (posted.getDate() == new Date().getDate() && posted.getMonth() == new Date().getMonth() 
						&& posted.getYear() == new Date().getYear()) {
					if(posted.getHours()>12) {
						thread.setPosted(new SimpleDateFormat("hh:mm").format(posted).concat(" PM"));
					}else {
						thread.setPosted(new SimpleDateFormat("hh:mm").format(posted).concat(" AM"));
					}
				}else {
					thread.setPosted(new SimpleDateFormat("dd MMMM yyyy").format(posted));
					
				}
				
			
			} catch (ParseException e) {
				e.printStackTrace();
			}
			thread.setUpvotes(threadUpvotes.findAllByThreadId(thread.getThreadId()).size());
			thread.setUpvoteList(threadUpvotes.findAllByThreadId(thread.getThreadId()));
			thread.setUserUpvoteInstance(threadUpvotes.findByThreadIdAndUserId(thread.getThreadId(),loguser.getid()));
			threadPosts.add(thread);
		});

		return threadPosts;
	}
	
	
	/**
	 * Method for creating upvote conrtext
	 */
	@Override
	public void upvote(int thid, int id) {
		threadUpvotes.save(new ThreadUpvote(id, thid));
		
	}

	/**
	 * Method for deleting upvote context
	 */
	@Override
	public void removeUpvote(int thid, int id) {
		threadUpvotes.deleteByThreadIdAndUserId(thid, id);
		
	}
	
	/**
	 * Method for collecting all upvoted instance
	 * @return List<ThreadUpvote> --- upvote lists
	 */
	@Override
	public List<ThreadUpvote> userUpvotes(int uid) {
		return threadUpvotes.findAllByUserId(uid);
	}
	
	/**
	 * Method for deleting threads
	 */
	@Override
	public void deleteThread(int thid, int id) {
		
		//delete upvotes
		if (threadUpvotes.findAllByThreadId(thid).size() != 0) {
			threadUpvotes.deleteByThreadId(thid);
		}
		//delete comments
		if(threadReplies.findAllByThreadIdOrderByReplyId(thid).size() != 0) {
			threadReplies.deleteAllByThreadId(thid);
		}
		
		threads.deleteByThreadId(thid);
	}

	/**
	 * Method for retrieving posted threads by users
	 * @return List<Thread> --- list of thread objects by the user
	 */
	@Override
	public List<Thread> postedThreadsByUser(int uid) {
		List<Thread> threadPosts = new ArrayList<>();
		
		for(Thread thread : threads.findAllByUserIdOrderByPostedDesc(uid)) {
			if(users.selectUser(thread.getUserId()).getDisplayName() != null
					|| !(users.selectUser(thread.getUserId()).getDisplayName()).equals("default")) {
				thread.setAuthor(users.selectUser(thread.getUserId()).getDisplayName());
			}else {
				thread.setAuthor(users.selectUser(thread.getUserId()).getFirstName().concat(" "
						.concat(users.selectUser(thread.getUserId()).getLastName())));
			}
			thread.setAuthorImage(users.selectUser(thread.getUserId()).getProfileImagePath());
			//format Dates
			Date posted;
			try {
				posted = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss").parse(thread.getPosted());
				if ((posted.getDay() - new Date().getDay()) < 0 && posted.getYear() != new Date().getYear()) {
					thread.setPosted(new SimpleDateFormat("dd MMMM yyyy").format(posted));
				}else {
					if(posted.getHours()>12) {
						thread.setPosted(new SimpleDateFormat("hh:mm").format(posted).concat(" PM"));
					}else {
						thread.setPosted(new SimpleDateFormat("hh:mm").format(posted).concat(" AM"));
					}
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			thread.setUpvotes(threadUpvotes.findAllByThreadId(thread.getThreadId()).size());
			thread.setUpvoteList(threadUpvotes.findAllByThreadId(thread.getThreadId()));
			thread.setUserUpvoteInstance(threadUpvotes.findByThreadIdAndUserId(thread.getThreadId(),loguser.getid()));
			threadPosts.add(thread);
			
		}
		return threadPosts;
	}

	/**
	 * Method for retrieving specific thread details
	 * @return Thread object
	 */
	@Override
	public Thread retrieveThread(int id) {
		Thread thread =  threads.findByThreadId(id);
		if(users.selectUser(thread.getUserId()).getDisplayName() != null
				|| !(users.selectUser(thread.getUserId()).getDisplayName()).equals("default")) {
			thread.setAuthor(users.selectUser(thread.getUserId()).getDisplayName());
		}else {
			thread.setAuthor(users.selectUser(thread.getUserId()).getFirstName().concat(" "
					.concat(users.selectUser(thread.getUserId()).getLastName())));
		}
		thread.setAuthorImage(users.selectUser(thread.getUserId()).getProfileImagePath());
		//format Dates
		Date posted;
		try {
			posted = new SimpleDateFormat("yyyy-MM-dd").parse(thread.getPosted());
			thread.setPosted(new SimpleDateFormat("dd MMMM yyyy").format(posted));
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		thread.setUpvotes(threadUpvotes.findAllByThreadId(thread.getThreadId()).size());
		thread.setUpvoteList(threadUpvotes.findAllByThreadId(thread.getThreadId()));
		thread.setUserUpvoteInstance(threadUpvotes.findByThreadIdAndUserId(thread.getThreadId(),loguser.getid()));
		
		return thread;
		
	}

	/**
	 * Method for retrieving thread replies
	 * @return List<ThreadReplies> --- list of thread replies instance
	 */
	@Override
	public List<ThreadReplies> retrieveThreadReplies(int thid) {
		List<ThreadReplies> replies = new ArrayList<ThreadReplies>();
		
		for(ThreadReplies reply : threadReplies.findAllByThreadIdOrderByReplyId(thid)) {
			if(users.selectUser(reply.getUserId()).getDisplayName() != null
					|| !(users.selectUser(reply.getUserId()).getDisplayName()).equals("default")) {
				reply.setAuthor(users.selectUser(reply.getUserId()).getDisplayName());
			}else {
				reply.setAuthor(users.selectUser(reply.getUserId()).getFirstName().concat(" "
						.concat(users.selectUser(reply.getUserId()).getLastName())));
			}
		
			
			reply.setAuthorImage(users.selectUser(reply.getUserId()).getProfileImagePath());
			Date posted;
			try {
				posted = new SimpleDateFormat("yyyy-MM-dd").parse(reply.getReplyPosted());
				reply.setReplyPosted(new SimpleDateFormat("dd MMMM yyyy").format(posted));
			
			} catch (ParseException e) {
				e.printStackTrace();
			}
			replies.add(reply);
		}
		return replies;
	}

	/**
	 * Method for inserting new reply to thread
	 */
	@Override
	public void replyToThread(ThreadReplies reply) {
		threadReplies.save(reply);
	}

	/**
	 * Method for deleting reply
	 */
	@Override
	public void deleteReply(int rid) {
		threadReplies.deleteById(rid);
	}


}

package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Thread;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadReplies;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.ThreadUpvote;

/**
 * ThreadService --- Service interface for communicating between Controller and ThreadRepository
 * Seee implementation at ThreadServiceImplement
 * @author John Daniel Tejero
 *
 */
public interface ThreadService {
	
	public void postThread(Thread thread);
	public List<Thread> postedThreads();
	public Thread retrieveThread(int id);
	public void upvote(int thid, int id);
	public void removeUpvote(int thid, int id);
	public List<ThreadUpvote> userUpvotes(int uid);
	public void deleteThread(int thid, int id);
	public List<Thread> postedThreadsByUser(int uid);
	public List<ThreadReplies> retrieveThreadReplies(int thid);
	public void replyToThread(ThreadReplies reply);
	public void deleteReply(int rid);
}

package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;

/**
 * SearchService --- interface that abstracts the method for search
 * See SearchServiceImplement for implementation of method
 * @author John Daniel Tejero
 *
 */
public interface SearchService {
	
	public  List<UserContainer> searchUser(String search);

}

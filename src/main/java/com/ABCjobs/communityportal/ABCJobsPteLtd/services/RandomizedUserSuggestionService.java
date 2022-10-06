package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.beans.UserContainer;

/**
 * RandomizedUserSuggestionService --- interface that abstracts the method for randomizing user information
 * See RandomizedUserSuggestionServiceImplement for implementation of methods
 * @author John Daniel Tejero
 *
 */
public interface RandomizedUserSuggestionService {
	public List<UserContainer> suggestedUsers();
}

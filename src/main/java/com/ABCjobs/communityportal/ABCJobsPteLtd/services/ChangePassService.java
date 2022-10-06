package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

/**
 * ChangePassService --- interface which abstracts the method to be implemented
 * See implementation at ChangePassServiceImplement.java
 * @author John Daniel Tejero
 */

public interface ChangePassService {
	public void tempContainer(String email);
	public String getEmail();
	public void clearContainer();
	public String generateCode();
}

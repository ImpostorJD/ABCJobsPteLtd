package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import org.springframework.stereotype.Service;

/**
 * ChangePassServiceImplement --- implements the method specified in ChangePassService interface
 * @author John Daniel Tejero
 *
 */
@Service
public class ChangePassServiceImplement implements ChangePassService{

	private String email; //for storing email temporarily
	
	/**
	 * Method which sets the email temporarily
	 * @param String email, string to be set on the temporary field
	 */
	@Override
	public void tempContainer(String email) {
		this.email = email; 
	}
	
	/**
	 * method which retrieves the email
	 * @return the email stored in the field
	 */
	@Override
	public String getEmail() {
		return email;
	}
	
	/**
	 * method that clears the temporary container
	 */
	@Override
	public void clearContainer() {
		this.email = null;
	}
	
	/**
	 * Method for randomly generating 6-digits code
	 * @return String of 6 digit codes
	 */
	@Override
	public String generateCode() {
		
		String codeForVerification = new String(); /*Creates new string*/
		
		for(int i = 0; i < 6; i++) {
			int number = (int) Math.floor(Math.random()*9); /*randomize number from 0 - 9*/
			codeForVerification = codeForVerification + number; /*appends the random number to string*/
		}
		return codeForVerification; /*returns the 6-digits code*/
	}

	
}

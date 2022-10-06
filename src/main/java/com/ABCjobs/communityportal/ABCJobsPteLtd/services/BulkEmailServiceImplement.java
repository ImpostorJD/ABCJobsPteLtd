package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.BulkEmail;
import com.ABCjobs.communityportal.ABCJobsPteLtd.Repository.BulkEmailRepository;

/**
 * BulkEmailServiceImplement --- Implements the method of BulkEmailService
 * @author John Daniel Tejero
 *
 */
@Service
@Transactional
public class BulkEmailServiceImplement implements BulkEmailService{

	@Autowired
	BulkEmailRepository emailRepo; //interacts with table BulkEmail for insertion and updation
	
	@Autowired
	EmailService emailService; //service for SMTP utility
	/**
	 * Method that inserts new record to the database
	 */
	@Override
	public void createEmail(BulkEmail email) {
		emailRepo.save(email);
	}

	
	/**
	 * Method that returns collections of email
	 * @return BulkEmail collections from database 
	 */
	@Override
	public List<BulkEmail> collectAllEmail() {
		return emailRepo.findAll();
	}

	/**
	 * Method that deletes a particular email
	 */
	@Override
	public void deleteEmail(int id) {
		emailRepo.deleteById(id);
		
	}


	/**
	 * This method is for sending bulk email using email utility
	 */
	@Override
	public void sendBulk(int id) {
		try {
			emailService.sendBulkEmail(emailRepo.findByBulkID(id));
			emailRepo.setToSent(id);
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}
	}


	/**
	 * This method validates if the email sent is valid or not
	 */
	@Override
	public boolean validate(BulkEmail emailForm) {
		String regexp = "^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$"; /*Regular Expression pattern to be tested*/
		for (String email : Arrays.asList(emailForm.getTarget().split(","))) {
			if (!Pattern.matches(regexp, email)) {
				return false;
			}
		}
		return true;
	}

}

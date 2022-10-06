package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.BulkEmail;

/**
 * EmailService --- interface for sending email using SMTP
 * see implementation at EmailServiceImplementation
 * @author John Daniel Tejero
 *
 */
public interface EmailService {
	public void sendAccountActivation(String to, String subject, String url) throws UnsupportedEncodingException, MessagingException;
	public void sendVerificationCode(String to, String subject, String content);
	public void sendBulkEmail(BulkEmail email) throws UnsupportedEncodingException, MessagingException;
}

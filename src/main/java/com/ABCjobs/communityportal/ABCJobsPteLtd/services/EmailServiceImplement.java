package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.BulkEmail;

/**
 * EmailServiceImplement --- annotated as component as it is not a part of the business flow and it is only a utility for sending emails
 * @author John Daniel Tejero
 *
 */
@Component
public class EmailServiceImplement implements EmailService{

	@Autowired
	private JavaMailSender emailSender; /*utility for sending email*/
	
	/**
	 * sendAccountActivation --- method for sending email instruction for account activation
	 */
	@Override
	public void sendAccountActivation(String to, String subject, String url) throws UnsupportedEncodingException, MessagingException { 
		MimeMessage messages = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(messages);
		helper.setFrom("noreply@abcportal.com", "ABC Jobs");
		helper.setTo(to);
		helper.setSubject(subject);
		String content = "Greetings,<br>"
				+ "Please click the link below to activate your account:<br>"
				+ "<h3>"
				+ "<a href =\"[[url]]\" target = \"_self\">Verify</a>"
				+ "</h3>"
				+ "Regards, <br>"
				+ "ABC Jobs";
		
		content = content.replace("[[url]]", url + "/Register-Success?u=" + to);
		helper.setText(content, true);
	    emailSender.send(messages);
		
	}

	/**
	 * sendVerificationCode --- method for sending verification code in forget password
	 */
	@Override
	public void sendVerificationCode(String to, String subject, String content) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("noreply@abcportal.com");
		message.setTo(to);
		message.setSubject(subject);
		message.setText(content);
		emailSender.send(message);
		
	}

	/**
	 * sendBulkEmail --- method for sending email to multiple users
	 */
	@Override
	public void sendBulkEmail(BulkEmail email) throws UnsupportedEncodingException, MessagingException {
		MimeMessage bulkemail = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(bulkemail);
		helper.setFrom("noreply@abcportal.com", "ABC Jobs");
		helper.setSubject(email.getSubject());
		helper.setText(email.getContent());
		List<String> targets = Arrays.asList(email.getTarget().split(","));
		
		for(String target : targets) {
			helper.setTo(target);
			emailSender.send(bulkemail);
		}
	}

}

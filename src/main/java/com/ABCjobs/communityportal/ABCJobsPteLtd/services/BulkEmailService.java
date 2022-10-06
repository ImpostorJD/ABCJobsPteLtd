package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.BulkEmail;

/**
 * BulkEmailService --- Service for sending email to users
 * See implementation at BulkEmailServiceImplement
 * @author John Daniel Tejero
 *
 */
public interface BulkEmailService {

	public void createEmail(BulkEmail email);
	public List<BulkEmail> collectAllEmail();
	public void deleteEmail(int id);
	public void sendBulk(int id);
	public boolean validate(BulkEmail emailForm);
}

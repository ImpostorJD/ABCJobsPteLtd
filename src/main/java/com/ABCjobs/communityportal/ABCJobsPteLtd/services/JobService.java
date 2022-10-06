package com.ABCjobs.communityportal.ABCJobsPteLtd.services;

import java.util.List;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.Job;
import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.JobApplication;

/**
 * JobService --- interface for declaring methods for services
 * See implementation on JobServiceImplement
 * @author John Daniel Tejero
 *
 */
public interface JobService {
	public List<Job> jobListing();
	public void jobPosting(Job job);
	public Job searchForJob(int id);
	public void deleteJob(int id);
	public void applyJob(int uid, int jid); 
	public JobApplication retrieveUserApplication(int uid, int jid);
	public List<JobApplication> retrieveApplicants(int jid);
	public void deleteApplicant(int jid, int uid);
}

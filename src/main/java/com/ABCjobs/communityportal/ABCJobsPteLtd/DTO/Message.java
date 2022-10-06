package com.ABCjobs.communityportal.ABCJobsPteLtd.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Message --- Java class for mapping message table
 * @author John Daniel Tejero
 *
 */
@Entity
@Table(name = "messages")
public class Message {
	
	/*fields in message table*/
	@Id
	@Column(name = "msg_id")
	private int msgId;
	
	@Column(name = "msg_body")
	private String msgBody;
	
	@Transient
	private String sender;
	
	@Transient
	private String receiver;
	
	@Column(name = "msg_datesent")
	private String dateSent;
	
	@Column(name = "user_id")
	private int senderId;
	
	@Column(name = "receivesuser_id")
	private int receiverId;

	/*constructors*/
	public Message() {
		
	}
	
	public Message(Message message) {
		this.msgId = message.getMsgId();
		this.msgBody = message.getMsgBody();
		this.dateSent = message.getDateSent();
		this.senderId = message.getSenderId();
		this.receiverId = message.getReceiverId();
	}
	
	public Message(int id, String body, String date, int senderId, int receiverId) {
		this.msgId = id;
		this.msgBody = body;
		this.dateSent = date;
		this.senderId = senderId;
		this.receiverId = receiverId;
	}
	
	/*getters and setters*/
	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public String getMsgBody() {
		return msgBody;
	}

	public void setMsgBody(String msgBody) {
		this.msgBody = msgBody;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getDateSent() {
		return dateSent;
	}

	public void setDateSent(String dateSent) {
		this.dateSent = dateSent;
	}

	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}
	
	

}

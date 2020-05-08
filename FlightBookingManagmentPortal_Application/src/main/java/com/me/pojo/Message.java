package com.me.pojo;

import java.util.Date;

public class Message {
	private long msgID;
	private String toUser;
	private String sender;
	private String message;
	private String msgdate;
	
	public Message() {
		
	}

	public long getMsgID() {
		return msgID;
	}

	public void setMsgID(long msgID) {
		this.msgID = msgID;
	}

	public String getToUser() {
		return toUser;
	}

	public void setToUser(String toUser) {
		this.toUser = toUser;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMsgdate() {
		return msgdate;
	}

	public void setMsgdate(String msgdate) {
		this.msgdate = msgdate;
	}


	
}

package com.project.weekend.mail;


public interface MailService {
	/*
	 * void send(SimpleMailMessage simpleMailMessage)throws Exception; void
	 * send(SimpleMailMessage[] simpleMailMessages)throws Exception;
	 */
	 public boolean send(String subject, String text, String from, String to, String filePath);
}

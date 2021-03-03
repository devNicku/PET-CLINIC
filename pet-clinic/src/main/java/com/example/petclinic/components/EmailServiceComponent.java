package com.example.petclinic.components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.petclinic.services.SendEmailService;

@Component
public class EmailServiceComponent {
	
	@Autowired
    private SendEmailService sendEmailService;
	
	public void sendSimpleMessage(String to, String body, String topic) {
		sendEmailService.sendEmail(to, body, topic);
	}

}

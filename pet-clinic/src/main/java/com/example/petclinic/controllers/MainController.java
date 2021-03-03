package com.example.petclinic.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.petclinic.components.EmailServiceComponent;

@Controller
public class MainController {
	@Autowired
	private EmailServiceComponent sendEmail;
	
	@GetMapping("/")
	public String index() {
//		sendEmail.sendSimpleMessage("stsnicky@gmail.com", "hello from pet clinic", "Appointment");
		return "home.jsp";
	}
	@GetMapping("/appointment")
	public String appoint() {
		return "appointment.jsp";
	}
}

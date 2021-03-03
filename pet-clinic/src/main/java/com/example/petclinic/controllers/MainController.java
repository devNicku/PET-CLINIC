package com.example.petclinic.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.petclinic.models.User;
import com.example.petclinic.services.UserService;
import com.example.petclinic.validator.UserValidator;

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

	UserService userService;
	 
	@Autowired
	 private UserValidator userValidator;
	 
	 public MainController(UserService userService, UserValidator userValidator) {
	        this.userService = userService;
	        this.userValidator = userValidator;
	 }
	
	
	@RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
	
	@RequestMapping("/register")
    public String registerAdminForm(@Valid @ModelAttribute("user") User user) {
        return "adminRegistration.jsp";
    }
    
	@RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }
	
	 @PostMapping("/registration")
	  public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
		 userValidator.validate(user, result);
		 if (result.hasErrors()) {
	            return "registrationPage.jsp";
	        }
		  userService.saveWithUserRole(user);
	        return "redirect:/login";
	 }
	 
	 @PostMapping("/register")
	  public String registrationAdmin(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session, @RequestParam("ocupation") long number) {
		 userValidator.validate(user, result);
		 if (result.hasErrors()) {
	            return "registrationPage.jsp";
	        }
		  userService.saveUserWithAdminRole(user, number);
	        return "redirect:/login";
	 }
	 
	 @RequestMapping(value = {"/", "/home"})
	    public String home(Principal principal, Model model) {
	        String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
	        return "index.jsp";
	    }
	 
	 @RequestMapping("/admin")
	    public String adminPage(Principal principal, Model model) {
	        String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
	        return "adminPage.jsp";
	    }	

}

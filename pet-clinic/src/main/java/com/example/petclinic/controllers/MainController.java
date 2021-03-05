package com.example.petclinic.controllers;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.petclinic.components.EmailServiceComponent;
import com.example.petclinic.models.Appointment;
import com.example.petclinic.models.Pet;
import com.example.petclinic.models.Specie;
import com.example.petclinic.models.User;
import com.example.petclinic.services.AppointmentService;
import com.example.petclinic.services.PetService;
import com.example.petclinic.services.SpecieService;
import com.example.petclinic.services.UserService;
import com.example.petclinic.validator.UserValidator;

@Controller
public class MainController {
	@Autowired
	private EmailServiceComponent sendEmail;
	
	@Autowired
	 private UserValidator userValidator;
	
	@Autowired
	private SpecieService specieService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private AppointmentService  appointmentService;
	
	@Autowired
	private UserService userService;
	
//	public MainController(UserService userService, UserValidator userValidator) {
//		this.userService = userService;
//		this.userValidator = userValidator;
//	}
	
	@GetMapping("/")
	public String index() {
		return "redirect:/home";
	}
	@GetMapping("/appointment")
	public String appoint() {
		return "appointment.jsp";
	}
	
	@RequestMapping("/register")
    public String registerAdminForm(@Valid @ModelAttribute("user") User user) {
        return "adminRegistration.jsp";
    }
    
	@RequestMapping("/login")
    public String login(@Valid @ModelAttribute("user") User user, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginReg.jsp";
    }

	 @PostMapping("/registration")
	  public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
		 userValidator.validate(user, result);
		 if (result.hasErrors()) {
	            return "loginReg.jsp";
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
		    String username; 
		    if(principal == null) {
		    	username = "Guest";
		    	model.addAttribute("currentUser", username);
		    }else {
		    	username = principal.getName();
		    	model.addAttribute("currentUser", userService.findByUsername(username));
		    }
	        return "home.jsp";
	    }
	 @RequestMapping("/admin")
	    public String adminPage(Principal principal, Model model) {
	        String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
	        List<Appointment> appointments = appointmentService.allAppointments();
	        model.addAttribute("appointments", appointments);
	        return "adminPage.jsp";
	    }
	 
	 @RequestMapping("/add/pet")
	 	public String addPetPage(@Valid @ModelAttribute("petModel") Pet pet, Principal principal, Model model) {
		 String username = principal.getName();
	     model.addAttribute("currentUser", userService.findByUsername(username));
	     List<Specie> allspecies = specieService.allSpecies();
	     model.addAttribute("species", allspecies ); 
		 return "addPet.jsp"; 
	 }
	 @PostMapping("/add/pet")
	 	public String addPet(@Valid @ModelAttribute("petModel") Pet pet, BindingResult result) {
		 if(result.hasErrors()) {
			 return "addPet.jsp";
		 }
		 petService.createPet(pet);
		 return "redirect:/home";
	 }
	 @RequestMapping("/add/appointment") 

	 public String appoitmentPage(Principal principal, Model model,@ModelAttribute("appointment") Appointment appointment) {
		 String username = principal.getName();
		 User u = userService.findByUsername(username);
		 model.addAttribute("currentUser", u);
		 List<User> veterinarians = userService.findByVet();
		 model.addAttribute("veterinarians", veterinarians);
		 List<User> groomers = userService.findByGroom();
		 model.addAttribute("groomers", groomers);
		 Long id = u.getId();
		 List<Pet> allpets = petService.findPetsByOwner(u);
		 model.addAttribute("pets", allpets);
		 return "appointment.jsp";
	 }

	 @PostMapping("/add/appointment")
	 public String createAppointment(@Valid @ModelAttribute("appointment") Appointment appointment,BindingResult result, Principal principal){

		 if(result.hasErrors()) {
			 return "appointment.jsp";
		 }
		 appointmentService.createAppointment(appointment);
		 String username = principal.getName();
		 User u = userService.findByUsername(username);
		 String email = u.getEmail();
		 Date date = appointment.getDateTime();
		 Date time = appointment.getTime();
		 String servicePerson = appointment.getAssigned().getNombre();
		 String msg = "You have an Appointment with "+servicePerson+" on "+date+" "+time;
		 
		 sendEmail.sendSimpleMessage(email, msg, "Appointment");
		 return "redirect:/home";
	 }

}

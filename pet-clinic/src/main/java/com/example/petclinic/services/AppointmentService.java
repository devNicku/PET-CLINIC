package com.example.petclinic.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.petclinic.models.Appointment;
import com.example.petclinic.repositories.AppointmentRepo;

@Service
public class AppointmentService {
	private final AppointmentRepo appointmentRepo;
	
	public AppointmentService(AppointmentRepo appointmentRepo) {
		this.appointmentRepo= appointmentRepo;
	}
	
	public Appointment createAppointment(Appointment p) {
		return this.appointmentRepo.save(p);
	}
	
	public List<Appointment> allAppointments(){
		return this.appointmentRepo.findAll();
	}

}

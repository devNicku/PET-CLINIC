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
	
	public List<Appointment> orderAppointments(){
		return this.appointmentRepo.findByOrderByDateTimeAsc();
	}
	
	public List<Appointment> appointmentsByid(Long id){
		return this.appointmentRepo.findByOwnerId(id);
		
	}
	public List<Appointment> pastAppointments(Long id){
		return this.appointmentRepo.pastApppointments(id);	
	}
	
	public List<Appointment> nextAppointments(Long id){
		return this.appointmentRepo.nextApppointments(id);
	}
	
	public List<Appointment> todayAppointments(){
		return this.appointmentRepo.todayApppointments();
	}
	
	public List<Appointment> nextDaysAppointments(){
		return this.appointmentRepo.nextDaysAppointments();
	}


}

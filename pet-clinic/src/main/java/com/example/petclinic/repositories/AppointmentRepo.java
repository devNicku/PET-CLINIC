package com.example.petclinic.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.petclinic.models.Appointment;
@Repository
public interface AppointmentRepo extends CrudRepository <Appointment,Long> {
	List<Appointment> findAll();
	List<Appointment> findByOrderByDateTimeAsc();
	List<Appointment> findByOwnerId(Long id);
	@Query(value="select * from appointments where date_time < current_date() and owner_id =?1", nativeQuery = true)
	List<Appointment> pastApppointments(Long id);
	@Query(value="select * from appointments where date_time >= current_date() and owner_id =?1", nativeQuery = true)
	List<Appointment> nextApppointments(Long id);
	@Query(value="select * from appointments where date_time = current_date()", nativeQuery = true)
	List<Appointment> todayApppointments();
	@Query(value="select * from appointments where date_time > current_date()", nativeQuery = true)
	List<Appointment> nextDaysAppointments();
}

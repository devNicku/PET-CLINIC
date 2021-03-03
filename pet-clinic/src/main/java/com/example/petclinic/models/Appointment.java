package com.example.petclinic.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="appointments")
public class Appointment {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private Date date;
	
	private String service;
	
	private Boolean status;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="assigned_id")
	private User assigned;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="pet_id")
	private Pet pet;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="owner_id")
	private User owner;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	public Appointment() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public User getAssigned() {
		return assigned;
	}

	public void setAssigned(User assigned) {
		this.assigned = assigned;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }  

	
	
}

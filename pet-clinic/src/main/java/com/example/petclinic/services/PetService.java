package com.example.petclinic.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.petclinic.models.Pet;
import com.example.petclinic.models.User;
import com.example.petclinic.repositories.PetRepo;

@Service
public class PetService {
	private final PetRepo petRepo;
	
	public PetService(PetRepo petRepo) {
		this.petRepo= petRepo;
	}
	
	public Pet createPet(Pet pet) {
		return this.petRepo.save(pet);
	}
	
	public List<Pet> findPetsByOwner(User user){
		return this.petRepo.findByOwner(user);
	}

}

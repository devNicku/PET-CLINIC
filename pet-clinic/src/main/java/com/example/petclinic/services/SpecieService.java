package com.example.petclinic.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.petclinic.models.Specie;
import com.example.petclinic.repositories.SpecieRepo;
@Service
public class SpecieService {
	private final SpecieRepo specieRepo;
	
	
	public SpecieService(SpecieRepo specieRepo) {
		this.specieRepo=specieRepo;
	}
	
	public List<Specie> allSpecies(){
		return specieRepo.findAll();
	}

}

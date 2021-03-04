package com.example.petclinic.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.petclinic.models.Specie;
@Repository
public interface SpecieRepo extends CrudRepository<Specie, Long> {
	List<Specie> findAll();

}

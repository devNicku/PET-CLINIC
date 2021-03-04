package com.example.petclinic.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.petclinic.models.Pet;
import com.example.petclinic.models.User;

@Repository
public interface PetRepo extends CrudRepository<Pet, Long>{
  List<Pet> findAll();
  List<Pet> findByOwner(User user);
}

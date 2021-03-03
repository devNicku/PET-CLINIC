package com.example.petclinic.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.petclinic.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {
	 User findByUsername(String username);
}

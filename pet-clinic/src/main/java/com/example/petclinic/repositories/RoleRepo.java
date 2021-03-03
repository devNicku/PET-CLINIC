package com.example.petclinic.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.petclinic.models.Role;

@Repository
public interface RoleRepo extends CrudRepository<Role, Long> {
	List<Role> findAll();
	List<Role> findByNameRole(String name);
}

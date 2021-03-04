package com.example.petclinic.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.petclinic.models.Role;
import com.example.petclinic.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {
	 User findByUsername(String username);
	 List<User> findByRoles_NameRole(String roleName);
	 //List<User> findByNameRoleContaining(String name);
}

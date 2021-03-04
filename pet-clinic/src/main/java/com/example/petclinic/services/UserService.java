package com.example.petclinic.services;


import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.petclinic.models.User;
import com.example.petclinic.repositories.RoleRepo;
import com.example.petclinic.repositories.UserRepo;


@Service
public class UserService {
	  private UserRepo userRepository;
	  private RoleRepo roleRepository;
	  private BCryptPasswordEncoder bCryptPasswordEncoder;
	  
	  
	  
	  public UserService(UserRepo userRepository, RoleRepo roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder){
	        this.userRepository = userRepository;
	        this.roleRepository = roleRepository;
	        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	    }
	  
	  	
	    public void saveWithUserRole(User user) {
	        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        user.setRoles(roleRepository.findByNameRole("ROLE_USER"));
	        userRepository.save(user);
	    }
	     
	     
	    public void saveUserWithAdminRole(User user, Long number) {
	        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        if(number == 1) {
	        	 user.setRoles(roleRepository.findByNameRole("ROLE_VET"));
	 	        userRepository.save(user);
	        }else if (number == 2) {
	        	user.setRoles(roleRepository.findByNameRole("ROLE_GROOMER"));
	 	        userRepository.save(user);
	        }
	    }    
	    
	    public List<User> findByVet(){
	    	return this.userRepository.findByRoles_NameRole("ROLE_VET");
	    }
	    
	    public List<User> findByGroom(){
	    	return this.userRepository.findByRoles_NameRole("ROLE_GROOMER");
	    }
	
	 
	    public User findByUsername(String username) {
	        return userRepository.findByUsername(username);
	    }
	    
	    public User findUserById(Long id) {
	    	Optional<User> u = userRepository.findById(id);
	    	if(u.isPresent()) {
	            return u.get();
	    	} else {
	    	    return null;
	    	}
	    	
	    }

}

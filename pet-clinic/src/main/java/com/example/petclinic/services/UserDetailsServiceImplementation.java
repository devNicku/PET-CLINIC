package com.example.petclinic.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.petclinic.repositories.UserRepo;
import com.example.petclinic.models.Role;
import com.example.petclinic.models.User;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
	private UserRepo userRepo;
	
	 public UserDetailsServiceImplementation(UserRepo userRepository){
	        this.userRepo = userRepository;
	    }
	 
	 	// 1
	    @Override
	    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	        User user = userRepo.findByUsername(username);
	        
	        if(user == null) {
	            throw new UsernameNotFoundException("User not found");
	        }
	        
	        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), getAuthorities(user));
	    }
	    
	 
	    private List<GrantedAuthority> getAuthorities(User user){
	        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	        for(Role role : user.getRoles()) {
	            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getNameRole());
	            authorities.add(grantedAuthority);
	        }
	        return authorities;
	    }

}

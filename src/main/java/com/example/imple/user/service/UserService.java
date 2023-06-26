package com.example.imple.user.service;

import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	public boolean checkId(String id) {
		return id.equals(id);
	}
	
}

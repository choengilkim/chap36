package com.example.imple.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserLoginController {

	@GetMapping("login") //user로 들어오면 login으로 매핑이 된다
	void login() {
		
	}
	
	@PostMapping("/login-fail") //url /안쓰고 -씀
	String loginFail() {
		
		return "user/login";
	}
	
}

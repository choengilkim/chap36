package com.example.imple.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.user.mapper.UserMapper;
import com.example.imple.user.model.UserDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserCreateController implements CreateController<UserDTO> {
	
	@Autowired
	UserMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public void create(Model model, HttpServletRequest request) {
		log.info("GET create()...");
		var error = request.getParameter("error");
		if (error == null) { 
			var session = request.getSession();
			session.removeAttribute("user");
			session.removeAttribute("binding");
		}
	}

	@Override
	@Transactional
	@PostMapping("/register")
	public String create(UserDTO dto, BindingResult binding, Model model, HttpServletRequest request, RedirectAttributes attr) {
		log.info("POST create()...");
		
		var session = request.getSession();
		session.setAttribute("user", dto);
		session.setAttribute("binding", binding);
		
		if (binding.hasErrors()) {
			return "redirect:/user/login?error";
		}
		
		var user = dto.getModel();
	    String encodedPassword = passwordEncoder.encode(user.getPassword());
	    user.setPassword(encodedPassword);
		
		
		try {
			mapper.insertUser(user);
		} catch (DuplicateKeyException e) {
			binding.reject("", "동일한 아이디가 있습니다."); //reject는 글로벌에러로 들어감
			return "redirect:/user/login?error";
		}
		return "redirect:/user/success";
	}
	
}

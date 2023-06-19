//package com.example.imple.user.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.dao.DuplicateKeyException;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.example.imple.user.mapper.UserMapper;
//import com.example.imple.user.model.User;
//import com.example.imple.user.model.UserDTO;
//
//import jakarta.servlet.http.HttpServletRequest;
//
//@Controller
//@RequestMapping("/user")
//public class UserController {
//
//	@Autowired
//	UserMapper userMapper;
//	
//	@Autowired
//	private PasswordEncoder passwordEncoder;
//	
//	public UserController(UserMapper userMapper, PasswordEncoder passwordEncoder) {
//		this.userMapper = userMapper;
//		this.passwordEncoder = passwordEncoder;
//	}
//	
//	@Transactional
//	@PostMapping("/register")
//	public String registerUser(UserDTO userDTO, BindingResult binding, Model model, HttpServletRequest request,  RedirectAttributes attr) {
//		
//		var session = request.getSession();
//	    session.setAttribute("user", userDTO);
//	    session.setAttribute("binding", binding);
//
//	    if (binding.hasErrors()) {
//	        attr.addFlashAttribute("errorMessage", "입력값이 유효하지 않습니다.");
//	        return "redirect:/register";
//	    }
//
//	    User user = userDTO.getModel();
//	    String encodedPassword = passwordEncoder.encode(user.getPassword());
//	    user.setPassword(encodedPassword);
//
//	    try {
//	        userMapper.insertUser(user);
//	    } catch (DuplicateKeyException e) {
//	    	binding.rejectValue("id", "duplicate.key", "동일한 아이디가 이미 존재합니다.");
//	        return "redirect:/user/login?error";
//	    }
//	    
//	    return "redirect:/user/success";
//		
////		User user = userDTO.getModel();
////		String encodedPassword = passwordEncoder.encode(user.getPassword());
////		user.setPassword(encodedPassword);
////	    int rowsAffected = userMapper.insertUser(user);
////	    if (rowsAffected > 0) {
////	      return "redirect:/login"; 
////	    } else {
////	      return "redirect:/register"; 
////	    }
////	  
//	}
//	
//	
//}

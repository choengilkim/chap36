package com.example.standard.controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

public interface DeleteController<DTO> { //emp나 다른곳에서도 쓸수있게 DTO로 제너릭해줌

	@GetMapping("/delete") 
	void delete(Model model, HttpServletRequest request);
	
	@PostMapping("/delete") //get방식과 다르게 url에 정보가 안나타남(보안) redirect해줘야함 (forward X)
	String delete(@Valid DTO dto, BindingResult binding, Model model, HttpServletRequest request, RedirectAttributes attr);
}

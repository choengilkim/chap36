package com.example.imple.country.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.country.mapper.CountryMapper;
import com.example.imple.country.model.CountryDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/country")
@Slf4j
public class CountryCreateController implements CreateController<CountryDTO> {
	
	@Autowired
	CountryMapper mapper;
	
	@Override
	public void create(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("country");
			session.removeAttribute("binding");
		}
			
		
	}

	@Override
	@Transactional
	public String create(@Valid CountryDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("country", dto);
		session.setAttribute("binding", binding);
		
		var code = dto.getCode().trim();
		var code2 = dto.getCode2().trim();

		if (code.length() != 3) {
		    binding.rejectValue("code", "9999", "를 3자리로 입력하세요");
		}
		if (!code2.equals(""))
			if (code2.length() != 2) {
			    binding.rejectValue("code2", "9999", "를 2자리로 입력하세요");
			}
		
		if (binding.hasErrors())
			return "redirect:/country/create?error";
		
		var country = dto.getModel();
		
		try {
			mapper.insertCountry(country);
		} catch (DuplicateKeyException e) {
			binding.reject("duplicate key", "코드네임이 중복됩니다."); //reject는 글로벌에러로 들어감
			return "redirect:/country/create?error";
		}
		
		return "redirect:/country/success?create";
	}

}

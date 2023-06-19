package com.example.imple.language.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.language.mapper.LanguageMapper;
import com.example.imple.language.model.LanguageDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/language")
@Slf4j
public class LanguageCreateController implements CreateController<LanguageDTO> {
	
	@Autowired
	LanguageMapper mapper;

	@Override
	public void create(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (error == null) {
			var session = request.getSession();
			session.removeAttribute("language");
			session.removeAttribute("binding");
		}
	}

	@Override
	@Transactional
	public String create(LanguageDTO dto, BindingResult binding, Model model, HttpServletRequest request, RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("language", dto);
		session.setAttribute("binding", binding);
		
		var countryCode = dto.getCountryCode().trim();
		
		if (countryCode.length() != 3) {
		    binding.rejectValue("countryCode", "9999", "를 3자리로 입력하세요");
		}
		
		if (binding.hasErrors())
			return "redirect:/language/create?error";
		
		var language = dto.getModel();
		try {
			mapper.insertLanguage(language);
		} catch (DuplicateKeyException e) {
			binding.reject("duplicate key", "국가코드와 언어가 중복됩니다."); //reject는 글로벌에러로 들어감
			return "redirect:/language/create?error";
		}
		
		return "redirect:/language/success?create";
	}
	
}

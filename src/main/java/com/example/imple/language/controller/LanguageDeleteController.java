package com.example.imple.language.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.language.mapper.LanguageMapper;
import com.example.imple.language.model.LanguageDTO;
import com.example.standard.controller.DeleteController;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/language")
@Slf4j
public class LanguageDeleteController implements DeleteController<LanguageDTO> {
	
	@Autowired
	LanguageMapper mapper;

	@Override
	public void delete(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("language");
			session.removeAttribute("binding");
		}
			
		var countryCode = request.getParameter("countryCode");
	    var language = request.getParameter("language");
	    if (Objects.nonNull(countryCode) && Objects.nonNull(language)) {
	        var key1 = String.valueOf(countryCode);
	        var key2 = String.valueOf(language);
	        var selectLanguage = mapper.selectByPrimaryKey(key1, key2);
	        model.addAttribute("language", selectLanguage);
		}
	}

	@Override
	@Transactional
	public String delete(LanguageDTO dto, BindingResult binding, Model model, HttpServletRequest request, RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("language", dto);
		session.setAttribute("binding", binding);
		
		
		if (binding.hasErrors()) {
			return "redirect:/language/delete?error";
		}
		
//		 var countryCode = dto.getCountryCode();
//		 var language = dto.getLanguage();
//		 
//	     mapper.deleteLanguage(countryCode, language);
		 
		 var language = dto.getModel();
		 
		 mapper.deleteLanguage(language);
	        
		return "redirect:/language/success?delete";
	}
	
}

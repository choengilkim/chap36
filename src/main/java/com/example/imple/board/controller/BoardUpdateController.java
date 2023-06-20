package com.example.imple.board.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.board.mapper.BoardMapper;
import com.example.imple.board.model.BoardDTO;
import com.example.standard.controller.UpdateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/board")
public class BoardUpdateController implements UpdateController<BoardDTO> {
	
	@Autowired
	BoardMapper mapper;
	
	@Override
	public void update(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("board");
			session.removeAttribute("binding");
		}
			
		var bno = request.getParameter("bno");
		if (Objects.nonNull(bno)) {
			var key = Integer.parseInt(bno);
			var board = mapper.selectByBno(key);
			model.addAttribute("board", board);
		}
		
	}

	@Override
	public String update(@Valid BoardDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("board", dto);
		session.setAttribute("binding", binding);
		
		if (binding.hasErrors()) {
			
			return "redirect:/board/update?error";
		}
		
		var board = dto.getModel();
		
			mapper.updateBoard(board);
		
		return "redirect:/board/success?update";
	}

}

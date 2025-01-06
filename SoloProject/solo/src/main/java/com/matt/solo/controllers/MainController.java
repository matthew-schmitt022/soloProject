package com.matt.solo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.matt.solo.models.LoginUser;
import com.matt.solo.models.User;
import com.matt.solo.services.UserServ;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

	@Autowired UserServ userServ;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		return "registration.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser")User newUser, 
			BindingResult result, Model model, HttpSession session) {
		
		User user = userServ.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "registration.jsp";
		}else {
			session.setAttribute("userId", user.getId());
			return "redirect:/dashboard";
		}
		
	}

	@GetMapping("/login")
	public String loginPage(Model model) {
	    model.addAttribute("newLogin", new LoginUser());
	    return "logIn.jsp";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin")LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {
		
		User user = userServ.login(newLogin, result);
		
		if(result.hasErrors() || user==null) {
			model.addAttribute("newUser",new User());
			return "logIn.jsp";
		}
			session.setAttribute("userId", user.getId());
			return "redirect:/dashboard";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/login";
	}
}

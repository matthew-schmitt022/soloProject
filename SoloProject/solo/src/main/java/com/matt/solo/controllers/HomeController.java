package com.matt.solo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.matt.solo.models.Course;
import com.matt.solo.models.User;
import com.matt.solo.services.CourseServ;
import com.matt.solo.services.UserServ;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	@Autowired CourseServ courseServ;
	@Autowired UserServ userServ;
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/logout";
		} else {
			model.addAttribute("user", userServ.findById(userId));
			model.addAttribute("courses", courseServ.allCourses());
			return "dashboard.jsp";
		}
	}
	
	@GetMapping("/courses/new")
	public String newCourse(@ModelAttribute("courses") Course course, Model model, HttpSession session) {
		User loggedUser = userServ.findById((Long) session.getAttribute("userId"));
		if (loggedUser == null) {
			return "redirect:/logout";
		} else {
		model.addAttribute("user", loggedUser);
		return "newCourse.jsp";
		}
	}
	
	@PostMapping("/courses/create")
	public String createCourse(@Valid @ModelAttribute("courses") Course course, BindingResult result, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/logout";
		} else {
			if(result.hasErrors()) {
				return "newCourse.jsp";
			}else {
				courseServ.createCourse(course);
				return "redirect:/dashboard";
			}
		}
	}
	
	@GetMapping("/courses/{id}")
	public String showCourse(@PathVariable("id") Long id, HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/logout";
		} else {
			model.addAttribute("user", userServ.findById(userId));
			model.addAttribute("course", courseServ.findsCourseId(id));
			return "showCourse.jsp";
		}
	}
	
	
	@GetMapping("/courses/{id}/edit")
	public String editCourse(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/logout";
		}else {
			model.addAttribute("course", courseServ.findsCourseId(id));
			model.addAttribute("user", userServ.findById(userId));
			return "editCourse.jsp";
		}
	}
	
	
	@PutMapping("/courses/{id}/update")
	public String updateCourse(@Valid @ModelAttribute("course") Course course, BindingResult result,
			HttpSession session,Model model ) {
		Long userId = (Long) session.getAttribute("userId");
//		User loggedUser = userServ.findById(userId);
		if (userId == null) {
			return "redirect:/logout";
		} else if (result.hasErrors()) {
    		return "editCourse.jsp";
    	} else {
    		courseServ.updateCourse(course);
    		return "redirect:/dashboard";
	    }
		
    	
	}
	
	
	
	@GetMapping("/courses/{id}/delete")
	public String destroyCourse(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/logout";
		} else {
			courseServ.deleteCourse(id);
			return "redirect:/dashboard";
		}
	}
}

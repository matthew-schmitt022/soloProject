package com.matt.solo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matt.solo.models.Course;
import com.matt.solo.repositories.CourseRepo;

@Service
public class CourseServ {

	@Autowired CourseRepo courseRepo;
	
	public List<Course> allCourses(){
		return courseRepo.findAll();
	}
	
	public Course createCourse(Course course) {
		return courseRepo.save(course);
	}
	
	public Course updateCourse(Course course) {
		return courseRepo.save(course);
	}
	
	public void deleteCourse(Long id) {
		courseRepo.deleteById(id);
	}
	
	public Course findsCourseId(Long id) {
		Optional<Course> optlist = courseRepo.findById(id);
		if(optlist.isPresent()) {
			return optlist.get();
		}else {
			return null;
		}
	}
}

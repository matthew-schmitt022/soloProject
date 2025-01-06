package com.matt.solo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.matt.solo.models.Course;

@Repository
public interface CourseRepo extends CrudRepository<Course, Long> {

	public List<Course>findAll();
}

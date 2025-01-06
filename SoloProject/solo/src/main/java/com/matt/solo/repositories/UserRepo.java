package com.matt.solo.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.matt.solo.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {

	public List<User>findAll();
	Optional<User>findByEmail(String email);
}

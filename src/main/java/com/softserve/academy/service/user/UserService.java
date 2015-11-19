package com.softserve.academy.service.user;

import java.util.List;

import com.softserve.academy.model.User;

public interface UserService {
	
	void saveUser(User user);
	
	public void deleteUser(Integer id);
	
	public List<User> findAllUsers();
	
	public User findById(int id);
	
	User findByUsername(String username);
	
	List<User> searchUser(String username);
	
	boolean isUserLoginUnique(Integer id, String username);
}

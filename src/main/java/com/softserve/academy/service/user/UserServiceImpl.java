package com.softserve.academy.service.user;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.softserve.academy.dao.user.UserDao;
import com.softserve.academy.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override		
	public void saveUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userDao.saveUser(user);
	}

	@Override
	public void deleteUser(Integer id) {
		userDao.deleteUser(id);		
	}

	@Override
	public List<User> findAllUsers() {
		return userDao.findAllUsers();
	}

	@Override
	public User findById(int id) {		
		return userDao.findById(id);
	}

	@Override
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}
	
	public List<User> searchUser(String username){
		return userDao.searchUser(username);
	}

	@Override
	public boolean isUserLoginUnique(Integer id, String username) {
		 User user = findByUsername(username);
	        return ( user == null || ((id != null) && (user.getId_user() == id)));
	}	
}

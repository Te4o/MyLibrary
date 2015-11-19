/**
 *UserDao.java
 *
 *created at Nov 15, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.dao.user;

import java.util.List;

import com.softserve.academy.model.User;

public interface UserDao {
	User findById(Integer id);	
	
    void saveUser(User user);
 
    void deleteUser(int id);
    
    List<User> findAllUsers();
    
    User findByUsername(String username);
    
    List<User> searchUser(String name);
}

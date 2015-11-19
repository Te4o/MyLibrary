/**
 *AdminController.java
 *
 *created at Nov 15, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.softserve.academy.model.Comment;
import com.softserve.academy.model.User;
import com.softserve.academy.service.author.AuthorService;
import com.softserve.academy.service.book.BookService;
import com.softserve.academy.service.user.UserService;


@Controller
@RequestMapping(value={"/users"})
public class AdminController {	

	@Autowired
	private UserService userService;
	
	@Autowired
    AuthorService authorService;   
	
	@Autowired
	BookService bookService;
     
    @Autowired
    MessageSource messageSource;

	@Secured({"ADMIN"})
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String admin(Model model,User user) {
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "security/users";
	}	

	@RequestMapping(value ="/{id}/comments", method = RequestMethod.GET)
	public String detail(@PathVariable int id, ModelMap model) {
		User user = userService.findById(id);
		List<Comment> comment = user.getComments();		
		if (comment.isEmpty()) {
			model.addAttribute("isEmptyComment", true);
		} 		
		model.addAttribute("user", user);
		model.addAttribute("comments", comment);
		return "security/adminComments";
	}
	
	 @RequestMapping(value = { "/" }, method = RequestMethod.POST)
	    public String searchUser(HttpServletRequest request, ModelMap model) {  
	    	String username =  request.getParameter("search");
	        List<User> users = userService.searchUser(username); 
	        if (users.isEmpty()) {
				model.addAttribute("emptyListOfUsers", true);
			}        
	        model.addAttribute("users", users);
	        return "security/users";
	    }
}	
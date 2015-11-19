/**
 *HomeController.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.controller;


import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.softserve.academy.model.Comment;
import com.softserve.academy.model.User;
import com.softserve.academy.service.user.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {

	@Autowired
	UserService userService;

	
	@Autowired
	MessageSource messageSource;

	@RequestMapping(value = { "/" })
	public String homePage(@AuthenticationPrincipal UserDetails userDetails,ModelMap model) {		
		if (userDetails == null ){
			model.addAttribute("logged", false);
		} else {
			model.addAttribute("user", userDetails.getUsername());
			model.addAttribute("logged", true);
		}
		return "home";
	}
	
	@RequestMapping(value = "/{id}/userComments", method = RequestMethod.POST)
	public String userPage(@PathVariable int id, ModelMap model) {	
		
		User user = userService.findById(id);
		List<Comment> comment = user.getComments();		
		if (comment.isEmpty()) {
			model.addAttribute("isEmptyComment", true);
		} 		
		model.addAttribute("user", user);
		model.addAttribute("comments", comment);
		return "security/userComments";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {		
		return "security/login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(ModelMap model) {
		User newUser = new User();
		model.addAttribute("user", newUser);
		return "security/user-register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("user") @Valid User user, BindingResult result, Errors errors) {
				
		if(!userService.isUserLoginUnique(user.getId_user(), user.getUsername())){		
			FieldError loginError =new FieldError("user","username",messageSource.getMessage("no.login.unique", 
					new String[]{user.getUsername()}, Locale.US));
			result.addError(loginError);
			return "security/user-register";
		}		
		userService.saveUser(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}
}
/**
 *CommentController.java
 *
 *created at Nov 15, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.softserve.academy.model.Book;
import com.softserve.academy.model.Comment;
import com.softserve.academy.model.User;
import com.softserve.academy.service.author.AuthorService;
import com.softserve.academy.service.book.BookService;
import com.softserve.academy.service.comment.CommentService;
import com.softserve.academy.service.user.UserService;

@Controller
@RequestMapping(value = { "/authors/{id}/books/{id_book}"})
public class CommentController {

	@Autowired
	AuthorService authorService;
	
	@Autowired
	BookService booksService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	UserService userService;


	/*
	 * Show all comments by book
	 */
	@RequestMapping(value = { "/comments" }, method = RequestMethod.GET)
	public String listAllComments(@PathVariable Long id, @PathVariable Long id_book, ModelMap model) {

		Book book = booksService.findById(id_book);
		List<Comment> comment = book.getComments();		
		if (comment.isEmpty()) {
			model.addAttribute("isEmptyComment", true);
		} 		
		model.addAttribute("comments", comment);
		model.addAttribute("book", book);
		return "comments/allComments";
	}
	
	/*
	 *  Add new comment
	 */
	@RequestMapping(value = { "/comments/new" }, method = RequestMethod.GET)
	public String addNewComment(ModelMap model) {
		Comment comment = new Comment();
		model.addAttribute("comments", comment);
		model.addAttribute("edit", false);
		return "comments/addComment";
	}

	/*
	 *  Save comment
	 */
	@RequestMapping(value = { "/comments/new" }, method = RequestMethod.POST)
	public String saveComment(@Valid Comment comment, BindingResult result, ModelMap model, @PathVariable Long id_book) {

		if (result.hasErrors()) {
			return "comments/addComment";
		}

		Book book = booksService.findById(id_book);		
		User user = userService.findByUsername(
				SecurityContextHolder.getContext().getAuthentication().getName());
		
		user.getComments().add(comment);
		book.getComments().add(comment);
		comment.setBook(book);
		comment.setUser(user);
		commentService.saveComment(comment);
		return "redirect:/authors/{id}/books/{id_book}/comments";
	}
	
	/*
	 *  Edit comment
	 */
	@RequestMapping(value = { "/comments/{comment_id}" }, method = RequestMethod.GET)
	public String editComment(@PathVariable Integer comment_id, ModelMap model) {
		Comment comment = commentService.findById(comment_id);
		model.addAttribute("comments", comment);
		model.addAttribute("edit", true);
		return "comments/addComment";
	}

	/*
	 *  Update comment
	 */
	@RequestMapping(value = { "/comments/{comment_id}" }, method = RequestMethod.PUT)
	public String updateComment(@Valid Comment formComment, BindingResult result, ModelMap model,
			@PathVariable Long id_book, @PathVariable Integer comment_id) {
		if (result.hasErrors()) {
			return "comments/addComment";
		}
		Book book = booksService.findById(id_book);
		Comment dbComment = commentService.findById(comment_id);
		dbComment = formComment;
		commentService.updateComment(dbComment);
		book.getComments().add(dbComment);
		return "redirect:/authors/{id}/books/{id_book}/comments";
	}

	/*
	 *  Delete comment
	 */
	@RequestMapping(value = { "/comments/{comment_id}" }, method = RequestMethod.DELETE)
	public String deleteComment(@PathVariable Long id_book, @PathVariable Integer comment_id) {
		Comment comment = commentService.findById(comment_id);
		Book book = booksService.findById(id_book);

		book.getComments().remove(comment);
		commentService.deleteCommentById(comment_id);
		return "redirect:/authors/{id}/books/{id_book}/comments";
	}
	
}
	
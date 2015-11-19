/**
 *AuthorController.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.softserve.academy.model.Author;
import com.softserve.academy.service.author.AuthorService;
import com.softserve.academy.service.user.UserService;

@Controller
@RequestMapping(value = { "/authors"})
public class AuthorController {

    @Autowired
    AuthorService authorService;
    
    @Autowired
    UserService userService;
     
    @Autowired
    MessageSource messageSource;
 
    /*
     * This method will list all existing authors.
     */
   
    
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String listAuthors(ModelMap model) { 
        List<Author> authors = authorService.findAllAuthors();        
        if (authors.isEmpty()) {
			model.addAttribute("emptyListOfAuthors", true);
		}        
        model.addAttribute("authors", authors);
        return "authors/allAuthors";
    }
    
    @RequestMapping(value = { "/" }, method = RequestMethod.POST)
    public String searchAuthor(HttpServletRequest request, ModelMap model) {  
    	String name =  request.getParameter("search");
        List<Author> authors = authorService.searchAuthor(name);  
        
        if (authors.isEmpty()) {
			model.addAttribute("emptyListOfAuthors", true);
		}        
        model.addAttribute("authors", authors);
        return "authors/searchAuthors";
    }

    /*
     * This method will provide the medium to add a new author.
     */
    @RequestMapping(value = { "/new" }, method = RequestMethod.GET)
    public String newAuthor(ModelMap model) {
    	Author author = new Author();
        model.addAttribute("author", author);
        model.addAttribute("edit", false);
        return "authors/addAuthor";
    }
 
    /*
     * This method will be called on form submission, handling POST request for
     * saving author in database.
     */
    @RequestMapping(value = { "/new" }, method = RequestMethod.POST)
    public String saveAuthor(@Valid Author author, BindingResult result,
            ModelMap model) { 
        if (result.hasErrors()) {
            return "authors/addAuthor";
        }        
        authorService.saveAuthor(author);
        return "redirect:/authors/";
    }
 
 
    /*
     * This method will provide the medium to update an existing author.
     */
    @RequestMapping(value = { "/{id}" }, method = RequestMethod.GET)
    public String editAuthor(@PathVariable Long id, ModelMap model) {
        Author author = authorService.findById(id);
        model.addAttribute("author", author);
        model.addAttribute("edit", true);
        return "authors/addAuthor";
    }
     
    /*
     * This method will be called on form submission, handling POST request for
     * updating author in database. It also validates the user input.
     */
    @RequestMapping(value = { "/{id}" }, method = RequestMethod.PUT)
    public String updateAuthor(@Valid Author author, BindingResult result,
            ModelMap model, @PathVariable Long id) { 
        if (result.hasErrors()) {          	
            return "redirect:/authors/{id}";            
        }       
        authorService.updateAuthor(author);   	       
        return "redirect:/authors/";
    } 
     
    /*
     * This method will delete an author by it's Id value.
     */
    @RequestMapping(value = { "/{id}" }, method = RequestMethod.DELETE)
    public String deleteAuthor(@PathVariable Long id) {
    	authorService.deleteAuthor(authorService.findById(id));;
        return "redirect:/authors/";
    } 
}

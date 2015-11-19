/**
 *AuthorService.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.service.author;

import java.util.List;

import com.softserve.academy.model.Author;

public interface AuthorService {

	Author findById(long id);
	
	void saveAuthor(Author author);
	
	void updateAuthor(Author author);
	
	void deleteAuthor(Author author);
	
	List<Author> findAllAuthors();
	
	List<Author> searchAuthor(String name);
}

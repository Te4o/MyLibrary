/**
 *AuthorDao.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.dao.author;

import java.util.List;

import com.softserve.academy.model.Author;

public interface AuthorDao {

	Author findById(Long id);

	void saveAuthor(Author author);

	void deleteAuthorById(Long id);

	List<Author> findAllAuthors();
	
	List<Author> searchAuthor(String name);
}

/**
 *AuthorServiceImpl.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.service.author;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.softserve.academy.dao.author.AuthorDao;
import com.softserve.academy.model.Author;

@Service("authorService")
@Transactional
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorDao dao;
	
	@Override
	public Author findById(long id) {
		return dao.findById(id);
	}

	@Override
	public void saveAuthor(Author author) {
		dao.saveAuthor(author);
	}

	@Override
	public void updateAuthor(Author author) {
		Author entity = dao.findById(author.getId());
		if (entity!=null) {
			entity.setName(author.getName());
			entity.setCountry(author.getCountry());
		}
	}

	@Override
	public void deleteAuthor(Author author) {
		dao.deleteAuthorById(author.getId());		
	}

	@Override
	public List<Author> findAllAuthors() {
		return dao.findAllAuthors();
	}

	@Override
	public List<Author> searchAuthor(String name) {		
		return dao.searchAuthor(name);
	}


}

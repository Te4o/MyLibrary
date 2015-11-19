/**
 *BookDao.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.dao.book;

import java.awt.print.Pageable;
import java.util.List;

import com.softserve.academy.model.Book;

public interface BookDao {

	Book findById(Long id);

	void saveBook(Book book);

	void deleteBookById(Long id);

	List<Book> findAllBooks();
	
	List<Book> getAllBooks(Book book, Pageable pageable);
	
}

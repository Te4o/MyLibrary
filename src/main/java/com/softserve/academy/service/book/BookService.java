/**
 *BookService.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.service.book;

import java.awt.print.Pageable;
import java.util.List;

import com.softserve.academy.model.Book;

public interface BookService {

	Book findById(long id);
	
	void saveBook(Book book);
	
	void updateBook(Book book);
		
	void deleteBook(Book book);
	
	List<Book> findAllBooks();
	
	List<Book> getAllBooks(Book book, Pageable pageable);
}

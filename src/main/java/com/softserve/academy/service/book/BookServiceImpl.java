/**
 *BookServiceImpl.java
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.softserve.academy.dao.book.BookDao;
import com.softserve.academy.model.Book;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao dao;

	@Override
	public Book findById(long id) {
		return dao.findById(id);
	}

	@Override
	public void saveBook(Book book) {
		dao.saveBook(book);		
	}

	@Override
	public void updateBook(Book book) {
		Book entity = dao.findById(book.getId());
        if(entity!=null){
            entity.setTitle(book.getTitle());
            entity.setStatus(book.getStatus());
        }
	}

	@Override
	public void deleteBook(Book book) {
		dao.deleteBookById(book.getId());
	}

	@Override
	public List<Book> findAllBooks() {
		return dao.findAllBooks();
			
		
	}

	@Override
	public List<Book> getAllBooks(Book book, Pageable pageable) {		
		return dao.findAllBooks();
	}
}

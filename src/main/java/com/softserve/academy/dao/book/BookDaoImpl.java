/**
 *BookDaoImpl.java
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

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.softserve.academy.dao.AbstractDao;
import com.softserve.academy.model.Book;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao<Long, Book> implements BookDao {

	@Override
	public Book findById(Long id) {
		Book book = getByKey(id);
		if(book!=null){
			Hibernate.initialize(book.getAuthor());
		}
		return book;
	}

	@Override
	public void saveBook(Book book) {
		persist(book);		
	}

	@Override
	public void deleteBookById(Long id) {
		Query query = getSession().createSQLQuery("delete from books where id_book = :id");
        query.setLong("id", id);
        query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Book> findAllBooks() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("title"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
	    List<Book> books = (List<Book>) criteria.list();
	        
//	    for(Book user : books){
//	         Hibernate.initialize(user.getAuthor());
//	    }
	    return books;
	}

	@Override
	public List<Book> getAllBooks(Book book, Pageable pageable) {
		List<Book> list = findAllBooks();
		return list;
	}	
}

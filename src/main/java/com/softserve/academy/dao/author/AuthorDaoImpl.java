/**
 *AuthorDaoImpl.java
 *
 *created at Oct 27, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.dao.author;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.softserve.academy.dao.AbstractDao;
import com.softserve.academy.model.Author;

@Repository("authorDao")
public class AuthorDaoImpl extends AbstractDao<Long, Author> implements AuthorDao{

	@Override
	public Author findById(Long id) {
		Author author = getByKey(id);
        if(author!=null){
            Hibernate.initialize(author.getBooks());
        }
        return author;
	}

	@Override
	public void saveAuthor(Author author) {
		persist(author);
	}

	@Override
	public void deleteAuthorById(Long id) {
		Query query = getSession().createSQLQuery("delete from authors where id = :id");
        query.setLong("id", id);
        query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Author> findAllAuthors() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Author> authors = (List<Author>) criteria.list();

        return authors;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Author> searchAuthor(String name) {
		Criteria crit = getSession().createCriteria(Author.class);
		crit.add(Restrictions.like("name",name+"%",MatchMode.ANYWHERE));
		List<Author> results = crit.list();
		return results;
	}
}

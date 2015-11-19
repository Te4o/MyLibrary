/**
 *UserDaoImpl.java
 *
 *created at Nov 15, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.dao.user;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.softserve.academy.dao.AbstractDao;
import com.softserve.academy.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	@Override
	public void saveUser(User user) {
		persist(user);
	}

	@Override
	public void deleteUser(int id) {
		Query query = getSession().createSQLQuery("delete from users where id_user = :id");
        query.setInteger("id", id);
        query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria();//.addOrder(Order.asc("username")); // Order
		List<User> users = (List<User>) criteria.list();
		
		return users;
	}

	@Override
	public User findById(Integer id) {
		User user = getByKey(id);
		if(user!=null){
			Hibernate.initialize(user.getId_user());
		}
		return user;
	}

	public User findByUsername(String username) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("username", username));

		return (User) crit.uniqueResult();
	} 
	
	@Override
	public List<User> searchUser(String username) {
		Criteria crit = getSession().createCriteria(User.class);
		crit.add(Restrictions.like("username",username+"%",MatchMode.ANYWHERE));
		@SuppressWarnings("unchecked")
		List<User> results = crit.list();
		return results;
	}
}

/**
 *CommentDao.java
 *
 *created at Nov 15, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.dao.comment;

import java.util.List;

import com.softserve.academy.model.Comment;


public interface CommentDao {
	
	Comment findById(Integer comment_id);
	
	void saveComment(Comment comment);
	
	void deleteCommentById(Integer comment_id);
	
	List<Comment> findAllComments();

}

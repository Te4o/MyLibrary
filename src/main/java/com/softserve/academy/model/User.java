/**
 *User.java
 *
 *created at Nov 15, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_user;

	@Size(min = 3, max = 50, message = "Name must be at least 3 characters!")
	@NotNull
	@Column(name = "username", unique = true)	
	private String username;
	
	@Size(min = 1, max = 20, message = "Invalid email address!")
	@Email(message = "Invalid email address!")
	@NotNull
	@Column(name = "email")
	private String email;

	@NotNull
	@Column(name = "password")
	private String password;
	
	@Size(min = 3, max = 50, message = "Name must be at least 3 characters!")
    @NotNull
	@Column(name = "role")
    private String role = RoleType.USER.getRoleType();	
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<Author> authors;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<Comment> comments;	
	
		
	/**
	 * @return the id_user
	 */
	public Integer getId_user() {
		return id_user;
	}
	
	
	/**
	 * @param id_user
	 *            the id_user to set
	 */
	public void setId_user(Integer id_user) {
		this.id_user = id_user;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}




	/**
	 * @return the authors
	 */
	public List<Author> getAuthors() {
		return authors;
	}


	/**
	 * @param authors the authors to set
	 */
	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}


	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}



	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}



	/**
	 * @return the comments
	 */
	public List<Comment> getComments() {
		return comments;
	}



	/**
	 * @param comments the comments to set
	 */
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}



	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}



	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

}

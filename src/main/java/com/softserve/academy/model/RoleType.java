/**
 *RoleType.java
 *
 *created at Nov 15, 2015 
 * 
 *@author Vasil Sokolov <vasilsokolov@abv.bg>
 *
 * Copyright (c) 2015 . All Rights Reserved.
 */
package com.softserve.academy.model;

public enum RoleType {
	ADMIN("ADMIN"),
	USER("USER");

	String roleType;

	private RoleType(String roleType) {
		this.roleType = roleType;
	}

	/**
	 * @return the roleType
	 */
	public String getRoleType() {
		return roleType;
	}
}

package com.cn.local.funny.model;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = -2396089073399244168L;

	private Integer id;
	private String username;
	private String password;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}

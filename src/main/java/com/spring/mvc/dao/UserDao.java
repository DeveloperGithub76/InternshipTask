package com.spring.mvc.dao;

import com.spring.mvc.entity.User;

public interface UserDao {

	
	public int saveUser(User user);
	
	public User loginUser(String email,String password);
}

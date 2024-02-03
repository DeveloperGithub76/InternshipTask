package com.spring.mvc.dao;

import java.util.List;

import com.spring.mvc.entity.Cust;

public interface CustDao {

	
	public int saveCust(Cust cust);
	
	public Cust getCustById(int id);
	
	public List<Cust> getAllCust();
	
	public void update(Cust cust);
	
	public void delete(int id);
}

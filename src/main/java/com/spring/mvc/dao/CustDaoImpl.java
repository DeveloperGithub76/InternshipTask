package com.spring.mvc.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.spring.mvc.entity.Cust;

@Repository
public class CustDaoImpl implements CustDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int saveCust(Cust cust) {
	int i=	(int) hibernateTemplate.save(cust);
		return i;
	}

	@Override
	public Cust getCustById(int id) {
	Cust cust=hibernateTemplate.get(Cust.class, id);
		return cust;
	}

	@Override
	public List<Cust> getAllCust() {
	List<Cust> list=hibernateTemplate.loadAll(Cust.class);
		return list;
	}

	@Transactional
	public void update(Cust cust) {
		hibernateTemplate.update(cust);
		
	}

	@Transactional
	public void delete(int id) {
		Cust cust=hibernateTemplate.get(Cust.class, id);
		hibernateTemplate.delete(cust);
		
	}

	
	
}

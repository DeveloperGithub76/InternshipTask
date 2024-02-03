package com.spring.mvc.dao;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.spring.mvc.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public int saveUser(User user) {
		int i=  (int) hibernateTemplate.save(user);
		return i;
	}

	@Override
	public User loginUser(String email, String password) {
		// select * from user where email=? and password=?;  ->user object
		String sql="from User where email=:em and password=:pswd";
		
		User us=(User) hibernateTemplate.execute(s ->{
			
			Query q=s.createQuery(sql);
			q.setString("em",email);
			q.setString("pswd",password);
			return q.uniqueResult();
		});
		
		return us;
	}

}

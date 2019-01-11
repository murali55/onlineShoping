package com.first.daoImpl;
import org.hibernate.Session; 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.first.dao.CustomerDao;
import com.first.entites.Authorities;
import com.first.entites.Customer;
import com.first.entites.User;
@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
private SessionFactory sessionFactory;
	public void registerCustomer(Customer customer) {
		Session session=sessionFactory.getCurrentSession();
		//Authorities and User object
		//authorities.user to refer user object
		Authorities authorities=customer.getUser().getAuthorities();
		User user=customer.getUser();
		authorities.setUser(user);
		session.save(customer);

	}
	public boolean isEmailUnique(String email) 
	{
		//this email is entered by the new user in the registration form
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, email);//select * from user where email=?
		if(user==null)//no records, email is unique
			return true;
		else  //1 record, email already exists..
			return false;	
	}
	
	


}
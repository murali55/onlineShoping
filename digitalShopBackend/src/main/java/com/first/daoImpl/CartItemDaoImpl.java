package com.first.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.first.dao.CartItemDao;
import com.first.entites.CartItem;
import com.first.entites.CustomerOrder;
import com.first.entites.Product;
import com.first.entites.User;
@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao 
{
	@Autowired
private SessionFactory sessionFactory;
	public void addToCart(CartItem cartItem) 
	{
		Session session=sessionFactory.getCurrentSession();
		session.save(cartItem);//insert into cartItem...
	}
	public User getUser(String email) 
	{
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, email);
		return user;
	}
	public List<CartItem> getCartItems(String email) 
	{
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from CartItem where user.email=:email");
		query.setString("email", email);
		List<CartItem> cartItems=query.list();
		return cartItems;
		
	}
	public void updateCartItem(int cartItemId, int requestedQuantity) 
	{
		//update requestedQuantity and also totalPrice
		  Session session=sessionFactory.getCurrentSession();
		  CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId);
		  cartItem.setQuantity(requestedQuantity);//updated quantity
		  cartItem.setTotalPrice(requestedQuantity * cartItem.getProduct().getPrice());
		  session.update(cartItem);
	}
	public void removeCartItem(int cartItemId) 
	{
		Session session=sessionFactory.getCurrentSession();
		CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId);
		session.delete(cartItem);
		
	}
	public CustomerOrder createCustomerOrder(CustomerOrder customerOrder) 
	{
		Session session=sessionFactory.getCurrentSession();
		session.save(customerOrder);
		return customerOrder;
	}

}


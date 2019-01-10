package com.first.daoImpl;

import java.util.List;  
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.first.dao.ProductDao;
import com.first.entites.Product;
import com.first.entites.Category;
@Repository  
@Transactional 
public class ProductDaoImpl implements ProductDao 
{
	@Autowired
	private SessionFactory sessionFactory;

    public ProductDaoImpl() 
    {
	System.out.println("SectionFacorty bean is created");
	}

	
	public Product getProduct(int id)
	{
		Session session=sessionFactory.getCurrentSession();
		Product product=(Product)session.get(Product.class, id);//SQL query select * from product where id=?
		return product;       
		
	}

	public void deleteProduct(int id) 
	{
		Session session=sessionFactory.getCurrentSession();
		Product product= new Product();
		product.setId(id);
		session.delete(product);
	}

	public void updateProduct(Product product)
	{
		Session session=sessionFactory.getCurrentSession();
		session.update(product);
	}

	public List<Product> getAllProducts() {
		Session session=sessionFactory.getCurrentSession();
		Query query= session.createQuery("from Product");
		List<Product> products= query.list();
		return products;
	}

	public void saveOrUpdate(Product product)
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);	
	}
	public List<Category> getAllCategories() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Category");
		List<Category> categories=query.list();
		return categories;
	}


	public List<Product> getCategoryProducts(String category) 
	{
       Session session= sessionFactory.getCurrentSession();
       String s1 ="'"+category+"'";
       Query query= session.createQuery("from Product where category.CategoryName="+s1);	
       List<Product> products= query.list();
		return products ;
	}
}

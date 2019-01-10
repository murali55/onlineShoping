package com.first.dao;

import java.util.List; 

import com.first.entites.Product;
import com.first.entites.Category;

public interface ProductDao
{
	Product getProduct(int id);
	void deleteProduct(int id);
	List<Product> getAllProducts();
	void saveOrUpdate(Product product);
	List<Category> getAllCategories();
	List<Product> getCategoryProducts(String category);
}

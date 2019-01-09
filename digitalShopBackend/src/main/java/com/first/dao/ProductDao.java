package com.first.dao;

import java.util.List;

import com.first.entites.Product;

public interface ProductDao
{
	void addProduct(Product product);
	Product getProduct(int id);
	List<Product> getAllProducts();
	void deleteProduct(int id);
}

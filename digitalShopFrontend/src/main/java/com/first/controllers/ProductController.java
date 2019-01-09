package com.first.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.first.dao.ProductDao;
import com.first.entites.Product;
@Controller
public class ProductController 
{
@Autowired
private ProductDao productDao;//automatically wire a bean of type ProductDao (ProductDaoImpl)
	public ProductController(){
		System.out.println("ProductController bean is created");
	}
	@RequestMapping(value="/all/getallproducts")
	public String getAllProducts(Model model){ // handler method returns (model and view)
		//Data the method has to return  is List<Product>
		//How to get List<Product>? (all records from product table)
		
		List<Product> products=productDao.getAllProducts();
		model.addAttribute("products",products);
		return "productslist";
	}
	@RequestMapping(value="/all/getproduct")
	public String getProduct(@RequestParam int id,Model model){//get the id of the product from the view (productslist.jsp)
		Product product=productDao.getProduct(id);
		//model is product object for the given id
		//view is viewproduct
		model.addAttribute("productAttr",product);
		return "viewproduct";
	}
	@RequestMapping(value="/admin/deleteproduct/{id}")
	public String deleteProduct(@PathVariable int id){
		productDao.deleteProduct(id);
		return "redirect:/all/getallproducts"; //redirect the request to the handler method getAllProducts()
	}
	
}






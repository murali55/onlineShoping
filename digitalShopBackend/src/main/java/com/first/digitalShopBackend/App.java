package com.first.digitalShopBackend;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.first.confuguration.DBConfiguration;
import com.first.dao.ProductDao;
import com.first.dao.ProductDaoImpl;
import com.first.entites.Product;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
       {
        System.out.println( "Hello World!" );
        //CREATE SPRING CONTAINER , CONFIGURATION DETAILS TO THE CONTAINER
        ApplicationContext context=new AnnotationConfigApplicationContext(DBConfiguration.class,ProductDaoImpl.class);
        ProductDao productDao=(ProductDao)context.getBean("productDaoImpl");
        
//      Product product1=new Product();
//      product1.setId(2);
//      product1.setProductname("table");
//      product1.setDescription("red");
//      product1.setPrice(400);
//      product1.setQuantity(5);
//      productDao.addProduct(product1);
//      
//    Product product=productDao.getProduct(1);
//    System.out.println(product);
//    if(product!=null)
//    {
//    System.out.println(product.getId());
//    System.out.println(product.getProductname());
//    System.out.println(product.getDescription());
//    System.out.println(product.getPrice());
//    System.out.println(product.getQuantity());
//    }
//    else
//    {
//  	  System.out.println("Product id 7 not found");
//    }
//   productDao.deleteProduct(2);  
//    product.setDescription("qulty is first priorty");
//    productDao.updateProduct(product);
//   List<Product> products = productDao.getAllProducts();
//   System.out.println(products);
//   System.out.println(products.size());
    
       }
}

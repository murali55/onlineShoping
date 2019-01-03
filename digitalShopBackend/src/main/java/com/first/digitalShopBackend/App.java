package com.first.digitalShopBackend;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.first.confuguration.DBConfiguration;

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
        ApplicationContext context=new AnnotationConfigApplicationContext(DBConfiguration.class);
        
    }
}

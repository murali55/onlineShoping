package com.first.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HomeController 
{
	
		public HomeController()
		{
			System.out.println("homeController bean is created..");
		}
	    @RequestMapping("/home")
		public String homePage()
	    {
			return "homePage";
		}
	    @RequestMapping("/aboutus")
	    public String aboutUs()
	    {
	    	return "aboutUsPage";
	    }
	
}

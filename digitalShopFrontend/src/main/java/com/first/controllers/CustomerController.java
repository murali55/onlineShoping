package com.first.controllers;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.first.dao.CustomerDao;
import com.first.entites.Customer;

@Controller
public class CustomerController {
	@Autowired
private CustomerDao customerDao;
@RequestMapping(value="/all/getregistrationform")	
public String getRegistrationForm(Model model){
	Customer customer=new Customer();
	model.addAttribute("customer",customer);//This model attribute customer will be used in registrationform.jsp
	return "registrationForm";
	
	
}
@RequestMapping(value="/all/register")
public String registerCustomer(@ModelAttribute Customer customer, Model model){
	System.out.println(customer.getFirstname());
	System.out.println(customer.getLastname());
	System.out.println(customer.getPhonenumber());
	System.out.println(customer.getUser().getEmail());
	System.out.println(customer.getUser().getAuthorities().getRole());
	boolean isUnique=customerDao.isEmailUnique(customer.getUser().getEmail());
	if(isUnique==false)
	{
		model.addAttribute("errorMessage","Email already exists.. Please choose different email id");
		return "registrationform";
	}
	customerDao.registerCustomer(customer);
	return "login";
}





}


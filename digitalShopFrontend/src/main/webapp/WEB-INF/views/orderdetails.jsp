<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-wrapper">
    <div class="container">
    
       
        <div class="container">
        

            <div class="row">

                             <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

                       <div >
                            <h1 align="center">Invoice</h1>
                       </div>
                        ORDER ID: ${customerOrder.orderId }
                  
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong><button disabled>Shipping Address</button></strong><br/>
                                   ${customerOrder.user.customer.shippingAddress.apartmentnumber}, ${customerOrder.user.customer.shippingAddress.streetname }
                       
                                <br/>
                                  ${customerOrder.user.customer.shippingAddress.city}  <br>
                                  ${customerOrder.user.customer.shippingAddress.state}<br>
                                  ${customerOrder.user.customer.shippingAddress.country}<br>
                                  ${customerOrder.user.customer.shippingAddress.zipcode}
                                <br/>
                                  
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>Shipping Date: </p>${customerOrder.purchaseDate }
                            </div>
                        </div>
                       <hr>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong><button disabled>Billing Address</button></strong><br/>
                                 ${customerOrder.user.customer.firstname } &nbsp;  ${customerOrder.user.customer.lastname }<br>  
                                 ${customerOrder.user.customer.billingAddress.apartmentnumber}, ${customerOrder.user.customer.billingAddress.streetname }
                       
                                <br/>
                                  ${customerOrder.user.customer.billingAddress.city}  <br>
                                  ${customerOrder.user.customer.billingAddress.state}<br>
                                  ${customerOrder.user.customer.billingAddress.country}<br>
                                  ${customerOrder.user.customer.billingAddress.zipcode}
                                <br/>
                                  
                                        
                                </address>
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-hover" border="1">
                                <thead>
                                    <tr>
                                        <td>Image</td>
                                        <td>Product</td>
                                        <td>Units</td>
                                        <td class="text-center">Price</td>
                                        <td class="text-center">Total</td>
                                    </tr>
                                </thead>
                                <tbody>
                              
                                <c:forEach var="cartItem" items="${cartItems}">
                                    <tr>
                            <c:url value="/resources/images/${cartItem.product.id }.png" var="imgUrl"></c:url>
                                        <td><img src="${imgUrl }" height="50px" width="50px">  </td>
                                        <td class="col-md-9"><em>${cartItem.product.productname }</em></td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.quantity }</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.product.price }</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.totalPrice }</td>
                                       
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-right">
                                        <h4><strong>Grand Total:</strong></h4>
                                    </td>
                                    <td class="text-center text-danger">
                                        <h4><strong>Rs.${customerOrder.grandTotal } </strong></h4>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
        </div>
        </div>
        </div>
</body>
</html>
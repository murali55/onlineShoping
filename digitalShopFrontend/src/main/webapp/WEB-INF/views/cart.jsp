<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		<b>Cart Page</b><br>
		<c:set var="grandTotal" value="0"></c:set>
		<a class="btn btn-danger" href="<c:url value='/cart/clearcart'></c:url>">Clear Cart</a><br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th>Image</th>
					<th>Productname</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>TotalPrice</th>
					<th>Remove</th>
				</tr>
			</thead>
			<c:forEach var="cartItem" items="${cartItems }">
			<form action="<c:url value='/cart/updatecartitem'></c:url>">
             <tr>
             <td><input type="hidden" name="cartItemId" value="${cartItem.cartItemId }"></td>
             <td><img src="<c:url value='/resources/images/${cartItem.product.id }.png'></c:url>" height="40px" width="40px" alt="No Image"></td>
             <td>${cartItem.product.productname }</td>
             <td><input type="number" name="requestedQuantity" value='${cartItem.quantity }' onchange="this.form.submit()" min="1"></td>
             <td>${cartItem.product.price }</td>
             <td>${cartItem.totalPrice }</td>
             <td><a href="<c:url value='/cart/removecartitem/${cartItem.cartItemId }'></c:url>" class="btn btn-danger">Remove</a></td>
             <c:set var="grandTotal" value="${cartItem.totalPrice +grandTotal }"></c:set>
             </tr>
             </form>
			</c:forEach>

		</table>
		<c:if test="${empty(cartItems) }"><h3>Cart is Empty</h3></c:if>
		<h4>Grand Total : ${grandTotal }</h4> 
		<c:if test="${!empty(cartItems) }">
		<a class="btn btn-success" href="<c:url value='/cart/getshippingaddressform'></c:url>">Place Order</a>
		</c:if>
	</div>
</body>
</html>
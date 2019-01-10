<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<c:url value="/admin/addproduct" var="url"></c:url>
<%--what is the model attribute to which we have assigned a new product obj 
in handler method, we created a new product object and assigned the object to
the model attribute product

Product p=new Product();
model.addAttribute("product",p)
--%>
<form:form action="${url }" modelAttribute="product" enctype="multipart/form-data">
<pre>
<%--product.productname=".." --%>
Enter Productname : <form:input path="productname"/> <form:errors path="productname" cssStyle="color:red"></form:errors>
<%--product.description="..." --%>
Enter description : <form:input path="description"/> <form:errors path="description" cssStyle="color:red"></form:errors><%--product.getDescription() --%>

Enter price       : <form:input path="price"/> <form:errors path="price" cssStyle="color:red"></form:errors>
     
Enter quantity    : <form:input path="quantity"/> <form:errors path="quantity" cssStyle="color:red"></form:errors>
 
Select Category   : <form:select path="category.categoryid">	
<c:forEach items="${categories }" var="c"><%--model.addAttribute("categories",categories), items refers the model attribute categories --%>
<form:option value="${c.categoryid }">${c.categoryname}</form:option>
</c:forEach>
</form:select>
Upload image      : <form:input path="image" type="file"/>

<input type="submit" value="Add Product">

</pre>

</form:form>
</div>
</body>
</html>
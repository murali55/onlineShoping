<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<c:url value="/admin/updateproduct" var="url"></c:url>
<form:form action="${url }" modelAttribute="product">
<pre>
<form:hidden path="id"/>
Enter Productname : <form:input path="productname"/> <form:errors path="productname" cssStyle="color:red"></form:errors>
Enter description : <form:input path="description"/> <form:errors path="description" cssStyle="color:red"></form:errors><%--product.getDescription() --%>
Enter price       : <form:input path="price"/> <form:errors path="price" cssStyle="color:red"></form:errors>
Enter quantity    : <form:input path="quantity"/> <form:errors path="quantity" cssStyle="color:red"></form:errors>

Select Category   : <form:select path="category.categoryid">	
<c:forEach items="${categories }" var="c"><%--model.addAttribute("categories",categories), items refers the model attribute categories --%>
<form:option value="${c.categoryid }">${c.categoryname}</form:option>
</c:forEach>
</form:select>  
Upload Image      : <form:input path="image" type="file"/>
<input type="submit" value="Update Product">
<%--once you enter the data in the input fields, it will call the setter methods
and set the values for all the properties --%>
</pre>

</form:form>
</div>

</body>
</html>
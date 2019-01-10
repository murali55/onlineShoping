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
<b>LOGIN PAGE</b><br>
<span style="color:red">${loginError }</span>
<span>${logoutSuccess }</span>
<form action="<c:url value='/j_spring_security_check'></c:url>" method="post">
<pre> 
Enter email    : <input type="email" name="j_username">
Enter password : <input type="password" name="j_password">
<input type="submit" value="Login">
</pre>
</form>
</div>

</body>
</html>


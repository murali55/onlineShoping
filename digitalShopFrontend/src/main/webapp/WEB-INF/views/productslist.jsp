<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	var searchCondition='${searchCondition}'
	$('.table').DataTable({
		"lengthMenu":[[2,5,-1],[2,5,"All"]],
	    "oSearch" : {
		"sSearch" : searchCondition 
		}
	})
})
</script>
</head>
<body>
	<%--  forEach is for iterating collection of objects
similar to forEach loop in java

for(Product p:products){

}
p=product object from the list
--%>
<div class="container">
	<table class="table table-bordered">
		<thead>
			<tr>
			    <th>Product Id</th>
			    <th>Image</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${products }" var="p">
        <tr>
        <td>${p.id }</td>
        <td><img src="<c:url value='/resources/images/${p.id}.png'></c:url>" height="80px" width="80px"></td>
        <td>${p.productname }</td>
        <td>${p.price }</td>
        <td>
        <a href="<c:url value='/all/getproduct?id=${p.id }'></c:url>"><span class="glyphicon glyphicon-info-sign"></span></a>
        <security:authorize access="hasRole('ROLE_ADMIN')">
        <a href="<c:url value='/admin/deleteproduct/${p.id }'></c:url>"><span class="glyphicon glyphicon-trash"></span></a>
        <a href="<c:url value='/admin/getupdateform?id=${p.id }'></c:url>"><span class="glyphicon glyphicon-pencil"></span></a>
        </security:authorize>
        </td>
        
        </tr>
        
		</c:forEach>
		</tbody>
	</table>
	
	</div>
</body>
</html>


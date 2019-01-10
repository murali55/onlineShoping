<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
		<link href="<c:url value='/resources/css/formerror.css'></c:url>" rel="stylesheet">
<script type="text/javascript">
function fillShippingAddress(form){	
	if(form.checkbox.checked==true){
		//Copy all the values from billingaddress and assign values in shippingaddress
		form["shippingAddress.apartmentnumber"].value=form["billingAddress.apartmentnumber"].value
		form["shippingAddress.streetname"].value=form["billingAddress.streetname"].value
		form["shippingAddress.city"].value=form["billingAddress.city"].value
		form["shippingAddress.state"].value=form["billingAddress.state"].value
		form["shippingAddress.country"].value=form["billingAddress.country"].value
		form["shippingAddress.zipcode"].value=form["billingAddress.zipcode"].value
	}
	else{
		form["shippingAddress.apartmentnumber"].value=""
		form["shippingAddress.streetname"].value=""
		form["shippingAddress.city"].value=""
		form["shippingAddress.state"].value=""
		form["shippingAddress.country"].value=""
		form["shippingAddress.zipcode"].value=""
	}
}

$(document).ready(function(){
	$('#form').validate({
		rules:{
			"firstname":{required:true},
			"lastname":{required:true},
			"phonenumber":{required:true,
				           number:true,
				           minlength:10,
				           maxlength:10},
		    "user.email":{required:true,email:true},
		    "user.password":{required:true,minlength:5,maxlength:10},
		    "billingAddress.apartmentnumber":{required:true},
		    "billingAddress.streetname":{required:true},
		    "billingAddress.city":{required:true},
		    "billingAddress.state":{required:true},
		    "billingAddress.country":{required:true},
		    "billingAddress.zipcode":{required:true,number:true}
		},
		messages:{
			"firstname":{required:"firstname is mandatory"},
		    "lastname":{required:"lastname is required"},
		    "phonenumber":{required:"phonenumber is mandatory",
		    	           number:"Invalid phonenumber.. only digits are allowed",
		    	           minlength:"Invalid phonenumber",
		    	           maxlength:"Invalid phonenumber"},
		    "user.email":{required:"Email is mandatory",
		    	          email:"Enter valid email address"
		    	          },
		    "user.password":{required:"Please enter password",
		    	             minlength:"Minimum 5 characters should be entered ",
		    	             maxlength:"Maximum length is only 10 "
		    	             }
		}
	})
})


</script>		
		
</head>
<body>
<div class="container">
<pre>
<c:url value="/all/register" var="url"></c:url>
<form:form action="${url }" method="post" modelAttribute="customer" id="form">
CUSTOMER DETAILS
<table>
<tr><td>
<form:label path="firstname">Enter Firstname    </form:label> </td>   
<td><form:input path="firstname" id="firstname" /></td>
</tr>
<tr><td>
<form:label path="lastname">Enter Lastname       </form:label></td>   
<td><form:input path="lastname" id="lastname"/></td>
</tr>
<tr><td>
<form:label path="phonenumber">Enter Phonenumber </form:label>   </td>
<td><form:input path="phonenumber" id="phonenumber"/></td>
</tr>
</table>
<hr>
LOGIN CREDENTIALS
<table>
<tr><td>
<form:label path="user.email">Enter Email</form:label> </td>          
<td><form:input path="user.email" type="email" id="user.email"/>
<span style="color:red">${errorMessage }</span>
</td></tr>
<tr><td>
<form:label path="user.password">Enter Password</form:label>    </td>
<td> 
<form:input path="user.password" type="password" id="user.password"/></td>
</tr>
<tr><td>
<form:hidden path="user.enabled" value="true"/></td>
<td><form:hidden path="user.authorities.role" value="ROLE_USER"></form:hidden></td>
</tr>
</table>
<hr>
BILLING ADDRESS
<table>
<tr><td>
<form:label path="billingAddress.apartmentnumber">Enter Apartmentnumber</form:label></td>
<td><form:input path="billingAddress.apartmentnumber" id="billingAddress.apartmentnumber"/></td>
</tr>
<tr>
<td><form:label path="billingAddress.streetname">Enter Streetname</form:label></td>                                                        	  
<td><form:input path="billingAddress.streetname" id="billingAddress.streetname"/></td>
</tr>
<tr>
<td>
<form:label path="billingAddress.city">Enter City</form:label></td>                                
<td><form:input path="billingAddress.city" id="billingAddress.city"/></td>
</tr>
<tr>
<td>
<form:label path="billingAddress.state">Enter State</form:label></td>                              
<td><form:input path="billingAddress.state" id="billingAddress.state"/></td>
</tr>
<tr>
<td>
<form:label path="billingAddress.country">Enter Country</form:label></td>			              
<td><form:input path="billingAddress.country" id="billingAddress.country"/></td>
</tr>
<tr>
<td>
<form:label path="billingAddress.zipcode">Enter Zipcode</form:label></td>                          
<td><form:input path="billingAddress.zipcode" id="billingAddress.zipcode"/></td>
</tr>
</table>
<hr>
SHIPPING ADDRESS
Check this box, if shipping address is same as billing address
<input type="checkbox" onclick="fillShippingAddress(this.form)" id="checkbox">
<table>
<tr><td>
<form:label path="shippingAddress.apartmentnumber">Enter Apartmentnumber</form:label></td>
<td><form:input path="shippingAddress.apartmentnumber"/></td>
</tr>
<tr>
<td><form:label path="shippingAddress.streetname">Enter Streetname</form:label></td>
<td><form:input path="shippingAddress.streetname"/></td>
</tr>
<tr><td>
<form:label path="shippingAddress.city">Enter City</form:label></td>
<td><form:input path="shippingAddress.city"/></td>
</tr>
<tr><td>
<form:label path="shippingAddress.state">Enter State</form:label></td>
<td><form:input path="shippingAddress.state"/></td>
</tr>
<tr><td>
<form:label path="shippingAddress.country">Enter Country</form:label></td>
<td><form:input path="shippingAddress.country"/></td>
</tr>
<tr><td>
<form:label path="shippingAddress.zipcode">Enter Zipcode</form:label></td>
<td><form:input path="shippingAddress.zipcode"/></td>
</tr>
<tr>
<td>
<input type="submit" value="REGISTER"></td>
<td></td>
</tr>
</table>
</form:form>
</pre>
</div>
</body>
</html>
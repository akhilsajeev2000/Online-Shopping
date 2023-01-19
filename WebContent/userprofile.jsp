<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.akhil.beans.*,com.akhil.dao.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>

</head>
<body>
  
	<%
	
		String userType = (String)session.getAttribute("usertype");
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");

		
		if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
	%>
	
	<%@ include file="userHeader.jsp" %><br><br>
	
<div class="products" style="background-color:">

	<table class="table table-hover" >
		
		<tbody style="background-color:white;font-size:20px;font-weight:bold;">	
		  	
<%
		UserDaoImpl user = new UserDaoImpl();
		UserBean userBean = user.getUserDetails(userName, password);
		
		%>
		
		<h1 style="color: red">welcome <%=userBean.getUserName() %></h1>
<tr> 
 <td>name   </td> <td>:<%=userBean.getUserName() %></td>
 </tr>
 <tr>
 
 <tr> 
 <td>mobile </td> <td>:<%=userBean.getMobileNo() %></td>
 </tr>
 <tr>
 
 <tr> 
 <td>emil   </td> <td>:<%=userBean.getEmailId() %></td>
 </tr>
 <tr>
 
 <tr> 
 <td>adress  </td> <td>:<%=userBean.getAddress() %></td>
 </tr>
 <tr>
 
 <tr> 
 <td>pincode </td> <td>:<%=userBean.getPinCode() %></td>
 </tr>

			
 
  
  </tbody>
</table>
</div>
	<br><br>
	<%@ include file="footer.jsp" %>
</body>
</html>
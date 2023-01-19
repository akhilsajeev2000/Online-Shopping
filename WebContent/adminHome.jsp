<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>

</head>
<body>
	<%
	
		String userType = (String)session.getAttribute("usertype");
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
	
		if(userType== null || !userType.equals("admin")){
			
			response.sendRedirect("loginFirst.jsp");
			
		}
		
		if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
	%>
	
	<%@ include file="adminHeader.jsp" %><br><br>
	
	<div class="products" style="background-color: #E6F9E6;">
	
		<div class="tab" align="center">
			<form>
			<button type="submit" formaction="adminViewProduct.jsp">View products</button><br><br><br><br>
			<button type="submit" formaction="addProduct.jsp">Add products</button><br><br><br><br>
			<button type="submit" formaction="removeProduct.jsp">Remove Products</button><br><br><br><br>
			<button type="submit" formaction="updateProductById.jsp">Update Products</button><br><br><br><br>
			</form>
		</div>
	</div>
	<br><br><br><br><br>
	<%@ include file="footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.akhil.beans.*,com.akhil.dao.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>

</head>
<body>
	<%
	/* Checking the user credentials */
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

	<table class="table table-hover" >
		<thead style="background-color:red;color:white;font-size:20px;font-weight:bold;">
			<tr> 
     			 <th>Image </th> <th>ProductId </th> <th> Product Name</th> <th>Product Price</th> <th>Sold Items</th><th>Remaining Stock</th> 
     		</tr>
		</thead>
		<tbody style="background-color:white;font-size:20px;font-weight:bold;">	
		
		
  	
<%
    
		ProductDaoImpl productDao = new ProductDaoImpl();
		List<ProductBean> products= new ArrayList<ProductBean>();
		products = productDao.getAllProducts();
		for(ProductBean product : products){

%>
  	
  	   <tr> <td><img src="./ShowImage?pid=<%=product.getProdId() %>"  style="width:50px;height:50px;"></td> <td><a href="./updateProduct.jsp?prodid=<%=product.getProdId()%>"><%=product.getProdId() %></a></td><td><%=product.getProdName() %></td> 
     				<td><%=product.getProdPrice() %></td> <td><%=new OrderDaoImpl().countSoldItem(product.getProdId()) %></td><td><%= product.getProdQuantity() %></td> 
     				
		</tr>  		
     		
<%
  		}
  %>
  
  </tbody>
</table>
</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="footer.jsp" %>
</body>
</html>
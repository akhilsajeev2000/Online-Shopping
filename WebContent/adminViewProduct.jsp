<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.akhil.dao.*,com.akhil.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.button{
border: none;
background-color: red;
text-align: center;
color: white;
padding: 10px 18px;
display: inline-block;
font-size: 15px;
margin: 4px 2px;
cursor: pointer;
}
</style>
<title>Online Shopping Card</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
</head>
<body>

	<%
	
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		String userType = (String)session.getAttribute("usertype");
	
		if(userType==null || userName == null || password==null || !userType.equals("admin")){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
	%>



<%@ include file="adminHeader.jsp" %>

<br><br>
<div class="products" style="background-color: #E6F9E6;">
<div class="row text-center">

  <%
  
  	ProductDaoImpl prodDao = new ProductDaoImpl(); 
  	
  	List<ProductBean> products = new ArrayList<ProductBean>();
  	
  	products = prodDao.getAllProducts();
  	
  	for(ProductBean product : products){
  	
  		
  %>
  
 
    <div class="thumbnail">
      <img src="./ShowImage?pid=<%=product.getProdId() %>" alt="Product" style="height:200px; max-width:200px; max-width:300px;">
      <p class="productname"><%=product.getProdName() %> ( <%=product.getProdId() %> ) </p>
      <p class="productinfo"><%=product.getProdInfo() %></p>
      <p class="price">Rs <%=product.getProdPrice() %> </p>
      <form method="post">
      	<button type="submit" class="button" formaction="./RemoveProductSrv?prodid=<%=product.getProdId() %>">Remove Product</button>&nbsp;&nbsp;&nbsp;
      	<button type="submit" class="button" formaction="updateProduct.jsp?prodid=<%=product.getProdId() %>">Update Product</button>
      </form>
    </div>
 
  
  <%
  
  	}
  
  %>
  
</div>
</div>

<br><br>
<%@ include file="footer.jsp" %>

</body>
</html>
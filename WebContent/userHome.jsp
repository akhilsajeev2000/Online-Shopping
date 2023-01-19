<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.akhil.dao.*,com.akhil.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Online Shopping</title>
 
</head>
<body>
<%@ include file="userHeader.jsp" %>
	<%
	
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
	
		if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
		
	%>

<br>
<div class="products" style="background-color:  #E6F9E6;">
<div class="row text-center">

  <%
  
  	ProductDaoImpl prodDao = new ProductDaoImpl(); 
  	
  	List<ProductBean> products = new ArrayList<ProductBean>();
  	
  	products = prodDao.getAllProducts();
  	
  	for(ProductBean product : products){
  	
  		
  %>
  
  <div class="col-sm-4">
    <div class="thumbnail">
      <img src="./ShowImage?pid=<%=product.getProdId() %>" alt="Product" style="height:200px; max-width:200px">
      <p class="productname"><%=product.getProdName() %> ( <%=product.getProdId() %> ) </p>
      <p class="productinfo"><%=product.getProdInfo() %></p>
      <p class="price">Rs <%=product.getProdPrice() %> </p>
      <form method="post">
      	<button type="submit" formaction="./AddtoCart?uid=<%=userName %>&pid=<%=product.getProdId() %>&pqty=1">Add to Cart</button>&nbsp;&nbsp;&nbsp;
     <button type="submit" formaction="./AddtoCart?uid=<%=userName %>&pid=<%=product.getProdId() %>&pqty=1">Buy Now</button>
      </form>
    </div>
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
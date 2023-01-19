<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.akhil.dao.*,com.akhil.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Online Shopping</title>
 
</head>
<body>

	<%
	
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		String userType = (String)session.getAttribute("usertype");
	
		boolean isValidUser = true;
		
		if(userType == null || userName == null || password==null || !userType.equals("customer")){
	
			isValidUser = false;
		}	
		
	%>


<%
	if(isValidUser) {
%>
<%@ include file="userHeader.jsp" %>

<%
	}
	else{
%>
<%@ include file="header.jsp" %><br>
<%
	}
%>


<div class="products" style="background-color: #E6F9E6;">
<div class="row text-center" >

  <%
  
  	ProductDaoImpl prodDao = new ProductDaoImpl(); 
  	
  	List<ProductBean> products = new ArrayList<ProductBean>();
  	
  	products = prodDao.getAllProducts();
  	
  	for(ProductBean product : products){
  	
  		String addToCartUrl = null;
  		String buyNowUrl = null;
  		
  		if(isValidUser){
  			addToCartUrl = "./AddtoCart?uid="+userName+"&pid="+product.getProdId()+"";
  			buyNowUrl = "./BuyNow?uid="+userName+"&pid="+product.getProdId()+"";
  		}
  		else{
  			addToCartUrl = "login.jsp";
  			buyNowUrl = "login.jsp";
  		}
  		
  %>
  
  <div class="col-sm-4">
    <div class="thumbnail" >
      <img src="./ShowImage?pid=<%=product.getProdId() %>" alt="Product" style="height:200px; max-width:200px; max-width:300px;">
      <p class="productname"><%=product.getProdName() %> ( <%=product.getProdId() %> ) </p>
      <p class="productinfo"><%=product.getProdInfo() %></p>
      <p class="price">Rs <%=product.getProdPrice() %> </p>
      <form method="post">
      	<button type="submit" formaction="<%= addToCartUrl%>">Add to Cart</button>&nbsp;&nbsp;&nbsp;
      	<button type="submit" formaction="<%= buyNowUrl%>">Buy Now</button>
      </form>
    </div>
  </div>
  
  <%
  
  	}
  
  %>
  
</div>
</div>



<br><br><br><%@ include file="footer.jsp" %>

</body>
</html>
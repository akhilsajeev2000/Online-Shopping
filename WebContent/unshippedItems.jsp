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
     			 <th>TransactionId</th> <th>ProductId </th> <th>User Email Id</th><th>Address</th> <th> Quantity</th>
     		</tr>
		</thead>
		<tbody style="background-color:white;font-size:20px;font-weight:bold;">	
		  	
<%
		OrderDaoImpl orderdao = new OrderDaoImpl();

		List<OrderBean> orders = new ArrayList<OrderBean>();
		orders = orderdao.getAllOrders();
		
		for(OrderBean order: orders){
			String transId = order.getTransactionId();
			String prodId = order.getProductId();
			int quantity = order.getQuantity();
			int shipped = order.getShipped();
			String userId = new TransDaoImpl().getUserId(transId);
			String userAddr = new UserDaoImpl().getUserAddr(userId);
			if(shipped ==0 ){
%>
  	
  	   <tr> <td><%=transId %></td> <td><a href="./updateProduct.jsp?prodid=<%=prodId%>"><%=prodId %></a></td><td><%=userId %></td> 
     				<td><%=userAddr %></td> <td><%=quantity %></td>
     				
		</tr>  		
     		
<%
  		}
	}
  %>
  
  </tbody>
</table>
</div>
	<br><br>
	<%@ include file="footer.jsp" %>
</body>
</html>
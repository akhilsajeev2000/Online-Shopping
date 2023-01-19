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
		
		else if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
	%>
	
	<%@ include file="adminHeader.jsp" %>
	
	<div class="products" style="background-color: #E6F9E6;">
	
		<p id="message" class="tab" align="center">
			
		
			
		</p><br>
		
		<div class="tab" align="center">
		<h2 align="center" style="color: red;">Remove Product</h2>	
		<div style="margin: 5px">
      
        <form action="./RemoveProductSrv" method="post">
          <table border="0">
            <tr><td>Enter Product Id: </td><td><input type="text" name="prodid"style="font-size: 15px;font-weight: normal; width:80%" required ></td></tr>
            
            <tr><td><br></td><td><br></td></tr>
            
            <tr colspan="2" align="center"><td><button><a href="adminViewProduct.jsp">Cancel</a></button>&nbsp;</td><td><input type="submit" name="submit" value="Delete Item"></td></tr>

          </table>
        
        </form>
    </div>  

		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>
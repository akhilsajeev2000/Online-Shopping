<style>
    body{
    font-family: sans-serif;
}
.logo {
   margin-left: 5px;
float: left;  
    font-size: 150%; 
    
}
.logo span{
    color: red;
    
}

.menu{
    
}
.menu ul{
    float: right;
    list-style: none;
 
}


.menu a{
    text-decoration: none;
    color: white;
    border: 2px groove red;
    border-style: solid;
    background-color: black;
    padding: 10px;
}
.menu a:hover{
    text-decoration: none;
    color: white;
    border: 2px groove black;
    border-style: solid;
    background-color: red;
    padding: 10px;
}
.menu li{
    float: left;
    padding: 20px;
    font-size: 100%;
      background-color: black;
    color: white;
  
}
.c{
   background-color: black;
}
.d{
   background-color: red;
}

</style>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.akhil.dao.*" %>
    <div class="logo">
    <h2><span>ONLINE</span> SHOPPING</h2> 
        </div>
    <div class="menu">
       <%
		 
		int notf = new CartDaoImpl().getCartCount((String)session.getAttribute("username"));
	
	%>
    <ul>
              <li><a href="userHome.jsp"><span class="">Home</span></a></li>
<!--         <li><a href="./ProfileSrv">Profile</a></li> -->
			<% 
				if(notf == 0) {
				
			%>
			
			<li> <a href="cartDetails.jsp"  id="mycart">Cart</a></li>
			
			<%
				}
				else{
			%>
         <li> <a href="cartDetails.jsp" id="mycart">Cart</a></li>
 				<% 
 					} 
 				%>
 
 		  <li><a href="userunshippedItems.jsp">my order</a></li>
        <li><a href="userprofile.jsp">Profile</a></li>
        <li><a href="./LogoutSrv">Logout</a></li>
      </ul>
    </div>
	
<div class="c">
<br/>
</div><br/><br/><br/><br/>
<div class="d">
<br/>
</div>



</body>
</html>
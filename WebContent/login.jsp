<!DOCTYPE html>
<html>
<head>
<title>Shoping Center</title>
<style type="text/css">
.button{
border: none;
background-color: red;
text-align: center;
color: white;
padding: 15px 32px;
display: inline-block;
font-size: 20px;
margin: 4px 2px;
cursor: pointer;
}
</style>
<%@ include file="header.jsp" %>
<div class="products" style="background-color: #E6F9E6;">

	<h2 class="tab"  align="center" style="color:brown;" id="message">Login Here</h2><br>
  <div class="tab"  align="center">
    
    <div style="margin: 5px">
      
        <form action="./LoginSrv" method="post">
          Email id: <input type="text" name="username"style="font-size: 15px;font-weight: normal;" placeholder="Enter Email-Id" required><br/><br/><br/><br/>
          Password: <input type="password" name="password"style="font-size: 15px;font-weight: normal;" placeholder="Enter Password" required><br/><br/><br/><br/>
         
         <input type="hidden" name="usertype" value="customer">    
                    &nbsp;&nbsp;
                    <input type="submit" class="button" value=" Login "><br/><br/>
                    
    </div>  
  </div>
  <div class="tab" style="margin-top: 10px;text-align: center">
      <a href="register1.jsp">New User ? Register Here</a>

  </div>
</div><br>
<%@ include file="footer.jsp" %>



</body>
</html>
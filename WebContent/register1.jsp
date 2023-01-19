<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<%@ include file="header.jsp" %>
</head>
<body>

<div class="products" style="background-color: #E6F9E6;">
  <div class="tab"  align="center">
    
    <div style="margin: 5px">
      <h2 style="color: red;">REGISTER</h2>
        <form action="./RegisterSrv" method="post">
          <table border="0">
            <tr><td>Name: </td><td><input type="text" name="username"style="font-size: 15px;font-weight: normal; width:100%" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Mobile No.&nbsp;</td><td><input type="Phone" name="mobile"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>            
            <tr><td>Email Id</td><td><input type="email" name="email"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Address</td><td><textarea name="address"style="font-size: 15px;font-weight: normal;width: 100%; height: 80px" required></textarea></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>PinCode</td><td><input type="text" name="pincode"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Password</td><td><input type="password" name="password"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr colspan="2" align="center"><td>&nbsp;</td><td><input type="submit" class="button" name="submit" value="Register"></td></tr>

          </table>
        
        </form>
    </div>  
  </div>
  <div class="tab" style="margin-top: 10px;text-align: center">
      <a href="login.jsp">Existing User Login Here</a>

  </div>
</div>

</body>
</html>
	<%@ include file="footer.jsp" %>
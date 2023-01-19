<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Denied</title>

</head>
<body>

	<%@ include file="header.jsp" %>
	
<div class="products" style="background-color: #E6F9E6;">

	<h2 class="tab"  align="center" style="color:brown;" id="message">Login Credential Failed, Please Login First!</h2><br>
  <div class="tab"  align="center">
    
    <div style="margin: 5px">
      
        <form action="./LoginSrv" method="post">
          Username: <input type="text" name="username"style="font-size: 15px;font-weight: normal;" placeholder="Enter username" required> <br/><br/><br/><br/>
          Password: <input type="password" name="password"style="font-size: 15px;font-weight: normal;" placeholder="Enter Password" required><br/><br/><br/><br/>
          Login As: <select name="usertype" style="font-size: 16px;" required>
                      <option value="customer">Customer</option>
                      <option value="admin">Admin</option>
                    </select> <br/><br/><br/><br/>
                    &nbsp;&nbsp;
                    <input type="submit" value=" Login "><br/><br/>
        </form>
    </div>  
  </div>
  <div class="tab" style="margin-top: 10px;text-align: center">
      <a href="register.html">New User ? Register Here</a>

  </div>
</div><br/><br/>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
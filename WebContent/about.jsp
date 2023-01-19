<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@include file="headerhome.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="about-section">
  <h1>About Page</h1>
  <p>Online Shopping is a webaplication</p>
  <p>Online shopping is a process whereby consumers directly buy goods, services etc</p>
</div>

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
     
      <div class="container">
        <h1>Akhil Sajeev</h1>
        <p>akhil@gmail.com</p>
         <h1>hayarunisa</h1>
        <p>hayarunisa@gmail.com</p>
         <h1>Agash</h1>
        <p>agash@gmail.com</p>
         <h1>aswin</h1>
        <p>aswin@gmail.com</p>
        <p><button class="button">Contact</button></p><br>
      </div>
    </div>
  </div>

</body>
</html>


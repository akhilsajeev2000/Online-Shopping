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

    <div class="logo">
    <h2><span>ADMIN </span>PAGE</h2> 
        </div>
    <div class="menu">
       <ul>
       <li class="active"><a href="adminViewProduct.jsp">Products</a></li>
          <li><a href="adminStock.jsp">Stock</a></li>
         
          <li><a href="unshippedItems.jsp">Orders</a></li>
        
           <li><a href="addProduct.jsp">Add </a></li>
          
           <li><a href="updateProductById.jsp">Update</a></li>
           <li><a href="removeProduct.jsp">Remove</a></li>
          <li><a href="./LogoutSrv">Logout</a></li>
          </ul>  
           </div>
            
         <div class="c">
<br/>
</div><br/><br/><br/><br/>
<div class="d">
<br/>
</div>
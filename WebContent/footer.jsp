<style>
    
    .footer{
    font-family: sans-serif;
    background-color: black;
    color: white;
    
}
h3{
    margin-left: 50px;
}
span{
    color: red;
}
</style>
<div class="footer">
<br/>
 <h4>
&copy;  <span id="year"></span>  Online Shopping System | Designed by :JAVA PROJRCT TEAM 
</h4>
<br/>
</div>
<script>
    document.getElementById("year").innerHTML = new Date().getFullYear();
</script>
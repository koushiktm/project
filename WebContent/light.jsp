<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>LIGHTS</title>
<link rel="stylesheet" type="text/css" href="">

<link href='http://fonts.googleapis.com/css?family=Wendy+One' rel='stylesheet' type='text/css'>
<style type="text/css">
#Logoname
{
color: #323232;
font-family: 'Wendy One', sans-serif;
font-size: 64px;
position: relative;
top: 0px;
left: 90px;
}

#Logo
{
position: fixed;
width: 100%;
}

ul{
    list-style:none;
    width:85px;
    height:26px;
    position:absolute;
    top:50%;
    left:50%;
    margin:-13px 0 0 -42px;
}

ul li{
    float:left;
    line-height:23px;
    font-size:11px;
    padding:2px 10px 0; 
    
    background: #E5E5E5;
    background-image:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#F3F3F3), to(#E5E5E5));
    text-shadow:0 1px 0 #FFF;
    border-left:1px solid #D5D5D5;
    border-top:1px solid #D5D5D5;
    border-bottom:1px solid #D5D5D5;
    -webkit-box-shadow:0 1px 0 #FFF inset, 0 0 5px rgba(0, 0, 0, .1) inset, 0 1px 1px rgba(0, 0, 0, .3);
}

ul li:first-child{
    -webkit-border-radius:5px 0 0 5px;
}
ul li:last-child{
    -webkit-border-radius:0 5px 5px 0;
}

ul li a{
    text-decoration: none;
    font-family:Helvetica, Arial;
    text-transform:uppercase;
    color:#a1a1a1;
}

.on{
    background: #505050;
    background-image:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#777), to(#505050));
    text-shadow:0 -1px 0 #444, 0 0 7px #9AE658;
    border-right:1px solid #444;
    border-top:1px solid #444;
    border-bottom:1px solid #444;
    -webkit-box-shadow:0 1px 2px rgba(0, 0, 0, .7) inset, 0 1px 0 #FFF;  
}

ul li:not(.on):active{
    background-image:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#ddd), to(#f1f1f1));
}


ul li.on a{
    color:#7BBA47;
    cursor: default;
}
</style>
</head>
<body>
<section id="">
<div id="Lights">SHAS Lights</div>
</section>
<div class="container">
<section id="">
<form method="post" action="light.jsp">
<h1>Lights</h1>
<table border="10" name="room">
<%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SHAS","root","new");
 
 String sqlOption="select * from room";
 PreparedStatement psLight=null;
 
 
 psLight=con.prepareStatement(sqlOption);
 
 ResultSet rsLight = null;
 ResultSet rsLight1=null;
 
 rsLight=psLight.executeQuery();
 int s;
 while(rsLight.next()){
     %>
     <tr>
 <td><%=rsLight.getString(2)%></td>
     <% s=Integer.parseInt(rsLight.getString(3));
     switch(s)
     {
     case 1:
     %>
    	 <td><input type="range" min="0" max="100" value="0"></td>
     <% break;
     case 0:
     %>
     <td><input type="radio" value="0" name="select">ON
     <input type="radio" value="1" name="select">OFF</td>
     <% break;
     }
     %></tr> 
 <%
 }
     %>

</table>
<a href="http://localhost:8080/start/addlight.jsp"><input type="button" name="addLight" value="Add Light Devices"></a>
</form>
</div>
</body>
</html>
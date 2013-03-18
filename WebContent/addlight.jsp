<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*,javax.servlet.*" errorPage=""
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Lights</title>
<script>
function validate()
	{
	 if(trim(document.frmaddlight.roomlist.value)==99)
     {
       alert("Please Select");
       document.frmaddlight.roomlist.focus();
       return false;
     }
	}
</script>
</head>
<body>
<h1>Add Light</h1>
<form name="frmaddlight" onSubmit="return validate();" action="doaddLight.jsp" method="post">
<table border="1" height="100" width="500" align="center">
<tr>
<td align="center">Room List</td>
<td>
<select name='roomlist' onchange="showState(this.value)">  
  <option value="none">Select</option>  
 <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SHAS","root","new");  
 String sqlOption="select distinct rooms from room";
 PreparedStatement psLight=null;
 
 psLight=con.prepareStatement(sqlOption);
 ResultSet rsLight = null;
 
 rsLight=psLight.executeQuery();
 while(rsLight.next()){
     %>
 <option value="<%=rsLight.getString(1)%>"><%=rsLight.getString(1)%></option>  
 <%
 }
     %>
     <option value="99">Other...</option>
     <input type=textbox name="roomlist"></select>
       </td>
 </select>
</tr>
<tr>
<td>Device Name:</td>
<td><input type=textbox name=txtDeviceName></td>
</tr>
<tr>
<td>Button Type</td>
<td>
<input type="radio" value="0" name="select">Slider
<input type="radio" value="1" name="select">ON/OFF
</td>
</tr>
<tr>
<td>Conditions</td>
<td><select name='roomcondition' onchange="showState(this.value)">
<option value="0">OFF</option>
<option value="1">Natural</option>
<option value="2">Read</option>
</select></td>

</tr>
<tr>
<td><input type ="submit" value="ADD"></td>
<td><input type="reset" value="CANCEL"></td>
</tr>
</table>

</form>
</body>
</html>
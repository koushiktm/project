<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function validate()
	{
	if(document.frmRegistration.pass.value != document.frmRegistration.cpass.value)
		{
		alert("Password Do not match");
		document.frmRegistration.pass.focus();
		return false;
		}
	else if(document.frmRegistration.pass.value.length < 8)
		{
		alert("Password Must be 8 characters long");
		document.frmRegistration.pass.focus();
		return false;
		}
	   var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";

       for (var i = 0; i < document.frmRegistration.fname.value.length; i++) {
         if (iChars.indexOf(document.frmLogin.frmRegistration.fname.charAt(i)) != -1) {
         alert ("Your Firstname has special characters. \nThese are not allowed.\n Please remove them and try again.");
         return false;
         }
         for (var i = 0; i < document.frmRegistration.lname.value.length; i++) {
             if (iChars.indexOf(document.frmLogin.frmRegistration.lname.charAt(i)) != -1) {
             alert ("Your Firstname has special characters. \nThese are not allowed.\n Please remove them and try again.");
             return false;
             }
       }
	
	var testresults
	
	var str=document.frmRegistration.email.value
	var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
	if (filter.test(str))
	testresults=true
	else
	{
	alert("Please input a valid email address!")
	testresults=false
	}
	return (testresults)
	}
function clear()
	{
	document.frmRegistration.email.value="";
	document.frmRegistration.fname.value="";
	document.frmRegistration.lname.value="";
	
	}
</script>
</head>
<body onContextMenu="return false">
<form method="post" name="frmRegistration" onSubmit="return validate();" action="doRegistration.jsp" onReset="return clear();">

Email :<input type="text" name="email" /><br/>
First name :<input type="text" name="fname" /><br/>
Last name :<input type="text" name="lname" /><br/>
User name :<input type="text" name="userid" /><br/>
Password:<input type="password" size=25 name="pass"><br/>
Confirm Password:<input type="password" name="cpass" size=25><br/>
<input type="submit" value="Register" name="sSubmit"/><br/>
<input type="reset" value="Reset" name="sReset"/><br/>
</form>
</body>
</html>
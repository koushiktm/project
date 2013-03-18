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
	var testresults;

	var str=document.frmRegistration.email.value;
	var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if (!filter.test(str))
	{
		alert("Please input a valid email address!");
		return false;
	}

	else if ((!document.frmRegistration.fname.value.match(/^[a-zA-Z]+$/)))
     {
		 document.frmRegistration.fname.value="";
		 document.frmRegistration.fname.focus(); 
         alert("Please Enter First Name in text");
         return false;
     }
	else if ((!document.frmRegistration.lname.value.match(/^[a-zA-Z]+$/)))
     {
		 document.frmRegistration.lname.value="";
		 document.frmRegistration.lname.focus(); 
         alert("Please Enter Last Name in text");
         return false;
     }
	else if((document.frmRegistration.username.value.length<=0))
	 {
	 alert("Please Enter Username Fields");
	 return false;
	 }
	else if(document.frmRegistration.pass.value != document.frmRegistration.cpass.value)
	 {
	 alert("Password Do not match");
	 document.frmRegistration.pass.focus();
	 return false;
	 }
	 else if((document.frmRegistration.pass.value.length < 8) && (document.frmRegistration.pass.value==""))
	 {
	 alert("Password Must be 8 characters long");
	 document.frmRegistration.pass.focus();
	 return false;
	 }
}
</script>
</head>
<body>
<form method="post" name="frmRegistration" onSubmit="return validate();" action="doRegistration.jsp" onReset="return clear();">

Email :<input type="text" name="email" /><br/>
First name :<input type="text" name="fname" /><br/>
Last name :<input type="text" name="lname" /><br/>
User name :<input type="text" name="username" /><br/>
Password:<input type="password" size=25 name="pass"><br/>
Confirm Password:<input type="password" name="cpass" size=25><br/>
<input type="submit" value="Register" name="sSubmit"/> &nbsp; &nbsp;
<input type="reset" value="Reset" name="sReset"/><br/>
</form>
</body>
</html>
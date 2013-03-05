<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%
String error=request.getParameter("error");

if(error==null || error=="null"){
 error="";
}
%>
<html>
<head>
<title>User Login JSP</title>
<script>
    function trim(s) 
    {
        return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
    }

    function validate()
    {
        if(trim(document.frmLogin.sUsername.value)=="")
        {
          alert("Login empty");
          document.frmLogin.sUsername.focus();
          return false;
        }
        else if(trim(document.frmLogin.sPassword.value)=="")
        {
          alert("password empty");
          document.frmLogin.sPassword.focus();
          return false;
        }
       // else if (!frmLogin.sUsername.value.match(/^[a-zA-Z]+$/))
        //{
          //         alert("Please Enter only letters in text");
            //       document.frmLogin.sUsername.focus();
              //     return false;
        //}
        var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";

        for (var i = 0; i < document.frmLogin.sUsername.value.length; i++) {
          if (iChars.indexOf(document.frmLogin.sUsername.value.charAt(i)) != -1) {
          alert ("Your username has special characters. \nThese are not allowed.\n Please remove them and try again.");
          return false;
          }
        }
        
    }
    
</script>
</head>

<body>
<div><%=error%></div>
<form name="frmLogin" onSubmit="return validate();" action="doLogin.jsp" method="post">
User Name <input type="text" name="sUsername" /><br />
Password <input type="password" name="sPassword" /><br />
<a href="http://localhost:8080/start/forgotpassword.jsp">Forgot Password</a> &nbsp; &nbsp;
<a href="http://localhost:8080/start/Registration.jsp">New User?</a><br/>
<input type="submit" name="sSubmit" value="Submit" />
</form>
</body>
</html>

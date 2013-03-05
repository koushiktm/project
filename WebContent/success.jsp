<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<html>
<head>
<title>Successfully Login by JSP</title>
<script type="text/javascript">

window.history.forward(1);
function noBack() { window.history.forward(1); }
</script>
</head>

<BODY onload="noBack();">
Successfully login by JSP<br />
Session Value<br />
<%
out.print("UserName :"+session.getAttribute("")+"<br>");

%>
</body>
</html>
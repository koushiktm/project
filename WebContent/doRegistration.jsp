<%@ page language="java" import="java.sql.*,java.util.*,javax.servlet.*,java.text.*" errorPage="" %>


<% 
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SHAS","root", "new");
    
    PreparedStatement psdoRegistration=null;
    
    String sUsername=request.getParameter("username");
    
    String sPassword=request.getParameter("pass");
    
    String sFirstname=request.getParameter("fname");
    
    String sLastname=request.getParameter("lname");
    
    String sEmail=request.getParameter("email");
    
    String message="User Registered successfully";
    
    
    
    
   
    
    try{
    String sqlOption="insert into login(Email,Firstname,Lastname,Username,Password) values('"+sEmail+"','"+sFirstname+"','"+sLastname+"','"+sUsername+"','"+sPassword+"')";
   
    psdoRegistration=conn.prepareStatement(sqlOption);
  
    
    psdoRegistration.executeUpdate(sqlOption);
    if(psdoRegistration!=null){
   	 psdoRegistration.close();
    }
   
    if(conn!=null){
     conn.close();
    } 
    if (message=="User Registered successfully")
    response.sendRedirect("login.jsp?error="+message);
    else
    {
    	response.sendRedirect("test.jsp"+ message);
    }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<% 
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SHAS","root", "new");
    //System.out.println("I'm Here Successfully");
    ResultSet rsdoLogin = null;
    PreparedStatement psdoLogin=null;
    
    String sUsername=request.getParameter("username");
    
    String sPassword=request.getParameter("pass");
    
    String sFirstname=request.getParameter("fname");
    String sLastname=request.getParameter("lname");
    String sEmail=request.getParameter("email");
    
    String message="User Registered successfully";
    
    
    try{
    String sqlOption="insert into login(Email,Firstname,Lastname,Username,Password) values('"+sEmail+"','"+sFirstname+"','"+sLastname+"','"+sUsername+"','"+sPassword+"')";
   
    psdoLogin=conn.prepareStatement(sqlOption);
  
    
    psdoLogin.executeQuery();

   // if(rsdoLogin.next())
    {
      response.sendRedirect("login.jsp?error="+message);
    }
   // else
    {
    //	 response.sendRedirect("login.jsp?error="+message);
    }
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    /// close object and connection
    try{
         if(psdoLogin!=null){
             psdoLogin.close();
         }
         if(rsdoLogin!=null){
             rsdoLogin.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<% 
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SHAS","root", "new");
    //System.out.println("I'm Here Successfully");
    ResultSet rsdoLogin = null;
    PreparedStatement psdoLogin=null;
    
    String sUsername=request.getParameter("sUsername");
    out.println(sUsername);
    String sPassword=request.getParameter("sPassword");
    out.println(sPassword);
    String message="User login successfully ";
    
    
    try{
    String sqlOption="select Username,Password FROM login where Username='"+sUsername+"' and Password='"+sPassword+"'";
   
    psdoLogin=conn.prepareStatement(sqlOption);
  
    
    rsdoLogin=psdoLogin.executeQuery();
    if(rsdoLogin.next())
    {
      response.sendRedirect("success.jsp?error="+message);
    }
    else
    {
      message="No user or password matched" ;
      response.sendRedirect("login.jsp?error="+message);
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
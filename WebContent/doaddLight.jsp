<%@ page language="java" import="java.sql.*" errorPage="" %>
<% 
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SHAS","root", "new");
    //System.out.println("I'm Here Successfully");
    
    PreparedStatement psdoaddLight=null;
    
    String roomlist=request.getParameter("roomlist");
    out.println(roomlist);
    String devicename=request.getParameter("txtDeviceName");    
    out.println(devicename);
    int type=Integer.parseInt(request.getParameter("select"));
    out.println(type);
    int iroomcond=Integer.parseInt(request.getParameter("roomcondition"));
    out.println(iroomcond);
    try{
    String sqlOption="insert into room(rooms,lights,buttonmode,precondition) values('"+roomlist+"','"+devicename+"','"+type+"','"+iroomcond+"')";
   
    psdoaddLight=conn.prepareStatement(sqlOption);
  
    
    psdoaddLight=conn.prepareStatement(sqlOption);
  
    
    psdoaddLight.executeUpdate(sqlOption);
    if(psdoaddLight!=null){
    	psdoaddLight.close();
    }
   
    
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
 
   
%>
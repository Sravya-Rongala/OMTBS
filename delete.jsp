<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); 
String id=request.getParameter("userid");
System.out.println(id);
PreparedStatement ps=con.prepareStatement("delete from ticket where userid=?");
ps.setString(1,id);
int r=ps.executeUpdate();
if(r==0)
out.println("Deletion Failure");
else
out.println("Deletion Success");
con.close();
%>
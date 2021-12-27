<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
String n=request.getParameter("sname");
String id=request.getParameter("userid");
String e=request.getParameter("email");
String no=request.getParameter("cno");
String add=request.getParameter("address");
String p=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
PreparedStatement pst=con.prepareStatement("insert into register (sname,userid,email,cno,address,pass) values(?,?,?,?,?,?)");
pst.setString(1,n);
pst.setString(2,id);
pst.setString(3,e);
pst.setString(4,no);
pst.setString(5,add);
pst.setString(6,p);
int r=pst.executeUpdate();
if(r==0)
out.println("failure");
else
{%>
<jsp:forward page="login1.html"></jsp:forward>
<%}
con.close();
%>

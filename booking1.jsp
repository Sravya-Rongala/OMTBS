<html>
<body>
<center>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%
String id=request.getParameter("userid");
String mv=request.getParameter("movie");
String dt=request.getParameter("date");
String sl=request.getParameter("slot");
String se=request.getParameter("seat");
String ns=request.getParameter("noofseats");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
Class.forName("com.mysql.jdbc.Driver");
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
Class.forName("com.mysql.jdbc.Driver");
Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
Class.forName("com.mysql.jdbc.Driver");
Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
int total=Integer.parseInt(ns);
Statement st1=con1.createStatement();
ResultSet rs1=st1.executeQuery("select theatreid from theatre where moviename='"+mv+"'");
String thid = " ";
while(rs1.next())
{
 thid = rs1.getString("theatreid");
}
Statement st2=con2.createStatement();
ResultSet rs2=st2.executeQuery("select cost,noofseats from seats where theatreid='"+thid+"' and seattype='"+se+"'");
int cos=0;
int p=0;
while(rs2.next())
{
 cos = rs2.getInt("cost");
 p = rs2.getInt("noofseats");
}
Statement st3=con3.createStatement();
ResultSet rs3=st3.executeQuery("select sum(noofseats) as  nse from ticket where movie='"+mv+"' and slot='"+sl+"' and date='"+dt+"' and seat='"+se+"'");
int q=0;
while(rs3.next())
{
q = rs3.getInt("nse");
}
if((p-q)<total)
{
out.println("Required no of seats are not available");
}
else
{
int pay=cos*total;
out.println("Total seats booked:" + total);
out.println("Total pay:"+ pay);
String tpay = String.valueOf(pay);

PreparedStatement pst=con.prepareStatement("insert into ticket(userid,movie,date,slot,seat,noofseats,totalpay) values(?,?,?,?,?,?,?)");
pst.setString(1,id);
pst.setString(2,mv);
pst.setString(3,dt);
pst.setString(4,sl);
pst.setString(5,se);
pst.setString(6,ns);
pst.setString(7,tpay);
int r=pst.executeUpdate();
if(r==0)
{
out.println(" Booking Failure");
out.println("Try Again!!");
}
else
{
out.println(" Booking Successful Paynow");
{%>
<form action="payment.html">
<input type="submit" name="submit" value="paynow">
</form>
<%}
}
}
con.close();
%>
</center>
</body>
</html>

<html>
<head>
 <script src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
<style>
body{
background-image:url('pic7.jpg');
background-repeat: no-repeat;
background-size: cover;
background-attachment: fixed;
}
 .button {
  background-color: #008000;
  cursor: pointer;
  border: 2px solid black;
  color: white;
  padding: 5px 10px;
  text-align: center;
  display: inline-block;
  font-size: 14px;
  font-family: "cursive","cursive", cursive;
}    
h3{
font-family: "cursive",cursive,cursive;
font-size: 19px;
}
table.center{
         margin-right: auto;
 margin-left: auto;
}
input[type=submit] {
color: black;
background-color: #FFF5DA;
}
</style>
</head>
<body>
<center>
<div style="position: fixed;
top: 210px;
left: 620px;"
>
<table class="center">
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
{%>
<tr><h3>Required no of seats are not available</h3></tr>
<br>
<tr><h3>You can book for another</h3></tr>
<br>
<tr><form action="booking.html">
<button type="submit" class="button">BACK <i class="fas fa-backward"></i>
</button>
</form></tr>
<%}
else
{
int pay=cos*total;
{%>
<tr><h3>Total seats booked: <% out.print(total);%></h3></tr>
<br>
<tr><h3>Total pay: <% out.print(pay); %></h3></tr> 
<br>
<%}
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
{%>
<tr> <h3>Booking Failure</h3></tr>
<br>
<tr> <h3>Try Again!!</h3></tr>
<%}
else
{%>
<tr> <h3>Booking Successful..!!</h3></tr>
<br>
<tr><form action="payment.html">
<button type="submit" class="button">PAY NOW <i class="fas fa-rupee-sign"></i>
</button>
</form></tr>
<%}
}
con.close();
%>
</table>
</div>
</center>
</body>
</html>

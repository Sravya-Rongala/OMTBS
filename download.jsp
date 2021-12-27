<%@ page import="java.sql.*" %>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
<title>
Downloading ticket
</title>
<style>
h3{
font-family: "cursive",cursive,cursive;
font-size: 18px;
}
h2{
font-family: "cursive",cursive,cursive;
font-size: 25px;
}
h1{
font-family: "cursive",cursive,cursive;
font-size: 30px;
}
.button {
  background-color: #E93B81;
  cursor: pointer;
  border: 2px solid black;
  color: white;
  padding: 5px 10px;
  text-align: center;
  display: inline-block;
  font-size: 14px;
  font-family: "cursive","cursive", cursive;
}    
</style>
</head>
<body>
<center>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); 
String id=request.getParameter("userid");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from ticket where userid='"+id+"' ");
if(rs.next())
{
%>
<div style="
position: fixed;
top: 150px;
left: 440px;">
<img src="pic8.jpg" alt="Ticket" width="750" height="350">
</div>
<div style="
position: fixed;
top: 308px;
left: 840px;">
<h3><%=rs.getString("userid") %></h3>
<div style="
position: fixed;
top: 378px;
left: 640px;">
<h3><%=rs.getString("movie") %></h3>
</div>
<div style="
position: fixed;
top: 428px;
left: 640px;">
<h3><%=rs.getString("slot") %></h3>
</div>
<div style="
position: fixed;
top: 428px;
left: 1060px;">
<h3>Date</h3>
</div>
<div style="
position: fixed;
top: 450px;
left: 1025px;">
<h3><%=rs.getString("date") %> </h3>
</div>
<div style="
position: fixed;
top: 398px;
left: 1060px;">
<h3><%=rs.getString("totalpay") %></h3>
</div>
<div style="
position: fixed;
top: 423px;
left: 940px;">
<h3><%=rs.getString("seat") %></h3>
</div>
<div style="
position: fixed;
top: 378px;
left: 840px;">
<h3>Seats </h3>
</div>
<div style="
position: fixed;
top: 413px;
left: 853px;">
<h2><%=rs.getString("noofseats") %> </h2>
</div>
<%
}
else
{%>
<img src="https://storage.pixteller.com/designs/designs-images/2019-03-27/05/funny-background-drawing-backgrounds-cartoon-1-5c9b97d3b52ee.png" alt="Ticket" width="100%" height="100%">
<div style="
position: fixed;
top: 308px;
left: 460px;">
<h1>YOU HAVEN'T BOOKED ANY TICKET YET...!!</h1>
<h2>YOU CAN BOOK NOW</h2>
<form action="main.html">
<button type="submit" class="button">BOOK  <i class="fas fa-film"></i>
</button>
</form>
</div>
<%}
con.close();
%>
</center>
</body>
</html>
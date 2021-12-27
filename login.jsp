<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
String id=request.getParameter("Username");
String p=request.getParameter("Password");
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); 
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from register where userid='"+id+"' and pass='"+p+"'");
             if(rs.next())
             {%>
        <jsp:forward page="main.html"></jsp:forward>
        <%}
        else
        { 
        out.println("Login Failure");
        out.println("Try Again");
        } 
con.close();
%>

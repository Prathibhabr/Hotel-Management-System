<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>DB Test</title>
</head>

<body style="text-align:center; font-family:Arial;">

<h2>Database Test</h2>

<%
try {
    Connection con = DBConnection.getConnection();

    if(con == null){
%>
<p style="color:red;">Connection FAILED</p>
<%
    } else {
%>
<p style="color:green;">Connected SUCCESSFULLY</p>
<%
    }

} catch(Exception e){
%>
<p style="color:red;">ERROR: <%= e.getMessage() %></p>
<%
}
%>

</body>
</html>
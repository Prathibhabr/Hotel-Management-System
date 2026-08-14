<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Bookings</title>

<style>
body { 
    font-family: Arial; 
    background:#f5a6c0; 
}

.box { 
    background:white; 
    padding:20px; 
    margin:20px auto; 
    border-radius:10px; 
    width:90%;
}

h2 {
    text-align:center;
}

table { 
    width:100%; 
    border-collapse:collapse; 
}

th { 
    background:#ff4b8b; 
    color:white; 
    padding:10px; 
}

td { 
    padding:10px; 
    border:1px solid #ddd; 
    text-align:center; 
}

.paid { color:green; font-weight:bold; }
.pending { color:red; font-weight:bold; }
</style>
</head>

<body>

<div class="box">

<h2>Bookings</h2>

<%
try {

Connection con = DBConnection.getConnection();

if(con == null){
%>
<p style="color:red;">DB FAILED</p>
<%
return;
}

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM checkin");

int count = 0;
%>

<table>
<tr>
    <th>Name</th>
    <th>Phone</th>
    <th>Room</th>
    <th>Rooms</th>
    <th>Total</th>
    <th>Paid</th>
    <th>Pending</th>
    <th>Status</th>
</tr>

<%
while(rs.next()){

count++;

double pending = rs.getDouble("pending");
boolean isPaid = (pending == 0);
%>

<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("phone") %></td>
    <td><%= rs.getString("roomType") %></td>
    <td><%= rs.getInt("rooms") %></td>
    <td>₹<%= rs.getDouble("total") %></td>
    <td>₹<%= rs.getDouble("paid") %></td>
    <td>₹<%= pending %></td>

    <td class="<%= isPaid ? "paid" : "pending" %>">
        <%= isPaid ? "Paid" : "Pending" %>
    </td>
</tr>

<%
}
%>

</table>

<br>
<h3>Total Bookings: <%= count %></h3>

<%
} catch(Exception e){
%>
<p style="color:red;">ERROR: <%= e.getMessage() %></p>
<%
}
%>

</div>

</body>
</html>
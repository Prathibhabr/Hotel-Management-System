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
    background: #f5a6c0;
}

.container {
    width: 95%;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 10px;
}

h2 {
    text-align: center;
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #ff4b8b;
    color: white;
    padding: 10px;
}

td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

.paid { color: green; font-weight: bold; }
.pending { color: red; font-weight: bold; }

</style>
</head>

<body>

<div class="container">

<h2>Bookings Page</h2>

<%
try {

Connection con = DBConnection.getConnection();

if(con == null){
%>
<p style="color:red;">DB CONNECTION FAILED</p>
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
    <th>Room Type</th>
    <th>Rooms</th>
    <th>Days</th>
    <th>Total</th>
    <th>Paid</th>
    <th>Pending</th>
    <th>Status</th>
</tr>

<%
while(rs.next()){

count++;

String name = rs.getString("name");
String phone = rs.getString("phone");
String type = rs.getString("roomType");

int rooms = rs.getInt("rooms");
int days = rs.getInt("days");

double total = rs.getDouble("total");
double paid = rs.getDouble("paid");
double pending = rs.getDouble("pending");

boolean isPaid = (pending == 0);
%>

<tr>
    <td><%= name %></td>
    <td><%= phone %></td>
    <td><%= (type!=null ? type : "N/A") %></td>
    <td><%= rooms %></td>
    <td><%= days %></td>
    <td>₹<%= total %></td>
    <td>₹<%= paid %></td>
    <td>₹<%= pending %></td>

    <td class="<%= isPaid ? "paid" : "pending" %>">
        <%= isPaid ? "Paid" : "Pending" %>
    </td>
</tr>

<%
}
%>

</table>

<h3>Total Bookings: <%= count %></h3>

<%
} catch(Exception e){
%>
<h2 style="color:red;">ERROR:</h2>
<p><%= e.getMessage() %></p>
<%
}
%>

</div>

</body>
</html>
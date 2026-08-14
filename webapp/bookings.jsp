<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Bookings</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right,#74ebd5,#9face6);
}

.container {
    width: 90%;
    margin: 40px auto;
    background: white;
    padding: 20px;
    border-radius: 15px;
}

h2 {
    text-align: center;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #333;
    color: white;
    padding: 10px;
}

td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.btn {
    padding: 5px 10px;
    border-radius: 5px;
    color: white;
    text-decoration: none;
}

.edit { background: orange; }
.delete { background: red; }

.status-green { background: green; color: white; padding: 5px; border-radius: 5px; }
.status-yellow { background: orange; color: white; padding: 5px; border-radius: 5px; }
</style>
</head>

<body>

<div class="container">

<h2>📋 All Bookings</h2>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Phone</th>
<th>Room</th>
<th>Rooms</th>
<th>Total</th>
<th>Status</th>
<th>Actions</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM checkin");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("phone")%></td>
<td><%=rs.getString("roomType")%></td>
<td><%=rs.getInt("rooms")%></td>
<td><%=rs.getDouble("total")%></td>

<td>
<%
if(rs.getDouble("pending") == 0){
%>
<span class="status-green">Paid</span>
<%
} else {
%>
<span class="status-yellow">Pending</span>
<%
}
%>
</td>

<td>
<a class="btn edit" href="editBooking.jsp?id=<%=rs.getInt("id")%>">Edit</a>
<a class="btn delete" href="deleteBooking?id=<%=rs.getInt("id")%>">Delete</a>
</td>

</tr>

<%
}
%>

</table>

</div>

</body>
</html>
<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Booking Report</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
    text-align: center;
}

table {
    border-collapse: collapse;
    margin: auto;
}

th, td {
    padding: 10px;
}

th {
    background-color: #333;
    color: white;
}

.nav {
    background: #333;
    padding: 10px;
    margin-top: 20px;
}

.nav a {
    color: white;
    margin: 10px;
    text-decoration: none;
}

.nav a:hover {
    text-decoration: underline;
}
</style>

</head>
<body>

<h2>Booking Report</h2>

<table border="1">
<tr>
    <th>Booking ID</th>
    <th>Customer Name</th>
    <th>Room Type</th>
    <th>Date</th>
    <th>Action</th>
</tr>

<%
try {
    Connection con = DBConnection.getConnection();
    Statement stmt = con.createStatement();

    String query = "SELECT b.booking_id, b.room_id, c.name, r.room_type, b.check_in " +
                   "FROM bookings b " +
                   "JOIN customers c ON b.customer_id = c.customer_id " +
                   "JOIN rooms r ON b.room_id = r.room_id";

    ResultSet rs = stmt.executeQuery(query);

    while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("booking_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("room_type") %></td>
    <td>
        <%= (rs.getDate("check_in") != null) ? rs.getDate("check_in") : "Not Booked" %>
    </td>
    <td>
        <a href="CancelBookingServlet?booking_id=<%= rs.getInt("booking_id") %>&room_id=<%= rs.getInt("room_id") %>"
           onclick="return confirm('Are you sure to cancel booking?');">
           Cancel
        </a>
    </td>
</tr>

<%
    }
} catch(Exception e) {
%>
<tr>
    <td colspan="5" style="color:red;">ERROR: <%= e.getMessage() %></td>
</tr>
<%
}
%>

</table>

<div class="nav">
    <a href="index.jsp">Home</a>
    <a href="viewCustomers.jsp">Customers</a>
    <a href="viewRooms.jsp">Rooms</a>
    <a href="viewBookings.jsp">Bookings</a>
    <a href="index.jsp">Logout</a>
</div>

</body>
</html>
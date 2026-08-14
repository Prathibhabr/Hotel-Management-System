<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Customers</title>

<style>
body {
    font-family: Arial;
    background-color: #f4f6f8;
    text-align: center;
}

h2 {
    color: #333;
}

table {
    margin: auto;
    border-collapse: collapse;
    width: 80%;
    background: white;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
}

th {
    background-color: #4CAF50;
    color: white;
}

tr:hover {
    background-color: #f1f1f1;
}

a {
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 5px;
    color: white;
}

.edit {
    background-color: blue;
}

.delete {
    background-color: red;
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

<h2>Customer List</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Action</th>
</tr>

<%
try {
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM customers");

    while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("customer_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("phone") %></td>
    <td>
        <a class="edit" href="editCustomer.jsp?id=<%= rs.getInt("customer_id") %>">Edit</a>
        <a class="delete" href="DeleteCustomerServlet?id=<%= rs.getInt("customer_id") %>">Delete</a>
    </td>
</tr>

<%
    }
} catch(Exception e){
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
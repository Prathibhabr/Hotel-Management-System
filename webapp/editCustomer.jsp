<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
    text-align: center;
}

.container {
    width: 400px;
    margin: auto;
    margin-top: 50px;
    padding: 20px;
    background: white;
    box-shadow: 0px 0px 10px gray;
    border-radius: 10px;
}

input {
    width: 90%;
    padding: 8px;
    margin: 10px;
}

button {
    padding: 10px 20px;
    background: green;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background: darkgreen;
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

<div class="container">

<%
try {

    String idStr = request.getParameter("id");

    if(idStr != null) {

        int id = Integer.parseInt(idStr);

        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM customers WHERE customer_id=?"
        );
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
%>

<h2>Edit Customer</h2>

<form action="UpdateCustomerServlet" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("customer_id") %>">

    <input type="text" name="name" placeholder="Name"
           value="<%= rs.getString("name") %>" required>

    <input type="text" name="email" placeholder="Email"
           value="<%= rs.getString("email") %>" required>

    <input type="text" name="phone" placeholder="Phone"
           value="<%= rs.getString("phone") %>" required>

    <br>
    <button type="submit">Update Customer</button>
</form>

<%
        } else {
%>
<h3>No Data Found</h3>
<%
        }

    } else {
%>
<h3>Invalid Request</h3>
<%
    }

} catch(Exception e){
%>
<h3 style="color:red;">Error: <%= e.getMessage() %></h3>
<%
}
%>

</div>

<div class="nav">
    <a href="index.jsp">Home</a>
    <a href="viewCustomers.jsp">Customers</a>
    <a href="viewRooms.jsp">Rooms</a>
    <a href="viewBookings.jsp">Bookings</a>
    <a href="index.jsp">Logout</a>
</div>

</body>
</html>
<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>

<body>

<h2 style="text-align:center;">Admin Dashboard</h2>

<%
try {

    Connection con = DBConnection.getConnection();

    if(con == null){
        out.println("<h3 style='color:red;'>DB CONNECTION FAILED</h3>");
        return;
    }

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM checkin");

    int count = 0;
%>

<table border="1" style="margin:auto; text-align:center;">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Phone</th>
    <th>Checkin</th>
    <th>Checkout</th>
    <th>Action</th>
</tr>

<%
while(rs.next()){

    count++;

    Date in = rs.getDate("checkinDate");
    Date outd = rs.getDate("checkoutDate");
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("phone") %></td>

    <td><%= (in!=null ? in : "Not Set") %></td>
    <td><%= (outd!=null ? outd : "Not Set") %></td>

    <td>
        <a href="DeleteCustomerServlet?id=<%= rs.getInt("id") %>">Delete</a> |
        <a href="CheckoutServlet?id=<%= rs.getInt("id") %>">Checkout</a>
    </td>
</tr>

<%
}
%>

</table>

<h3 style="text-align:center;">Total Customers: <%= count %></h3>

<%
} catch(Exception e){
    out.println("<h3 style='color:red;'>ERROR: "+e.getMessage()+"</h3>");
}
%>

</body>
</html>
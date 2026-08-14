<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM checkin WHERE id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();

rs.next();
%>

<html>
<head>
<title>Edit Booking</title>
</head>

<body>

<h2>Edit Booking</h2>

<form action="updateBooking" method="post">

<input type="hidden" name="id" value="<%=id%>">

Name: <input type="text" name="name" value="<%=rs.getString("name")%>"><br><br>
Phone: <input type="text" name="phone" value="<%=rs.getString("phone")%>"><br><br>
Rooms: <input type="number" name="rooms" value="<%=rs.getInt("rooms")%>"><br><br>
Paid: <input type="number" name="paid" value="<%=rs.getDouble("paid")%>"><br><br>

<button type="submit">Update</button>

</form>

</body>
</html>
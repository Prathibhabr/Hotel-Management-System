<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>In-House Dashboard</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(to right, #f8cdda, #f5a6c0);
}

.header {
    text-align: center;
    padding: 20px;
    font-size: 32px;
    color: white;
    font-weight: bold;
}

.container {
    width: 90%;
    margin: 20px auto;
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

.cards {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
}

.card {
    flex: 1;
    padding: 20px;
    border-radius: 10px;
    color: white;
    text-align: center;
}

.card1 { background: #6a11cb; }
.card2 { background: #2575fc; }
.card3 { background: #ff4b8b; }

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
    border-bottom: 1px solid #ddd;
}

.btn {
    padding: 6px 10px;
    border: none;
    border-radius: 5px;
    color: white;
    cursor: pointer;
}

.delete { background: red; }
.checkout { background: green; }

.active { color: green; font-weight: bold; }
.inactive { color: red; font-weight: bold; }
</style>
</head>

<body>

<div class="header">In-House Dashboard</div>

<div class="container">

<%
int total = 0;
int active = 0;

try {
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM checkin");
%>

<!-- CARDS -->
<div class="cards">
    <div class="card card1">
        <h3>Total</h3>
        <h2 id="total">0</h2>
    </div>
    <div class="card card2">
        <h3>In Stay</h3>
        <h2 id="stay">0</h2>
    </div>
    <div class="card card3">
        <h3>Checked Out</h3>
        <h2 id="out">0</h2>
    </div>
</div>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Phone</th>
<th>Check-in</th>
<th>Check-out</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
while(rs.next()){
    total++;

    Date in = rs.getDate("checkinDate");
    Date outd = rs.getDate("checkoutDate");

    boolean isActive = (in != null && outd == null);
    if(isActive) active++;
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("phone")%></td>

<td><%= (in!=null)? in : "Not Set" %></td>
<td><%= (outd!=null)? outd : "Not Set" %></td>

<td>
<% if(isActive){ %>
<span class="active">In Stay</span>
<% } else { %>
<span class="inactive">Checked Out</span>
<% } %>
</td>

<td>
<a href="DeleteCustomerServlet?id=<%=rs.getInt("id")%>">
<button class="btn delete">Delete</button>
</a>

<a href="CheckoutServlet?id=<%=rs.getInt("id")%>">
<button class="btn checkout">Checkout</button>
</a>
</td>

</tr>

<%
}
%>

</table>

<script>
document.getElementById("total").innerText = "<%=total%>";
document.getElementById("stay").innerText = "<%=active%>";
document.getElementById("out").innerText = "<%= (total-active) %>";
</script>

<%
} catch(Exception e){
out.println("ERROR: "+e.getMessage());
}
%>

</div>

</body>
</html>
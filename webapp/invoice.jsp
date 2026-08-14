<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Invoice</title>

<style>
body {
    font-family: Arial;
    background: #f8cdda;
}

.box {
    width: 60%;
    margin: 50px auto;
    background: white;
    padding: 30px;
    border-radius: 15px;
    text-align: center;
}

.green { color: green; }
.red { color: red; }
</style>
</head>

<body>

<div class="box">

<h2>🧾 Booking Invoice</h2>

<p><b>Name:</b> <%=request.getParameter("name")%></p>
<p><b>Phone:</b> <%=request.getParameter("phone")%></p>
<p><b>Room:</b> <%=request.getParameter("roomType")%></p>
<p><b>Rooms:</b> <%=request.getParameter("rooms")%></p>
<p><b>Days:</b> <%=request.getParameter("days")%></p>

<hr>

<p><b>Total:</b> ₹<%=request.getParameter("total")%></p>
<p><b>Paid:</b> ₹<%=request.getParameter("paid")%></p>

<%
double pending = Double.parseDouble(request.getParameter("pending"));
if(pending <= 0){
%>
<p class="green">✔ Fully Paid</p>
<% } else { %>
<p class="red">❌ Pending: ₹<%=pending%></p>
<% } %>

</div>

</body>
</html>
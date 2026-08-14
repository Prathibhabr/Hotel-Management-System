<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Check-in Success</title>

<style>
body {
    font-family: Arial;
    background: #f8cdd1;
}

.box {
    width: 50%;
    margin: 50px auto;
    background: white;
    padding: 25px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0px 5px 15px rgba(0,0,0,0.3);
}

.green { color: green; font-weight: bold; }
.red { color: red; font-weight: bold; }

.btn {
    background: #ff4d94;
    padding: 10px 20px;
    color: white;
    border-radius: 8px;
    text-decoration: none;
}
</style>

</head>

<body>

<div class="box">

<h2>✔ Check-in Successful</h2>

<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String roomType = request.getParameter("roomType");
String rooms = request.getParameter("rooms");
String days = request.getParameter("days");
String total = request.getParameter("total");
String paid = request.getParameter("paid");
String pendingStr = request.getParameter("pending");
%>

<p><b>Name:</b> <%=name != null ? name : "N/A"%></p>
<p><b>Phone:</b> <%=phone != null ? phone : "N/A"%></p>

<hr>

<p><b>Room Type:</b> <%=roomType != null ? roomType : "N/A"%></p>
<p><b>No. of Rooms:</b> <%=rooms != null ? rooms : "0"%></p>
<p><b>No. of Days:</b> <%=days != null ? days : "0"%></p>

<hr>

<p><b>Total Amount:</b> ₹<%=total != null ? total : "0"%></p>
<p><b>Paid:</b> ₹<%=paid != null ? paid : "0"%></p>

<%
double pending = 0;

if (pendingStr != null && !pendingStr.isEmpty()) {
    pending = Double.parseDouble(pendingStr);
}

if(pending == 0){
%>
<p class="green">✔ Fully Paid</p>
<%
}else{
%>
<p class="red">⚠ Pending: ₹<%=pending%></p>
<%
}
%>

<br><br>

<a href="index.jsp" class="btn">🏠 Go Home</a>

</div>

</body>
</html>
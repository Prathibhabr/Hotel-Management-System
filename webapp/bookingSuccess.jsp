<!DOCTYPE html>
<html>
<head>
<style>
body { text-align:center; font-family:Arial; background:#f5a6c0; }
.box { margin-top:100px; background:#eee; padding:40px; border-radius:20px; display:inline-block; }
button { padding:10px; background:#ff4b8b; color:white; border:none; }
</style>
</head>

<body>

<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String room = request.getParameter("room");
String rooms = request.getParameter("rooms");
%>

<div class="box">
<h1>✔ Booking Successful</h1>

<p><b>Name:</b> <%=name%></p>
<p><b>Phone:</b> <%=phone%></p>

<p><b>Rooms Booked:</b></p>
<p><%=room%> - <%=rooms%> room(s)</p>

<br>
<a href="adminDashboard.jsp"><button>Go Home</button></a>
</div>

</body>
</html>
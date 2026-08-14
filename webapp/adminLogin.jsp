<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right,#f8cdda,#f5a6c0);
    text-align: center;
}

.box {
    width: 300px;
    margin: 100px auto;
    padding: 30px;
    background: white;
    border-radius: 10px;
}

input {
    width: 90%;
    padding: 10px;
    margin: 10px;
}

button {
    padding: 10px 20px;
    background: #ff4b8b;
    color: white;
    border: none;
    border-radius: 8px;
}

.error {
    color: red;
}
</style>
</head>

<body>

<div class="box">
<h2>Admin Login</h2>

<form action="AdminLoginServlet" method="post">

<input type="text" name="username" placeholder="Username" required>
<input type="password" name="password" placeholder="Password" required>

<button type="submit">Login</button>

</form>

<%
String error = request.getParameter("error");
if(error != null){
%>
<p class="error"><%=error%></p>
<%
}
%>

</div>

</body>
</html>
<%
    String error = "";
    if(request.getParameter("login") != null){
        String user = request.getParameter("username");

        if(user != null && !user.isEmpty()){
            session.setAttribute("role", "customer");
            response.sendRedirect("customerDashboard.jsp");
        } else {
            error = "Enter Username!";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2>Customer Login</h2>

<form method="post">
    <input type="text" name="username" placeholder="Enter Name" class="form-control mb-2" required>
    <button name="login" class="btn btn-success">Login</button>
</form>

<p style="color:red;"><%= error %></p>

</body>
</html>
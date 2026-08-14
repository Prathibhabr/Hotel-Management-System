<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("customer")){
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2>Customer Dashboard</h2>

<a href="availableRooms.jsp" class="btn btn-success">View Available Rooms</a>
<a href="inhouse.jsp" class="btn btn-warning">Book Room</a>

<a href="logout.jsp" class="btn btn-danger float-end">Logout</a>

</body>
</html>

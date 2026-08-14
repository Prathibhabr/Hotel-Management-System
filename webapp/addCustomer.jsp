<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
body {
    font-family: Arial;
    background-color: #f4f6f8;
    text-align: center;
}

form {
    background: white;
    padding: 20px;
    width: 300px;
    margin: auto;
    border-radius: 10px;
}

input {
    padding: 8px;
    width: 90%;
    margin: 5px;
}

input[type="submit"] {
    background-color: green;
    color: white;
    border: none;
}
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

input, select {
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
}

.nav a {
    color: white;
    margin: 10px;
    text-decoration: none;
}

.nav a:hover {
    text-decoration: underline;
}

.success {
    color: green;
    font-weight: bold;
}

.error {
    color: red;
    font-weight: bold;
}
</style>
</head>
<body>

<h2>Add Customer</h2>

<form action="addCustomer" method="post">
    Name: <input type="text" name="name"><br><br>
    Email: <input type="text" name="email"><br><br>
    Phone: <input type="text" name="phone"><br><br>
    <input type="text" name="phone" pattern="[0-9]{10}" required>
    <input type="submit" value="Add Customer">
   
</form>
<div class="nav">
    <a href="index.jsp">Home</a>
    <a href="viewCustomers.jsp">Customers</a>
    <a href="viewRooms.jsp">Rooms</a>
    <a href="viewBookings.jsp">Bookings</a>
    <a href="index.jsp">Logout</a>
</div>

</body>
</html>
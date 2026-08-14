<!DOCTYPE html>
<html>
<head>
<title>Add Room</title>

<style>
body { font-family: Arial; text-align: center; background: #f4f6f8; }
form { background: white; padding: 20px; width: 300px; margin: auto; border-radius: 10px; }
input { margin: 5px; padding: 8px; width: 90%; }
input[type="submit"] { background: green; color: white; border: none; }
</style>
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

<h2>Add Room</h2>

<form action="addRoom" method="post">
    Room Number: <input type="text" name="roomNumber"><br>
    Room Type: <input type="text" name="roomType"><br>
    Price: <input type="text" name="price"><br>

    <input type="submit" value="Add Room">
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
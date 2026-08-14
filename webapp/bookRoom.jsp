<h2>Book Room</h2>

<form action="bookRoom" method="post">
    Customer ID: <input type="text" name="customer_id"><br><br>

    Room ID: <input type="text" name="room_id"><br><br>

    <input type="submit" value="Book Room">

</form>
<style>
body {
    font-family: Arial;
    background: #f4f6f9;
    text-align: center;
    <div class="nav">
    <a href="index.jsp">Home</a>
    <a href="viewCustomers.jsp">Customers</a>
    <a href="viewRooms.jsp">Rooms</a>
    <a href="viewBookings.jsp">Bookings</a>
    <a href="index.jsp">Logout</a>
</div>
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
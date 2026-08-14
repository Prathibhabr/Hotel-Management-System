<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Available Rooms</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #e89cae, #f8cdda);
}

h1 {
    text-align: center;
    color: white;
    margin-top: 40px;
    font-weight: bold;
}

.container-box {
    display: flex;
    justify-content: center;
    gap: 40px;
    margin-top: 60px;
    flex-wrap: wrap;
}

.card-room {
    background: white;
    padding: 30px;
    width: 300px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
}

.price {
    font-size: 20px;
    color: #444;
}

.available {
    color: green;
    font-weight: bold;
}

.btn-book {
    background: #ff4d79;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 10px;
    margin-top: 15px;
}

.btn-book:hover {
    background: #e6005c;
}
</style>

</head>
<body>

<h1>🏨 Available Rooms</h1>

<div class="container-box">

    <!-- Single Room -->
    <div class="card-room">
        <h3>🛏 Single Room</h3>
        <p class="price">₹1500 / day</p>
        <p class="available">Available</p>
        <form action="inhouse.jsp">
            <button class="btn-book">Book Now</button>
        </form>
    </div>

    <!-- Double Room -->
    <div class="card-room">
        <h3>🛏 Double Room</h3>
        <p class="price">₹2500 / day</p>
        <p class="available">Available</p>
        <form action="inhouse.jsp">
            <button class="btn-book">Book Now</button>
        </form>
    </div>

    <!-- Deluxe Room -->
    <div class="card-room">
        <h3>🛏 Deluxe Room</h3>
        <p class="price">₹4000 / day</p>
        <p class="available">Available</p>
        <form action="inhouse.jsp">
            <button class="btn-book">Book Now</button>
        </form>
    </div>

</div>

</body>
</html>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(to right, #f8cdda, #f5a6c0);
    text-align: center;
}

.header {
    padding: 20px;
    font-size: 36px;
    font-weight: bold;
}

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 30px;
    margin-top: 30px;
}

/* CARD STYLE */
.card {
    width: 300px;
    background: #f1f1f1;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
    transition: 0.3s;
}

.card:hover {
    transform: scale(1.05);
}

.icon {
    font-size: 40px;
}

.title {
    font-size: 24px;
    font-weight: bold;
    margin-top: 10px;
}

.desc {
    margin: 10px 0;
    color: #444;
}

/* BUTTON */
.btn {
    margin-top: 15px;
    padding: 10px 25px;
    border: none;
    border-radius: 8px;
    background: #ff4b8b;
    color: white;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    background: #e8437c;
}

</style>
</head>

<body>

<div class="header">🛠 Admin Dashboard</div>

<div class="container">

    <!-- CHECK-IN -->
    <div class="card">
        <div class="icon">✅</div>
        <div class="title">Check-in</div>
        <div class="desc">Manage new customer check-ins</div>
        <a href="checkin.jsp">
            <button class="btn">Go</button>
        </a>
    </div>

    <!-- IN-HOUSE -->
    <div class="card">
        <div class="icon">🏨</div>
        <div class="title">In-House</div>
        <div class="desc">View currently occupied rooms</div>
        <a href="inhouse.jsp">
            <button class="btn">View</button>
        </a>
    </div>

    <!-- BOOKINGS -->
    <div class="card">
        <div class="icon">📋</div>
        <div class="title">Bookings</div>
        <div class="desc">See all bookings</div>
        <a href="bookings.jsp">
            <button class="btn">View</button>
        </a>
    </div>

    <!-- AVAILABLE ROOMS -->
    <div class="card">
        <div class="icon">🛏</div>
        <div class="title">Available Rooms</div>
        <div class="desc">Check room availability</div>
        <a href="availableRooms.jsp">
            <button class="btn">View</button>
        </a>
    </div>

</div>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(to bottom, #e6a4aa, #f8cdd1);
}

/* Title */
.title {
    text-align: center;
    margin-top: 30px;
    font-size: 32px;
    font-weight: bold;
}

/* Card Container */
.container {
    display: flex;
    justify-content: center;
    gap: 40px;
    margin-top: 40px;
}

/* Card */
.card {
    width: 280px;
    height: 200px;
    background: #f2f2f2;
    border-radius: 15px;
    text-align: center;
    padding: 20px;
    box-shadow: 0px 6px 18px rgba(0,0,0,0.3);
}

/* Bottom Center Card */
.center-card {
    display: flex;
    justify-content: center;
    margin-top: 40px;
}

/* Icons */
.icon {
    font-size: 28px;
    margin-bottom: 10px;
}

/* Text */
.card h2 {
    margin: 10px 0;
}

.card p {
    color: #444;
}

/* Buttons */
.btn {
    margin-top: 15px;
    background: #ff4d94;
    color: white;
    border: none;
    padding: 8px 18px;
    border-radius: 8px;
    cursor: pointer;
}

</style>

</head>

<body>

<h1 class="title">🛠️ Admin Dashboard</h1>

<!-- TOP ROW -->
<div class="container">

<div class="card">
<div class="icon">✅</div>
<h2>Check-in</h2>
<p>Manage new customer check-ins</p>
<a href="checkin.jsp"><button class="btn">Go</button></a>
</div>

<div class="card">
<div class="icon">🏨</div>
<h2>In-House</h2>
<p>View currently occupied rooms</p>
<a href="inhouse.jsp"><button class="btn">View</button></a>
</div>

<div class="card">
<div class="icon">📋</div>
<h2>Bookings</h2>
<p>See all bookings</p>
<a href="viewBookings.jsp"><button class="btn">View</button></a>
</div>

</div>

<!-- BOTTOM CENTER CARD -->
<div class="center-card">
<div class="card">
<div class="icon">🛏️</div>
<h2>Available Rooms</h2>
<p>Check room availability</p>
<a href="viewRooms.jsp"><button class="btn">View</button></a>
</div>
</div>

</body>
</html>
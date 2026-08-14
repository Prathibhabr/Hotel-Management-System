<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Hotel Booking System</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(rgba(255,182,193,0.8), rgba(255,192,203,0.8)),
                url('https://images.unsplash.com/photo-1566073771259-6a8506099945');
    background-size: cover;
    background-position: center;
    text-align: center;
}

/* HEADER */
.header {
    padding: 40px;
    color: white;
    font-size: 32px;
    font-weight: bold;
}

/* CONTAINER */
.container {
    display: flex;
    justify-content: center;
    gap: 40px;
    margin-top: 50px;
    flex-wrap: wrap;
}

/* CARD */
.card {
    width: 300px;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    transition: 0.3s;
}

/* HOVER EFFECT */
.card:hover {
    transform: scale(1.05);
}

/* BUTTON */
.btn {
    display: inline-block;
    margin-top: 15px;
    padding: 12px 25px;
    background: #ff4081;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

.btn:hover {
    background: #e73370;
}
</style>

</head>

<body>

<div class="header">
🏨 Hotel Booking System
</div>

<div class="container">

<!-- CUSTOMER PANEL -->
<div class="card">
<h2>👤 Customer Panel</h2>
<p>Book rooms and manage your stay</p>
<a href="customerHome.jsp" class="btn">Enter Customer Dashboard</a>
</div>

<!-- ADMIN PANEL -->
<div class="card">
<h2>🛠️ Admin Panel</h2>
<p>Manage bookings, rooms and customers</p>
<a href="adminLogin.jsp" class="btn">Enter Admin Dashboard</a>
</div>

</div>

</body>
</html>
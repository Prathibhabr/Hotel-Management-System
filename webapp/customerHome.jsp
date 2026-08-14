<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Customer Home</title>

<style>

/* Background */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f8cdd1;
}

/* Title */
.title {
    text-align: center;
    margin: 20px;
}

/* Room Cards */
.container {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin: 30px;
}

.card {
    width: 260px;
    background: #f4f4f4;
    border-radius: 15px;
    padding: 15px;
    text-align: center;
    box-shadow: 0px 6px 15px rgba(0,0,0,0.3);
}

.card img {
    width: 100%;
    height: 180px;
    border-radius: 12px;
}

.card h3 {
    margin: 10px;
}

.price {
    font-size: 18px;
}

.btn-green {
    background: green;
    color: white;
    padding: 8px 15px;
    border-radius: 6px;
    border: none;
}

/* Booking Form */
.form-box {
    width: 80%;
    margin: 40px auto;
    background: #f4f4f4;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0px 6px 15px rgba(0,0,0,0.3);
}

.row {
    display: flex;
    gap: 20px;
}

input, select {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
}

.btn-main {
    background: #ff4081;
    color: white;
    padding: 10px 20px;
    border-radius: 8px;
    border: none;
    display: block;
    margin: 20px auto;
}

.add-btn {
    background: #ff99bb;
    border: none;
    padding: 8px 15px;
    border-radius: 6px;
}

</style>

<script>

// Phone validation
function validatePhone(input) {
    input.value = input.value.replace(/[^0-9]/g, '');
    if (input.value.length > 10) {
        input.value = input.value.slice(0, 10);
    }
}

// Auto days
function calculateDays() {
    let checkin = document.getElementById("checkin").value;
    let checkout = document.getElementById("checkout").value;

    if (checkin && checkout) {
        let inDate = new Date(checkin);
        let outDate = new Date(checkout);

        let diff = (outDate - inDate) / (1000 * 60 * 60 * 24);

        if (diff > 0) {
            document.getElementById("days").value = diff;
        } else {
            alert("Check-out must be after Check-in");
            document.getElementById("days").value = "";
        }
    }
}

// Add more rooms
function addRoom() {
    let container = document.getElementById("rooms");

    container.innerHTML += `
    <div class="row">
        <select name="roomType">
            <option value="Single">Single - ₹1500</option>
            <option value="Double">Double - ₹3000</option>
            <option value="Deluxe">Deluxe - ₹5000</option>
        </select>
        <input type="number" name="rooms" placeholder="No. of Rooms">
    </div>`;
}

</script>

</head>

<body>

<!-- ROOM TYPES -->
<h2 class="title">🛏️ Room Types</h2>

<div class="container">

<div class="card">
<img src="https://images.unsplash.com/photo-1505691938895-1758d7feb511">
<h3>Single Room</h3>
<p class="price">💰 ₹1500</p>
<p>✔ Available</p>
</div>

<div class="card">
<img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2">
<h3>Double Room</h3>
<p class="price">💰 ₹3000</p>
<p>✔ Available</p>
</div>

<div class="card">
<img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b">
<h3>Deluxe Room</h3>
<p class="price">💰 ₹5000</p>
<p>✔ Available</p>
</div>

</div>

<!-- BOOKING FORM -->
<div class="form-box">

<h2 style="text-align:center;">📋 Book Your Room</h2>

<form action="bookRoom" method="post">

<div class="row">
<input type="text" name="name" placeholder="Enter Name" required>

<input type="text" name="phone" placeholder="Enter Phone"
oninput="validatePhone(this)" maxlength="10" required>
</div>

<div class="row">
<div style="width:100%;">
<label>Check-in Date</label>
<input type="date" id="checkin" name="checkin" onchange="calculateDays()" required>
</div>

<div style="width:100%;">
<label>Check-out Date</label>
<input type="date" id="checkout" name="checkout" onchange="calculateDays()" required>
</div>
</div>

<div class="row">
<input type="number" id="days" name="days" placeholder="No. of Days" readonly>

<input type="number" name="guests" placeholder="No. of Guests" required>
</div>

<div id="rooms">
<div class="row">
<select name="roomType">
<option value="Single">Single - ₹1500</option>
<option value="Double">Double - ₹3000</option>
<option value="Deluxe">Deluxe - ₹5000</option>
</select>

<input type="number" name="rooms" placeholder="No. of Rooms">
</div>
</div>

<button type="button" class="add-btn" onclick="addRoom()">+ Add More Rooms</button>

<button type="submit" class="btn-main">✔ Book Now</button>

</form>

</div>

</body>
</html>
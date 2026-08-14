<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Customer Check-in</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right,#f8cdda,#f5a6c0);
}

.box {
    width: 70%;
    margin: 40px auto;
    background: #eee;
    padding: 30px;
    border-radius: 20px;
}

input, select {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 8px;
}

.green { color: green; font-weight: bold; }
.red { color: red; font-weight: bold; }

.btn {
    background: #ff4b8b;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
}

.btn:hover {
    background: #e8437c;
}
</style>

<script>
function calculateDays(){
    let inDate = new Date(document.getElementById("checkin").value);
    let outDate = new Date(document.getElementById("checkout").value);

    if(inDate && outDate){
        let days = (outDate - inDate)/(1000*60*60*24);
        if(days > 0){
            document.getElementById("days").value = days;
            calculateTotal();
        }
    }
}

function calculateTotal(){
    let room = document.getElementById("roomType").value;
    let rooms = document.getElementById("rooms").value;
    let days = document.getElementById("days").value;

    if(room && rooms && days){
        let price = room.split("-")[1];
        let total = price * rooms * days;
        document.getElementById("total").value = total;
        calculatePending();
    }
}

function calculatePending(){
    let total = document.getElementById("total").value;
    let paid = document.getElementById("paid").value;

    if(total && paid){
        let pending = total - paid;
        document.getElementById("pending").value = pending;

        let status = document.getElementById("status");

        if(pending <= 0){
            status.innerHTML = "✔ Fully Paid";
            status.className = "green";
        } else {
            status.innerHTML = "❌ Pending Amount";
            status.className = "red";
        }
    }
}
</script>

</head>
<body>

<div class="box">
<h2>✔ Customer Check-in</h2>

<!-- ✅ FIXED FORM ACTION -->
<form action="<%=request.getContextPath()%>/checkinServlet" method="post">

<input type="text" name="name" placeholder="Customer Name" required>

<input type="text" name="phone" placeholder="Phone" pattern="[0-9]{10}" required>

<label>Check-in</label>
<input type="date" name="checkin" id="checkin" onchange="calculateDays()" required>

<label>Check-out</label>
<input type="date" name="checkout" id="checkout" onchange="calculateDays()" required>

<input type="number" name="days" id="days" placeholder="Days" readonly>

<select name="roomType" id="roomType" onchange="calculateTotal()" required>
    <option value="">Select Room</option>
    <option value="Single-1500">Single - ₹1500</option>
    <option value="Double-3000">Double - ₹3000</option>
    <option value="Deluxe-5000">Deluxe - ₹5000</option>
</select>

<input type="number" name="rooms" id="rooms" placeholder="Rooms" onchange="calculateTotal()" required>

<input type="number" name="total" id="total" placeholder="Total" readonly>

<input type="number" name="paid" id="paid" placeholder="Amount Paid" oninput="calculatePending()" required>

<input type="number" name="pending" id="pending" placeholder="Pending" readonly>

<p id="status"></p>

<br>
<center>
<button class="btn">✔ Check-in</button>
</center>

</form>
</div>

</body>
</html>
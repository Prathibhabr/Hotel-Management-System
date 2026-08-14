<%@ page import="java.util.*" %>
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
    background: linear-gradient(to right, #ff9a9e, #fad0c4);
    font-family: Arial;
}

h1 {
    text-align: center;
    color: white;
    margin-top: 30px;
}

.container-box {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin-top: 50px;
    flex-wrap: wrap;
}

.card-room {
    background: white;
    width: 300px;
    padding: 25px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
    transition: 0.3s;
}

.card-room:hover {
    transform: scale(1.05);
}

.price {
    font-size: 20px;
    color: #444;
}

.available {
    color: green;
    font-weight: bold;
}

.not-available {
    color: red;
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

.btn-book:disabled {
    background: grey;
}

.info {
    font-size: 14px;
    color: #555;
}
</style>

</head>
<body>

<h1>🏨 Available Rooms</h1>

<div class="container-box">

<%
    // 🔥 SAMPLE ROOM DATA (Replace with DB later)

    class Room {
        String type;
        int price;
        int total;
        int booked;

        Room(String type, int price, int total, int booked) {
            this.type = type;
            this.price = price;
            this.total = total;
            this.booked = booked;
        }

        int available() {
            return total - booked;
        }
    }

    List<Room> rooms = new ArrayList<>();

    rooms.add(new Room("Single Room", 1500, 10, 6));
    rooms.add(new Room("Double Room", 2500, 8, 8));
    rooms.add(new Room("Deluxe Room", 4000, 5, 2));

    for(Room r : rooms){
%>

    <div class="card-room">
        <h3>🛏 <%= r.type %></h3>
        <p class="price">₹<%= r.price %> / day</p>

        <p class="info">Total Rooms: <%= r.total %></p>
        <p class="info">Booked Rooms: <%= r.booked %></p>

        <% if(r.available() > 0){ %>
            <p class="available">Available: <%= r.available() %></p>
            <form action="inhouse.jsp">
                <button class="btn-book">Book Now</button>
            </form>
        <% } else { %>
            <p class="not-available">Not Available</p>
            <button class="btn-book" disabled>Fully Booked</button>
        <% } %>
    </div>

<%
    }
%>

</div>

</body>
</html>
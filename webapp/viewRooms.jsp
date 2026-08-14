<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Rooms</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #667eea, #764ba2);
    font-family: Arial;
}

.header {
    text-align: center;
    color: white;
    margin-top: 30px;
}

.card-box {
    margin: 40px auto;
    width: 90%;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
}

.table th {
    background-color: #343a40;
    color: white;
}

.available {
    color: green;
    font-weight: bold;
}

.full {
    color: red;
    font-weight: bold;
}
</style>

</head>
<body>

<div class="header">
    <h1>🏨 Room Details & Availability</h1>
</div>

<div class="card-box">

    <table class="table table-bordered text-center">
        <thead>
            <tr>
                <th>Room ID</th>
                <th>Room Type</th>
                <th>Price</th>
                <th>Total Rooms</th>
                <th>Booked</th>
                <th>Available</th>
                <th>Status</th>
            </tr>
        </thead>

        <tbody>

        <%
            class Room {
                int id;
                String type;
                int price, total, booked;

                Room(int id, String type, int price, int total, int booked) {
                    this.id = id;
                    this.type = type;
                    this.price = price;
                    this.total = total;
                    this.booked = booked;
                }

                int available() {
                    return total - booked;
                }
            }

            List<Room> list = new ArrayList<>();

            list.add(new Room(1,"Single",1500,10,6));
            list.add(new Room(2,"Double",2500,8,8));
            list.add(new Room(3,"Deluxe",4000,5,2));

            for(Room r : list){
        %>

        <tr>
            <td><%= r.id %></td>
            <td><%= r.type %></td>
            <td>₹<%= r.price %></td>
            <td><%= r.total %></td>
            <td><%= r.booked %></td>
            <td><%= r.available() %></td>

            <td>
                <% if(r.available() > 0){ %>
                    <span class="available">Available</span>
                <% } else { %>
                    <span class="full">Full</span>
                <% } %>
            </td>
        </tr>

        <%
            }
        %>

        </tbody>
    </table>

</div>

</body>
</html>
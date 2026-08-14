<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Bookings</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #ff9a9e, #fad0c4);
}

.header {
    text-align: center;
    margin-top: 30px;
    color: white;
}

.card-box {
    margin: 40px auto;
    width: 95%;
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
}

.table th {
    background-color: #212529;
    color: white;
}

.badge-status {
    font-size: 14px;
}
</style>

</head>
<body>

<div class="header">
    <h1>📋 Booking List</h1>
</div>

<div class="card-box">

    <table class="table table-bordered table-striped text-center">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Check-In</th>
                <th>Check-Out</th>
                <th>Room Type</th>
                <th>Rooms</th>
                <th>Amount</th>
                <th>Status</th>
            </tr>
        </thead>

        <tbody>

        <%
            // 🔥 TEMPORARY DATA (Replace with DB later)

            class Booking {
                int id;
                String name, phone, checkin, checkout, room;
                int rooms, amount;
                String status;

                Booking(int id, String name, String phone, String checkin, String checkout, String room, int rooms, int amount, String status) {
                    this.id = id;
                    this.name = name;
                    this.phone = phone;
                    this.checkin = checkin;
                    this.checkout = checkout;
                    this.room = room;
                    this.rooms = rooms;
                    this.amount = amount;
                    this.status = status;
                }
            }

            List<Booking> bookings = new ArrayList<>();

            bookings.add(new Booking(1,"Priya","9876543210","2026-03-29","2026-03-31","Deluxe",2,5000,"Checked-In"));
            bookings.add(new Booking(2,"Rahul","9123456780","2026-04-01","2026-04-03","Single",1,1500,"Pending"));
            bookings.add(new Booking(3,"Anjali","9988776655","2026-04-02","2026-04-05","Double",2,4000,"Checked-In"));

            for(Booking b : bookings){
        %>

            <tr>
                <td><%= b.id %></td>
                <td><%= b.name %></td>
                <td><%= b.phone %></td>
                <td><%= b.checkin %></td>
                <td><%= b.checkout %></td>
                <td><%= b.room %></td>
                <td><%= b.rooms %></td>
                <td>₹<%= b.amount %></td>
                <td>
                    <% if(b.status.equals("Checked-In")){ %>
                        <span class="badge bg-success badge-status">Checked-In</span>
                    <% } else { %>
                        <span class="badge bg-warning text-dark badge-status">Pending</span>
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
package com.servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AddBookingServlet")   // 🔥 REQUIRED
public class AddBookingServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String name = request.getParameter("name");
String phone = request.getParameter("phone");
String checkin = request.getParameter("checkin");
String checkout = request.getParameter("checkout");
String roomType = request.getParameter("roomType");
int rooms = Integer.parseInt(request.getParameter("rooms"));
int amount = Integer.parseInt(request.getParameter("amount"));

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/hotel","root","password");

PreparedStatement ps = con.prepareStatement(
"INSERT INTO bookings(name,phone,checkin,checkout,room_type,rooms,amount) VALUES(?,?,?,?,?,?,?)");

ps.setString(1,name);
ps.setString(2,phone);
ps.setDate(3,Date.valueOf(checkin));
ps.setDate(4,Date.valueOf(checkout));
ps.setString(5,roomType);
ps.setInt(6,rooms);
ps.setInt(7,amount);

ps.executeUpdate();
con.close();

response.sendRedirect("InHouseServlet");

}catch(Exception e){ e.printStackTrace(); }

}
}
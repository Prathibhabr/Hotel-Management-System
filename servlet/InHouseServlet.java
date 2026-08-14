package com.servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.*;

@WebServlet("/InHouseServlet")   // 🔥 THIS FIXES 404 ERROR
public class InHouseServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

List<Map<String,String>> list = new ArrayList<>();

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/hotel","root","password");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM bookings");

while(rs.next()){
Map<String,String> row = new HashMap<>();

row.put("name", rs.getString("name"));
row.put("phone", rs.getString("phone"));
row.put("checkin", rs.getString("checkin"));
row.put("checkout", rs.getString("checkout"));
row.put("roomType", rs.getString("room_type"));
row.put("rooms", rs.getString("rooms"));
row.put("amount", rs.getString("amount"));

list.add(row);
}

request.setAttribute("bookings", list);
RequestDispatcher rd = request.getRequestDispatcher("inhouse.jsp");
rd.forward(request, response);

}catch(Exception e){ e.printStackTrace(); }

}
}
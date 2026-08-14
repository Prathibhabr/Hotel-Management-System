package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/checkinServlet1")
public class CheckinServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try {

String name = request.getParameter("name");
String phone = request.getParameter("phone");

String roomData = request.getParameter("roomType");
String[] parts = roomData.split("-");
String roomType = parts[0];
double price = Double.parseDouble(parts[1]);

int rooms = Integer.parseInt(request.getParameter("rooms"));
double paid = Double.parseDouble(request.getParameter("paid"));

LocalDate in = LocalDate.parse(request.getParameter("checkin"));
LocalDate out = LocalDate.parse(request.getParameter("checkout"));

int days = (int)(out.toEpochDay() - in.toEpochDay());

double total = price * rooms * days;
double pending = total - paid;

Connection con = DBConnection.getConnection();

if(con == null){
response.getWriter().println("DB NOT CONNECTED ❌");
return;
}

PreparedStatement ps = con.prepareStatement(
"INSERT INTO checkin(name,phone,roomType,rooms,days,total,paid,pending,checkinDate,checkoutDate) VALUES(?,?,?,?,?,?,?,?,?,?)"
);

ps.setString(1,name);
ps.setString(2,phone);
ps.setString(3,roomType);
ps.setInt(4,rooms);
ps.setInt(5,days);
ps.setDouble(6,total);
ps.setDouble(7,paid);
ps.setDouble(8,pending);
ps.setDate(9, java.sql.Date.valueOf(in));
ps.setDate(10, java.sql.Date.valueOf(out));

ps.executeUpdate();

// ✅ redirect to success page
response.sendRedirect("bookingSuccess.jsp?name="+name+"&phone="+phone+"&room="+roomType+"&rooms="+rooms);

} catch(Exception e){
e.printStackTrace();
response.getWriter().println("ERROR: "+e.getMessage());
}
}
}
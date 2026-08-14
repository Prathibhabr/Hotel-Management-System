package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try {

int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE checkin SET checkoutDate=? WHERE id=?"
);

ps.setDate(1, new java.sql.Date(System.currentTimeMillis()));
ps.setInt(2,id);

ps.executeUpdate();

response.sendRedirect("inhouse.jsp");

} catch(Exception e){
e.printStackTrace();
}
}
}
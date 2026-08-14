package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/updateBooking")
public class UpdateBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            int rooms = Integer.parseInt(request.getParameter("rooms"));
            double paid = Double.parseDouble(request.getParameter("paid"));

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE checkin SET name=?, phone=?, rooms=?, paid=? WHERE id=?"
            );

            ps.setString(1,name);
            ps.setString(2,phone);
            ps.setInt(3,rooms);
            ps.setDouble(4,paid);
            ps.setInt(5,id);

            ps.executeUpdate();

            response.sendRedirect("bookings.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}

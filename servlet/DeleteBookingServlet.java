package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("DELETE FROM checkin WHERE id=?");
            ps.setInt(1,id);

            ps.executeUpdate();

            response.sendRedirect("bookings.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}

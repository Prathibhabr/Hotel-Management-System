package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.servlet.DBConnection;  // ✅ FIXED

@WebServlet("/CancelBookingServlet")  // ✅ Consistent naming
public class CancelBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ✅ Get parameters safely
            int bookingId = Integer.parseInt(request.getParameter("booking_id"));
            int roomId = Integer.parseInt(request.getParameter("room_id"));

            Connection con = DBConnection.getConnection();

            // ✅ 1. Delete booking
            String deleteQuery = "DELETE FROM bookings WHERE booking_id=?";
            PreparedStatement ps1 = con.prepareStatement(deleteQuery);
            ps1.setInt(1, bookingId);
            ps1.executeUpdate();

            // ✅ 2. Update room → Available
            String updateQuery = "UPDATE rooms SET status='Available' WHERE room_id=?";
            PreparedStatement ps2 = con.prepareStatement(updateQuery);
            ps2.setInt(1, roomId);
            ps2.executeUpdate();

            // ✅ Redirect
            response.sendRedirect("viewBookings.jsp?msg=cancelled");

        } catch (NumberFormatException e) {
            response.getWriter().println("<h3>Invalid booking or room ID!</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error cancelling booking!</h3>");
        }
    }
}
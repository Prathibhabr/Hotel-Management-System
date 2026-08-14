package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.servlet.DBConnection;  // ✅ FIXED

@WebServlet("/AddRoomServlet")   // ✅ Better consistent naming
public class AddRoomServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Get parameters
        String type = request.getParameter("room_type");
        String priceStr = request.getParameter("price");

        // ✅ Validation
        if (type == null || type.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty()) {

            response.getWriter().println("<h3>All fields are required!</h3>");
            return;
        }

        // ✅ Convert price safely
        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (Exception e) {
            response.getWriter().println("<h3>Invalid price!</h3>");
            return;
        }

        try {
            // ✅ DB connection
            Connection con = DBConnection.getConnection();

            // ✅ Insert query
            String query = "INSERT INTO rooms(room_type, price, status) VALUES (?, ?, 'Available')";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, type);
            ps.setDouble(2, price);

            int i = ps.executeUpdate();

            if (i > 0) {
                // ✅ Redirect after success
                response.sendRedirect("viewRooms.jsp");
            } else {
                response.getWriter().println("<h3>Failed to add room!</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Database Error!</h3>");
        }
    }
}
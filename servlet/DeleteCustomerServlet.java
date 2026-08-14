package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.servlet.DBConnection;   // ✅ FIXED

@WebServlet("/DeleteCustomerServlet")   // ✅ ADDED
public class DeleteCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idStr = request.getParameter("id");

            if (idStr == null || idStr.isEmpty()) {
                response.getWriter().println("Invalid ID!");
                return;
            }

            int id = Integer.parseInt(idStr);

            Connection con = DBConnection.getConnection();

            // ⚠️ IMPORTANT: change table if needed
            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM customers WHERE id=?"
            );

            ps.setInt(1, id);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.getWriter().println("Delete failed!");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid ID format!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting customer!");
        }
    }
}
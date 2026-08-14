package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.servlet.DBConnection;   // ✅ FIXED

@WebServlet("/UpdateCustomerServlet")   // ✅ Consistent naming
public class UpdateCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idStr = request.getParameter("id");

            if (idStr == null || idStr.isEmpty()) {
                response.getWriter().println("Invalid ID!");
                return;
            }

            int id = Integer.parseInt(idStr);

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            Connection con = DBConnection.getConnection();

            String query = "UPDATE customers SET name=?, email=?, phone=? WHERE customer_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, id);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("viewCustomers.jsp");
            } else {
                response.getWriter().println("Update failed!");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid ID format!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating customer!");
        }
    }
}
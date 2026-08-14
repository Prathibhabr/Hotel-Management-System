package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO customers(name, phone) VALUES (?, ?)");

            ps.setString(1, name);
            ps.setString(2, phone);

            ps.executeUpdate();

            response.sendRedirect("customerDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
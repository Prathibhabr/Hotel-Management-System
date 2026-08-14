package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // ✅ LOGIN CHECK
        if ("admin".equals(username) && "admin123".equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", username);

            // ✅ FINAL FIX (IMPORTANT)
            response.sendRedirect("adminDashboard.jsp");

        } else {
            response.sendRedirect("adminLogin.jsp?error=Invalid Username or Password");
        }
    }
}
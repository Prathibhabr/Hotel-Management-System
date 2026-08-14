package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.servlet.DBConnection;   // ✅ FIXED

@WebServlet("/testdb")      // ✅ Updated mapping
public class TestDBServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();

            if (con != null && !con.isClosed()) {
                out.println("<h1>Database Connected Successfully ✅</h1>");
            } else {
                out.println("<h1>Connection Failed ❌</h1>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }
}
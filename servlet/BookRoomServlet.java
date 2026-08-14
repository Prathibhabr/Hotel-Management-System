package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/bookRoom")
public class BookRoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        String[] roomTypes = request.getParameterValues("roomType");
        String[] rooms = request.getParameterValues("rooms");

        out.println("<html><head><title>Booking Success</title>");

        out.println("<style>");
        out.println("body { font-family: Arial; background: #ffc0cb; text-align:center; }");
        out.println(".card { background:white; width:60%; margin:50px auto; padding:30px; border-radius:15px; box-shadow:0px 6px 15px rgba(0,0,0,0.3);} ");
        out.println(".tick { font-size:60px; color:green; }");
        out.println(".btn { background:#ff4081; color:white; padding:10px 20px; border:none; border-radius:8px; text-decoration:none; display:inline-block; margin-top:20px; }");
        out.println("</style>");

        out.println("</head><body>");

        out.println("<div class='card'>");

        // ✅ FIXED TICK (no more ?)
        out.println("<div class='tick'>&#10004;</div>");

        out.println("<h2>Booking Successful</h2>");
        out.println("<p><b>Name:</b> " + name + "</p>");
        out.println("<p><b>Phone:</b> " + phone + "</p>");

        out.println("<h3>Rooms Booked:</h3>");

        for(int i=0; i<roomTypes.length; i++) {
            out.println("<p>" + roomTypes[i] + " - " + rooms[i] + " room(s)</p>");
        }

        out.println("<a href='index.jsp' class='btn'>Go Home</a>");

        out.println("</div>");
        out.println("</body></html>");
    }
}

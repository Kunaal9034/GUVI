package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/supportRequest")
public class SupportServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        try {
            // Filhaal: console me log karo (later you can insert into DB or send email)
            System.out.println("SUPPORT REQUEST -----");
            System.out.println("From : " + name + " <" + email + ">");
            System.out.println("Subject : " + subject);
            System.out.println("Message : " + message);
            System.out.println("----------------------");

            // success
            resp.sendRedirect("support.jsp?status=ok");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("support.jsp?status=error");
        }
    }
}
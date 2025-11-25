package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println("Login attempt: " + email + " / " + password);

        UserDAO dao = new UserDAO();
        User user = dao.login(email, password);

        System.out.println("User from DAO = " + user);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);

            if ("ADMIN".equals(user.getRole())) {
                resp.sendRedirect("admin_dashboard.jsp");
            } else {
                resp.sendRedirect("user_dashboard.jsp");
            }
        } else {
            resp.sendRedirect("index.jsp?error=1");
        }
    }
}
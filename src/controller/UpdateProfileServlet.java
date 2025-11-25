package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String ageStr = req.getParameter("age");
        String gender = req.getParameter("gender");
        String role = req.getParameter("role"); // read-only in UI
        String newPassword = req.getParameter("password");

        int age = 0;
        try {
            if (ageStr != null && !ageStr.trim().isEmpty()) {
                age = Integer.parseInt(ageStr.trim());
            }
        } catch (NumberFormatException ignored) {}

        // current user from session
        HttpSession session = req.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (sessionUser == null || sessionUser.getId() != id) {
            resp.sendRedirect("index.jsp");
            return;
        }

        // Keep existing password if newPassword is blank
        String finalPassword = (newPassword == null || newPassword.isEmpty())
                ? sessionUser.getPassword()
                : newPassword;

        User updated = new User();
        updated.setId(id);
        updated.setName(name);
        updated.setEmail(email);
        updated.setPassword(finalPassword);
        updated.setRole(role);
        updated.setAge(age);
        updated.setGender(gender);

        UserDAO dao = new UserDAO();
        boolean ok = dao.updateProfile(updated);

        if (ok) {
            // refresh session user
            session.setAttribute("currentUser", updated);
            resp.sendRedirect("profile.jsp?status=ok");
        } else {
            resp.sendRedirect("profile.jsp?status=error");
        }
    }
}
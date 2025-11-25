package controller;

import dao.DoctorDAO;
import model.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/addDoctor")
public class AdminAddDoctorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String specialization = req.getParameter("specialization");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        Doctor d = new Doctor(name, specialization, email, phone);
        DoctorDAO dao = new DoctorDAO();
        boolean status = dao.addDoctor(d);

        if (status) {
            resp.sendRedirect("admin_dashboard.jsp?msg=doctor_added");
        } else {
            resp.sendRedirect("admin_dashboard.jsp?error=1");
        }
    }
}
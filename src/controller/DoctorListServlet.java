package controller;

import dao.DoctorDAO;
import model.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/doctors")
public class DoctorListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        DoctorDAO dao = new DoctorDAO();
        List<Doctor> list = dao.getAllDoctors();

        req.setAttribute("doctors", list);
        req.getRequestDispatcher("doctor_list.jsp").forward(req, resp);
    }
}
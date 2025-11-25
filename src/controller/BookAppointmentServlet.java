package controller;

import dao.AppointmentDAO;
import model.Appointment;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("currentUser");
        if (user == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        int doctorId = Integer.parseInt(req.getParameter("doctorId"));
        Date date = Date.valueOf(req.getParameter("appointmentDate"));
        String symptoms = req.getParameter("symptoms");

        Appointment a = new Appointment(user.getId(), doctorId, date, symptoms);
        AppointmentDAO dao = new AppointmentDAO();
        boolean status = dao.bookAppointment(a);

        if (status) {
            resp.sendRedirect("user_dashboard.jsp?msg=booked");
        } else {
            resp.sendRedirect("book_appointment.jsp?error=1");
        }
    }
}
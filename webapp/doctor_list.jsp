<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Doctor" %>
<%
    List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Available Doctors</title>
    <style>
        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background:#e5e7eb;
            margin:0;
            padding:2rem;
        }
        .box {
            background:#ffffff;
            border-radius:18px;
            max-width:900px;
            margin:0 auto;
            padding:1.8rem 2rem;
            box-shadow:0 18px 35px rgba(148,163,184,0.55);
        }
        table { width:100%; border-collapse:collapse; margin-top:1rem; }
        th,td { padding:0.6rem 0.75rem; border-bottom:1px solid #e5e7eb; font-size:0.9rem; }
        th { background:#f9fafb; }
        .btn-back{
            display:inline-block;margin-top:1rem;padding:0.5rem 1rem;border-radius:999px;
            border:none;background:#111827;color:#fff;text-decoration:none;font-size:0.88rem;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Available Doctors</h2>

    <%
        if (doctors == null || doctors.isEmpty()) {
    %>
    <p>No doctors available.</p>
    <% } else { %>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Specialization</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody>
        <% for (Doctor d : doctors) { %>
        <tr>
            <td><%= d.getId() %></td>
            <td><%= d.getName() %></td>
            <td><%= d.getSpecialization() %></td>
            <td><%= d.getEmail() %></td>
            <td><%= d.getPhone() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } %>

    <a href="book_appointment.jsp" class="btn-back">Back to booking</a>
</div>
</body>
</html>
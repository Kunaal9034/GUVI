<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User u = (User) session.getAttribute("currentUser");
    if (u == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment - Online Health Consultation</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background: radial-gradient(circle at top left, #6366f1, #0ea5e9);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: #ffffff;
            padding: 2.1rem 2.4rem;
            border-radius: 22px;
            box-shadow: 0 22px 40px rgba(15, 23, 42, 0.6);
            width: 480px;
            max-width: 95vw;
        }
        h2 { margin: 0 0 0.3rem; font-size: 1.35rem; }
        .subtitle { font-size: 0.9rem; color: #6b7280; margin-bottom: 1.4rem; }
        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 0.35rem;
            color: #374151;
        }
        input[type="number"], input[type="date"], input[type="text"] {
            width: 100%;
            padding: 0.7rem 0.8rem;
            border-radius: 10px;
            border: 1px solid #d1d5db;
            font-size: 0.95rem;
            outline: none;
        }
        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(129, 140, 248, 0.35);
        }
        .field { margin-bottom: 1rem; }

        .btn-row-main {
            display: flex;
            gap: 0.7rem;
            margin-top: 0.5rem;
        }
        .btn-row-secondary {
            display: flex;
            gap: 0.5rem;
            margin-top: 0.7rem;
            flex-wrap: wrap;
        }
        .btn {
            flex: 1;
            border-radius: 999px;
            border: none;
            padding: 0.7rem 1rem;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }
        .btn-primary {
            background: linear-gradient(to right, #6366f1, #0ea5e9);
            color: #ffffff;
        }
        .btn-secondary {
            background: #e5e7eb;
            color: #111827;
        }
        .btn-outline {
            background: #f9fafb;
            border: 1px solid #d1d5db;
            color: #111827;
        }
        .btn-primary:hover {
            box-shadow: 0 8px 18px rgba(59, 130, 246, 0.4);
            transform: translateY(-1px);
        }
        .btn-secondary:hover { background: #d1d5db; }
        .btn-outline:hover { background: #e5e7eb; }

        .status { margin-top: 0.8rem; font-size: 0.86rem; }
        .status.ok { color: #16a34a; }
        .status.err { color: #dc2626; }
    </style>
</head>
<body>

<div class="card">
    <h2>Book Appointment</h2>
    <div class="subtitle">Fill in the details to schedule your consultation.</div>

    <form action="bookAppointment" method="post">
        <div class="field">
            <label for="doctorId">Doctor ID</label>
            <input id="doctorId" type="number" name="doctorId" required>
        </div>
        <div class="field">
            <label for="appointmentDate">Appointment Date</label>
            <input id="appointmentDate" type="date" name="appointmentDate" required>
        </div>
        <div class="field">
            <label for="symptoms">Symptoms</label>
            <input id="symptoms" type="text" name="symptoms" required>
        </div>

        <div class="btn-row-main">
            <a href="user_dashboard.jsp" class="btn btn-secondary">Back to dashboard</a>
            <button type="submit" class="btn btn-primary">Confirm booking</button>
        </div>
    </form>

    <div class="btn-row-secondary">
        <a href="doctors" class="btn btn-outline">View available doctors</a>
        <a href="myAppointments" class="btn btn-outline">My appointments</a>
    </div>

    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        if ("1".equals(success)) {
    %>
    <div class="status ok">Appointment booked successfully.</div>
    <% } else if ("1".equals(error)) { %>
    <div class="status.err">Could not book appointment. Please try again.</div>
    <% } %>
</div>

</body>
</html>
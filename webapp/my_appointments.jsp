<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Appointment" %>
<%
  List<Appointment> list = (List<Appointment>) request.getAttribute("appointments");
%>
<!DOCTYPE html>
<html>
<head>
  <title>My Appointments</title>
  <style>
    body {
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: #e5e7eb;
      margin: 0;
      padding: 2rem;
    }
    .box {
      background: #ffffff;
      border-radius: 18px;
      max-width: 900px;
      margin: 0 auto;
      padding: 1.8rem 2rem;
      box-shadow: 0 18px 35px rgba(148,163,184,0.55);
    }
    h2 { margin-top: 0; }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 1rem;
    }
    th, td {
      padding: 0.6rem 0.75rem;
      border-bottom: 1px solid #e5e7eb;
      font-size: 0.9rem;
      text-align: left;
    }
    th { background: #f9fafb; }
    .btn-back {
      display:inline-block;
      margin-top:1rem;
      padding:0.5rem 1rem;
      border-radius:999px;
      border:none;
      background:#111827;
      color:#ffffff;
      text-decoration:none;
      font-size:0.88rem;
    }
  </style>
</head>
<body>
<div class="box">
  <h2>My Appointments</h2>

  <%
    if (list == null || list.isEmpty()) {
  %>
  <p>No appointments found.</p>
  <%
  } else {
  %>
  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>Doctor ID</th>
      <th>Date</th>
      <th>Symptoms</th>
      <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (Appointment a : list) {
    %>
    <tr>
      <td><%= a.getId() %></td>
      <td><%= a.getDoctorId() %></td>
      <td><%= a.getAppointmentDate() %></td>
      <td><%= a.getSymptoms() %></td>
      <td><%= a.getStatus() %></td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } %>

  <a href="user_dashboard.jsp" class="btn-back">Back to dashboard</a>
</div>
</body>
</html>
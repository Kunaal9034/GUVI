<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - Online Health Consultation</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background: radial-gradient(circle at top, #6366f1, #22c55e);
            min-height: 100vh;
            display: flex;
            align-items: stretch;
            justify-content: center;
        }
        .shell {
            max-width: 1080px;
            width: 100%;
            margin: 2.2rem;
            background: #f3f4f6;
            border-radius: 22px;
            box-shadow: 0 22px 45px rgba(15, 23, 42, 0.55);
            overflow: hidden;
            display: grid;
            grid-template-columns: 250px 1fr;
        }
        .sidebar {
            background: #020617;
            color: #e5e7eb;
            padding: 1.9rem 1.75rem;
        }
        .logo { font-size: 1.3rem; font-weight: 700; margin-bottom: 0.25rem; }
        .role { font-size: 0.85rem; color: #9ca3af; margin-bottom: 1.5rem; }
        .nav-title {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            color: #6b7280;
            margin-bottom: 0.5rem;
        }
        .nav { display: flex; flex-direction: column; gap: 0.4rem; }
        .nav a {
            text-decoration: none;
            font-size: 0.9rem;
            padding: 0.5rem 0.75rem;
            border-radius: 10px;
            color: #e5e7eb;
            display: block;
        }
        .nav a.active { background: linear-gradient(to right, #6366f1, #0ea5e9); }
        .nav a:hover:not(.active) { background: rgba(55, 65, 81, 0.75); }
        .logout {
            margin-top: 1.7rem;
        }
        .logout a {
            text-decoration: none;
            font-size: 0.85rem;
            padding: 0.45rem 0.9rem;
            border-radius: 999px;
            border: 1px solid #f97373;
            color: #fecaca;
        }
        .logout a:hover { background: #b91c1c; }

        .main {
            padding: 2rem 2.25rem 2.3rem;
            color: #111827;
        }
        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 1.2rem;
        }
        .main-title { font-size: 1.4rem; font-weight: 700; }
        .subtitle { font-size: 0.9rem; color: #6b7280; }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1rem;
            margin-top: 1.3rem;
        }
        .card {
            background: #ffffff;
            border-radius: 16px;
            padding: 1.2rem 1.25rem 1.3rem;
            box-shadow: 0 10px 22px rgba(148, 163, 184, 0.4);
            border: 1px solid #e5e7eb;
        }
        .card h3 { margin: 0 0 0.35rem 0; font-size: 1rem; }
        .card p { margin: 0 0 0.9rem 0; font-size: 0.88rem; color: #6b7280; }

        .btn-row { display: flex; flex-wrap: wrap; gap: 0.55rem; }
        .btn {
            border-radius: 999px;
            border: none;
            padding: 0.55rem 1.1rem;
            font-size: 0.88rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .btn-primary {
            background: linear-gradient(to right, #6366f1, #0ea5e9);
            color: #ffffff;
        }
        .btn-outline {
            background: #f9fafb;
            color: #111827;
            border: 1px solid #d1d5db;
        }
        .btn-primary:hover {
            box-shadow: 0 8px 18px rgba(59, 130, 246, 0.5);
            transform: translateY(-1px);
        }
        .btn-outline:hover { background: #e5e7eb; }

        @media (max-width: 900px) {
            .shell { grid-template-columns: 1fr; margin: 1.2rem; }
        }
    </style>
</head>
<body>

<div class="shell">
    <aside class="sidebar">
        <div class="logo">Health Portal</div>
        <div class="role">Welcome, <strong><%= currentUser.getName() %></strong></div>

        <div class="nav-title">Menu</div>
        <nav class="nav">
            <a href="user_dashboard.jsp" class="active">Dashboard</a>
            <a href="book_appointment.jsp">Book Appointment</a>
            <a href="myAppointments">My Appointments</a>
            <a href="profile.jsp">Profile</a>
            <a href="support.jsp">Help &amp; Support</a>
        </nav>

        <div class="logout">
            <a href="logout">Logout</a>
        </div>
    </aside>

    <main class="main">
        <div class="main-header">
            <div>
                <div class="main-title">Your Dashboard 👋</div>
                <div class="subtitle">Manage appointments, profile and online consultations.</div>
            </div>
        </div>

        <section class="cards">
            <div class="card">
                <h3>Book a new appointment</h3>
                <p>Choose a doctor, select a convenient date and share your symptoms.</p>
                <div class="btn-row">
                    <a href="book_appointment.jsp" class="btn btn-primary">Book Appointment</a>
                </div>
            </div>

            <div class="card">
                <h3>My upcoming visits</h3>
                <p>See all your scheduled appointments in one place.</p>
                <div class="btn-row">
                    <a href="myAppointments" class="btn btn-outline">View appointments</a>
                </div>
            </div>

            <div class="card">
                <h3>Profile &amp; details</h3>
                <p>Update your personal information used by doctors during consultation.</p>
                <div class="btn-row">
                    <a href="profile.jsp" class="btn btn-outline">Open profile</a>
                </div>
            </div>

            <div class="card">
                <h3>Need help?</h3>
                <p>Stuck anywhere in booking or joining a session? Visit help center.</p>
                <div class="btn-row">
                    <a href="support.jsp" class="btn btn-outline">Help center</a>
                    <a href="mailto:support@health.com" class="btn btn-primary">Email support</a>
                </div>
            </div>
        </section>
    </main>
</div>

</body>
</html>
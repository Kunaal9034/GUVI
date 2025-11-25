<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%
    User admin = (User) session.getAttribute("currentUser");
    if (admin == null || !"ADMIN".equals(admin.getRole())) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - Online Health Consultation</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: "Segoe UI", system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
            background: #020617;
            min-height: 100vh;
            display: flex;
            align-items: stretch;
            justify-content: center;
        }
        .shell {
            max-width: 1100px;
            width: 100%;
            margin: 2.5rem;
            border-radius: 22px;
            overflow: hidden;
            background: #020617;
            box-shadow: 0 24px 50px rgba(15, 23, 42, 0.8);
            display: grid;
            grid-template-columns: 260px 1fr;
        }
        .sidebar {
            background: radial-gradient(circle at top, #22c55e, #0ea5e9);
            color: #ecfeff;
            padding: 2rem 1.8rem;
        }
        .sidebar-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 0.3rem;
        }
        .sidebar-sub {
            font-size: 0.9rem;
            opacity: 0.9;
            margin-bottom: 1.8rem;
        }
        .nav-title {
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            opacity: 0.9;
            margin-bottom: 0.6rem;
        }
        .nav {
            display: flex;
            flex-direction: column;
            gap: 0.4rem;
            margin-bottom: 1.4rem;
        }
        .nav a {
            text-decoration: none;
            font-size: 0.9rem;
            padding: 0.5rem 0.75rem;
            border-radius: 10px;
            color: #ecfeff;
            display: block;
        }
        .nav a.active {
            background: rgba(15, 23, 42, 0.22);
        }
        .nav a:hover:not(.active) {
            background: rgba(15, 23, 42, 0.36);
        }
        .sidebar-footer {
            margin-top: 1.5rem;
            font-size: 0.85rem;
            opacity: 0.95;
        }
        .main {
            padding: 2rem 2.2rem 2.3rem;
            color: #e5e7eb;
            background: #020617;
        }
        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 1.3rem;
        }
        .main-title {
            font-size: 1.3rem;
            font-weight: 600;
        }
        .tag {
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            padding: 0.2rem 0.6rem;
            border-radius: 999px;
            border: 1px solid rgba(148, 163, 184, 0.6);
            color: #9ca3af;
        }
        .actions-row {
            display: flex;
            flex-wrap: wrap;
            gap: 0.6rem;
            margin-bottom: 1.3rem;
        }
        .btn {
            border-radius: 999px;
            padding: 0.55rem 1.1rem;
            font-size: 0.88rem;
            font-weight: 600;
            border: none;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .btn-primary {
            background: linear-gradient(to right, #22c55e, #0ea5e9);
            color: #020617;
        }
        .btn-primary:hover {
            box-shadow: 0 10px 22px rgba(34, 197, 94, 0.4);
            transform: translateY(-1px);
        }
        .btn-outline {
            background: transparent;
            border: 1px solid #4b5563;
            color: #e5e7eb;
        }
        .btn-outline:hover {
            background: #111827;
        }
        .card {
            background: rgba(15, 23, 42, 0.96);
            border-radius: 18px;
            padding: 1.5rem 1.6rem;
            border: 1px solid rgba(148, 163, 184, 0.3);
            margin-bottom: 1.3rem;
        }
        .card h3 {
            margin: 0 0 0.4rem 0;
            font-size: 1.05rem;
        }
        .card p {
            margin: 0 0 1.1rem 0;
            font-size: 0.88rem;
            color: #9ca3af;
        }
        label {
            display: block;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #9ca3af;
            margin-bottom: 0.35rem;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 0.6rem 0.75rem;
            border-radius: 10px;
            border: 1px solid #1f2937;
            background: #020617;
            color: #e5e7eb;
            font-size: 0.9rem;
            outline: none;
        }
        input:focus {
            border-color: #22c55e;
            box-shadow: 0 0 0 2px rgba(34, 197, 94, 0.35);
        }
        .grid-2 {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 0.9rem 1rem;
        }
        .status {
            font-size: 0.86rem;
            margin-top: 0.7rem;
        }
        .status.ok { color: #4ade80; }
        .status.err { color: #f97373; }
        @media (max-width: 900px) {
            .shell {
                grid-template-columns: 1fr;
                margin: 1.4rem;
            }
        }
    </style>
</head>
<body>

<div class="shell">
    <aside class="sidebar">
        <div class="sidebar-title">Admin Console</div>
        <div class="sidebar-sub">
            Welcome, <strong><%= admin.getName() %></strong><br/>
            Manage doctors, users and appointments.
        </div>

        <div class="nav-title">Navigation</div>
        <nav class="nav">
            <a href="admin_dashboard.jsp" class="active">Dashboard</a>
            <a href="view_doctors.jsp">View Doctors (coming soon)</a>
            <a href="view_appointments.jsp">All Appointments (coming soon)</a>
            <a href="manage_users.jsp">Users (coming soon)</a>
        </nav>

        <div class="sidebar-footer">
            <a href="logout" style="color:#ecfeff;text-decoration:none;">Logout</a>
        </div>
    </aside>

    <main class="main">
        <div class="main-header">
            <div class="main-title">Admin Panel</div>
            <span class="tag">Administrator</span>
        </div>

        <div class="actions-row">
            <a href="#addDoctor" class="btn btn-primary">Add Doctor</a>
            <a href="view_doctors.jsp" class="btn btn-outline">View Doctor List</a>
            <a href="view_appointments.jsp" class="btn btn-outline">View All Appointments</a>
        </div>

        <section class="card" id="addDoctor">
            <h3>Add Doctor</h3>
            <p>Register a new doctor to be available for online consultations.</p>

            <form action="addDoctor" method="post">
                <div class="grid-2">
                    <div>
                        <label for="name">Name</label>
                        <input id="name" type="text" name="name" required>
                    </div>
                    <div>
                        <label for="specialization">Specialization</label>
                        <input id="specialization" type="text" name="specialization" required>
                    </div>
                    <div>
                        <label for="email">Email</label>
                        <input id="email" type="email" name="email" required>
                    </div>
                    <div>
                        <label for="phone">Phone</label>
                        <input id="phone" type="text" name="phone" required>
                    </div>
                </div>

                <button class="btn btn-primary" type="submit" style="margin-top:1rem;">Add Doctor</button>
            </form>

            <%
                String success = request.getParameter("success");
                String err = request.getParameter("error");
                if ("1".equals(success)) {
            %>
            <div class="status ok">Doctor added successfully.</div>
            <% } else if ("1".equals(err)) { %>
            <div class="status err">Failed to add doctor. Please try again.</div>
            <% } %>
        </section>
    </main>
</div>

</body>
</html>
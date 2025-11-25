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
    <title>My Profile - Online Health Consultation</title>
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
            width: 520px;
            max-width: 95vw;
            padding: 2.1rem 2.4rem 2.3rem;
            border-radius: 24px;
            box-shadow: 0 24px 42px rgba(15, 23, 42, 0.7);
        }
        h2 {
            margin: 0 0 0.25rem;
            font-size: 1.4rem;
        }
        .subtitle {
            font-size: 0.9rem;
            color: #6b7280;
            margin-bottom: 1.4rem;
        }
        .row {
            display: flex;
            gap: 0.8rem;
        }
        .field {
            margin-bottom: 0.9rem;
            flex: 1;
        }
        label {
            display: block;
            font-size: 0.83rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.3rem;
        }
        input[type="text"], input[type="email"], input[type="number"], input[type="password"] {
            width: 100%;
            padding: 0.7rem 0.8rem;
            border-radius: 12px;
            border: 1px solid #d1d5db;
            font-size: 0.95rem;
        }
        input:focus {
            border-color: #6366f1;
            outline: none;
            box-shadow: 0 0 0 3px rgba(129, 140, 248, 0.35);
        }
        .readonly {
            background: #f9fafb;
        }
        .btn-row {
            display: flex;
            justify-content: flex-end;
            gap: 0.6rem;
            margin-top: 0.6rem;
        }
        .btn {
            border-radius: 999px;
            border: none;
            padding: 0.65rem 1.2rem;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
        }
        .btn-secondary {
            background: #e5e7eb;
            color: #111827;
        }
        .btn-secondary:hover { background: #d1d5db; }
        .btn-primary {
            background: linear-gradient(to right, #6366f1, #0ea5e9);
            color: #ffffff;
        }
        .btn-primary:hover {
            box-shadow: 0 8px 18px rgba(59, 130, 246, 0.5);
            transform: translateY(-1px);
        }
        .status {
            margin-top: 0.6rem;
            font-size: 0.86rem;
        }
        .status.ok { color: #16a34a; }
        .status.err { color: #dc2626; }
    </style>
</head>
<body>

<div class="card">
    <h2>My Profile</h2>
    <div class="subtitle">
        View and update the details used by doctors during consultation.
    </div>

    <form action="updateProfile" method="post">
        <!-- Hidden ID so servlet knows which user to update -->
        <input type="hidden" name="id" value="<%= u.getId() %>">

        <div class="field">
            <label>User ID</label>
            <input type="text" value="<%= u.getId() %>" class="readonly" disabled>
        </div>

        <div class="field">
            <label>Full name</label>
            <input type="text" name="name" value="<%= u.getName() %>" required>
        </div>

        <div class="field">
            <label>Email address</label>
            <input type="email" name="email" value="<%= u.getEmail() %>" required>
        </div>

        <div class="row">
            <div class="field">
                <label>Age</label>
                <input type="number" name="age" min="0" value="<%= u.getAge() %>">
            </div>
            <div class="field">
                <label>Gender</label>
                <input type="text" name="gender" value="<%= u.getGender() %>" placeholder="Male/Female/Other">
            </div>
        </div>

        <div class="row">
            <div class="field">
                <label>Role</label>
                <input type="text" name="role" value="<%= u.getRole() %>" class="readonly" readonly>
            </div>
            <div class="field">
                <label>Change password</label>
                <input type="password" name="password" placeholder="Leave blank to keep current">
            </div>
        </div>

        <div class="btn-row">
            <button type="button" class="btn btn-secondary" onclick="window.location.href='user_dashboard.jsp'">
                Back to dashboard
            </button>
            <button type="submit" class="btn btn-primary">Save changes</button>
        </div>

        <%
            String status = request.getParameter("status");
            if ("ok".equals(status)) {
        %>
        <div class="status ok">Profile updated successfully.</div>
        <% } else if ("error".equals(status)) { %>
        <div class="status err">Could not update profile. Please try again.</div>
        <% } %>
    </form>
</div>

</body>
</html>
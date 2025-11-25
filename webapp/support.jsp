<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%
    User u = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Support - Online Health Consultation</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background: #e5e7eb;
            padding: 2rem;
        }
        .wrapper {
            max-width: 1000px;
            margin: 0 auto;
            display: grid;
            gap: 1.2rem;
            grid-template-columns: minmax(0, 3fr) minmax(0, 2fr);
        }
        .card {
            background: #ffffff;
            border-radius: 20px;
            padding: 1.7rem 1.9rem;
            box-shadow: 0 18px 36px rgba(148, 163, 184, 0.6);
        }
        h2 { margin-top: 0; }
        label {
            display:block;
            font-size:0.85rem;
            font-weight:600;
            margin-bottom:0.3rem;
            color:#374151;
        }
        input[type="text"], input[type="email"], textarea {
            width:100%;
            padding:0.7rem 0.8rem;
            border-radius:10px;
            border:1px solid #d1d5db;
            font-size:0.95rem;
        }
        textarea { min-height: 120px; resize: vertical; }
        textarea:focus, input:focus {
            outline:none;
            border-color:#6366f1;
            box-shadow:0 0 0 3px rgba(129,140,248,0.35);
        }
        .field { margin-bottom:0.9rem; }
        .btn {
            border-radius:999px;
            border:none;
            padding:0.65rem 1.4rem;
            font-size:0.9rem;
            font-weight:600;
            cursor:pointer;
            background:linear-gradient(to right,#6366f1,#0ea5e9);
            color:#ffffff;
        }
        .status {
            margin-top:0.6rem;
            font-size:0.86rem;
        }
        .status.ok { color:#16a34a; }
        .status.err { color:#dc2626; }

        ul.faq { padding-left:1.1rem; margin:0.6rem 0 0; }
        ul.faq li { margin-bottom:0.4rem; font-size:0.9rem; }
        .tag {
            display:inline-block;
            padding:0.2rem 0.55rem;
            border-radius:999px;
            background:#eef2ff;
            color:#4f46e5;
            font-size:0.75rem;
            margin-bottom:0.25rem;
        }
        .back-link {
            display:inline-block;
            margin-top:0.9rem;
            font-size:0.85rem;
            text-decoration:none;
            color:#2563eb;
        }
        .back-link:hover { text-decoration:underline; }
        @media (max-width: 900px) {
            .wrapper { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

<div class="wrapper">
    <div class="card">
        <h2>Contact support</h2>
        <p style="font-size:0.9rem;color:#6b7280;margin-top:0;">
            Facing any issue while logging in, booking an appointment or accessing dashboard?
            Describe it below and we’ll look into it.
        </p>

        <form action="supportRequest" method="post">
            <div class="field">
                <label for="name">Your name</label>
                <input type="text" id="name" name="name"
                       value='<%= (u != null ? u.getName() : "") %>' required>
            </div>
            <div class="field">
                <label for="email">Email</label>
                <input type="email" id="email" name="email"
                       value='<%= (u != null ? u.getEmail() : "") %>' required>
            </div>
            <div class="field">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" placeholder="Login issue / Booking issue / Others" required>
            </div>
            <div class="field">
                <label for="message">Message</label>
                <textarea id="message" name="message" placeholder="Describe the issue in 2–3 lines..." required></textarea>
            </div>

            <button type="submit" class="btn">Send message</button>

            <%
                String status = request.getParameter("status");
                if ("ok".equals(status)) {
            %>
            <div class="status ok">Your message has been submitted. We will contact you shortly.</div>
            <% } else if ("error".equals(status)) { %>
            <div class="status err">Could not submit your message. Please try again.</div>
            <% } %>
        </form>

        <a href='<%= (u != null ? "user_dashboard.jsp" : "index.jsp") %>' class="back-link">
            ← Back to <%= (u != null ? "dashboard" : "login") %>
        </a>
    </div>

    <div class="card">
        <span class="tag">FAQ</span>
        <h2>Quick help</h2>
        <ul class="faq">
            <li><strong>Can’t log in?</strong><br>
                Make sure you are using the same email and password used while registration.
            </li>
            <li><strong>Where can I see my appointments?</strong><br>
                Open <em>User Dashboard → My appointments</em>.
            </li>
            <li><strong>How to book a new appointment?</strong><br>
                From User Dashboard click <em>Book appointment</em> button, choose doctor &amp; date.
            </li>
            <li><strong>How to logout?</strong><br>
                Use the <em>Logout</em> button at the top of your dashboard.
            </li>
        </ul>

        <p style="margin-top:1rem;font-size:0.86rem;color:#6b7280;">
            For urgent technical issues you can also email:
            <strong>support@health.com</strong>
        </p>
    </div>
</div>

</body>
</html>
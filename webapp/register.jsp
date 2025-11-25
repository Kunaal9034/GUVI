<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Online Health Consultation</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: "Segoe UI", system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
            background: radial-gradient(circle at top left, #22c55e, #0ea5e9);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: #ffffff;
            padding: 2.25rem 2.75rem;
            border-radius: 18px;
            box-shadow: 0 18px 40px rgba(15, 23, 42, 0.25);
            width: 420px;
            max-width: 94vw;
            color: #0f172a;
        }
        .title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }
        .subtitle {
            font-size: 0.9rem;
            color: #6b7280;
            margin-bottom: 1.5rem;
        }
        .grid-2 {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 0.75rem 1rem;
        }
        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 0.35rem;
            color: #374151;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"],
        select {
            width: 100%;
            padding: 0.65rem 0.8rem;
            border-radius: 10px;
            border: 1px solid #d1d5db;
            font-size: 0.94rem;
            outline: none;
            transition: border 0.15s ease, box-shadow 0.15s ease;
        }
        input:focus, select:focus {
            border-color: #22c55e;
            box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.3);
        }
        .field {
            margin-bottom: 1rem;
        }
        .btn-primary {
            width: 100%;
            padding: 0.75rem;
            border-radius: 999px;
            border: none;
            background: linear-gradient(to right, #22c55e, #0ea5e9);
            color: #ffffff;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            margin-top: 0.5rem;
            transition: transform 0.1s ease, box-shadow 0.1s ease;
        }
        .btn-primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(34, 197, 94, 0.35);
        }
        .back-link {
            margin-top: 1.1rem;
            font-size: 0.9rem;
            text-align: center;
            color: #4b5563;
        }
        .back-link a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
        }
        .back-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>

<div class="card">
    <div class="title">Create your account</div>
    <div class="subtitle">Register to book appointments and manage consultations.</div>

    <form action="register" method="post">
        <div class="field">
            <label for="name">Full Name</label>
            <input id="name" type="text" name="name" required>
        </div>

        <div class="field">
            <label for="email">Email</label>
            <input id="email" type="email" name="email" required>
        </div>

        <div class="field">
            <label for="password">Password</label>
            <input id="password" type="password" name="password" required>
        </div>

        <div class="grid-2">
            <div class="field">
                <label for="age">Age</label>
                <input id="age" type="number" name="age" min="1" max="120" required>
            </div>
            <div class="field">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="" disabled selected>Select…</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
        </div>

        <button class="btn-primary" type="submit">Sign up</button>
    </form>

    <div class="back-link">
        Already have an account? <a href="index.jsp">Back to login</a>
    </div>
</div>

</body>
</html>
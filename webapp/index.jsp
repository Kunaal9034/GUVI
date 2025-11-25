<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Doctor - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #eefdfd; /* Light Cyan background from image */
            --text-dark: #1e293b; /* Dark Navy for headers */
            --text-light: #64748b;
            --accent-red: #ff5252; /* The 'Learn More' button color */
            --accent-blue: #0ea5e9;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        /* --- Header / Logo Section --- */
        header {
            padding: 1.5rem 3rem;
            display: flex;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            font-size: 1.2rem;
            color: var(--text-dark);
            text-decoration: none;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--accent-blue);
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            font-size: 1.5rem;
        }

        /* --- Main Layout (Split Screen) --- */
        .main-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 3rem;
            gap: 4rem;
        }

        /* Left Side: Login Form */
        .login-section {
            flex: 1;
            max-width: 450px;
            animation: slideInLeft 0.8s ease-out;
        }

        .login-section h1 {
            font-size: 2.5rem;
            color: var(--text-dark);
            margin: 0 0 1rem 0;
            text-transform: uppercase;
            letter-spacing: 1px;
            line-height: 1.2;
        }

        .login-section p {
            color: var(--text-light);
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        /* Right Side: The Doctor Image */
        .image-section {
            flex: 1.2;
            display: flex;
            justify-content: center;
            position: relative;
            animation: slideInRight 0.8s ease-out;
        }

        .image-section img {
            width: 100%;
            max-width: 650px;
            height: auto;
            /* Using drop-shadow to make the transparent image pop */
            filter: drop-shadow(0 20px 30px rgba(0,0,0,0.1));
        }

        /* --- Form Styles --- */
        .form-group {
            margin-bottom: 1.2rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--text-dark);
            font-size: 0.9rem;
        }

        input {
            width: 100%;
            padding: 1rem;
            border: 2px solid transparent;
            background: #ffffff;
            border-radius: 12px;
            font-size: 1rem;
            font-family: inherit;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
            transition: all 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.15);
        }

        /* The Button - Matched to the Red 'Learn More' button */
        .btn-login {
            display: inline-block;
            background-color: var(--accent-red);
            color: white;
            padding: 1rem 2.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-top: 1rem;
            box-shadow: 0 10px 20px rgba(255, 82, 82, 0.3);
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 25px rgba(255, 82, 82, 0.4);
            background-color: #ff3b3b;
        }

        .links {
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }
        .links a {
            color: var(--accent-blue);
            text-decoration: none;
            font-weight: 600;
        }
        .links a:hover { text-decoration: underline; }

        .error-msg {
            color: #ef4444;
            background: #fee2e2;
            padding: 0.8rem;
            border-radius: 8px;
            margin-top: 1rem;
            font-size: 0.9rem;
            border-left: 4px solid #ef4444;
        }

        /* --- Floating Icons Animation (Optional Flair) --- */
        .floating-icon {
            position: absolute;
            width: 50px;
            height: 50px;
            opacity: 0.8;
            animation: float 4s ease-in-out infinite;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }
        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-50px); }
            to { opacity: 1; transform: translateX(0); }
        }
        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(50px); }
            to { opacity: 1; transform: translateX(0); }
        }

        /* Mobile Responsive */
        @media (max-width: 900px) {
            .main-container {
                flex-direction: column-reverse;
                padding: 1rem;
                gap: 2rem;
                text-align: center;
            }
            .image-section img { max-width: 80%; }
            .login-section { width: 100%; }
            header { justify-content: center; padding: 1rem; }
        }
    </style>
</head>
<body>

<header>
    <a href="#" class="logo">
        <div class="logo-icon">✚</div>
        HealthCare Portal
    </a>
</header>

<div class="main-container">

    <div class="login-section">
        <h1>Online Doctor</h1>
        <p>Welcome back. Please enter your details to access your appointments and consultation history.</p>

        <form action="login" method="post">
            <div class="form-group">
                <label>Email Address</label>
                <input type="text" name="email" placeholder="name@example.com" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="••••••••" required>
            </div>

            <button type="submit" class="btn-login">Login Now</button>
        </form>

        <div class="links">
            New Patient? <a href="register.jsp">Sign Up Here</a> <br>
            <a href="forgot_password.jsp" style="font-size: 0.85rem; color: #94a3b8;">Forgot Password?</a>
        </div>

        <div style="margin-top: 2rem;">
            <form action="login" method="post" style="display:inline;">
                <input type="hidden" name="email" value="admin@health.com">
                <input type="hidden" name="password" value="admin123">
                <button type="submit" style="background:none; border:1px solid #cbd5e1; padding:5px 10px; border-radius:5px; cursor:pointer; color:#64748b; font-size:0.8rem;">
                    Admin Demo
                </button>
            </form>
        </div>

        <%
            String error = request.getParameter("error");
            if ("1".equals(error)) {
        %>
        <div class="error-msg">Invalid credentials! Please try again.</div>
        <% } %>
    </div>

    <div class="image-section">
        <img src="https://cdn.pixabay.com/photo/2020/08/03/09/39/medical-5459630_1280.png"
             alt="Doctor Illustration">
    </div>

</div>

</body>
</html>
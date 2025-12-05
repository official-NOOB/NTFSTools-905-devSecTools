<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Logout Successful</title>

<style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Background */
    body {
        font-family: "Poppins", "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        flex-direction: column;
        padding: 20px;
    }

    /* Logout Card */
    .logout-box {
        background: #ffffff;
        padding: 45px 55px;
        border-radius: 18px;
        box-shadow: 0 10px 35px rgba(0, 0, 0, 0.25);
        text-align: center;
        max-width: 460px;
        width: 90%;
        animation: fadeIn 0.9s ease-in-out;
    }

    h1 {
        font-size: 30px;
        color: #2c3e50;
        margin-bottom: 15px;
        font-weight: 600;
    }

    p {
        font-size: 17px;
        color: #555;
        margin-bottom: 30px;
        line-height: 1.6;
    }

    /* Button */
    .home-btn {
        text-decoration: none;
        padding: 12px 20px;
        background: #2575fc;
        color: #fff;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        transition: 0.3s ease;
        display: inline-block;
    }

    .home-btn:hover {
        background: #1a5ed8;
        transform: translateY(-2px);
    }

    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>

<%
    session.invalidate();
%>

<div class="logout-box">
    <h1>Logout Successful</h1>
    <p>You have been logged out safely.<br>We hope to see you again soon!</p>

    <a href="index.html" class="home-btn">Go to Home</a>
</div>

</body>
</html>

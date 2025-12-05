<%@page import="com.nit.admin.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    /* ===== Reset ===== */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* ===== Page Layout ===== */
    body {
        font-family: "Poppins", "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        color: #333;
    }

    /* ===== Dashboard Container ===== */
    .dashboard {
        background-color: #fff;
        padding: 60px 70px;
        border-radius: 15px;
        box-shadow: 0 10px 35px rgba(0, 0, 0, 0.2);
        text-align: center;
        max-width: 500px;
        width: 90%;
        animation: fadeIn 0.8s ease-in-out;
    }

    h1 {
        color: #2c3e50;
        font-size: 28px;
        margin-bottom: 20px;
    }

    h2 {
        color: #555;
        font-size: 18px;
        margin-bottom: 35px;
    }

    /* ===== Navigation Buttons ===== */
    a {
        display: block;
        text-decoration: none;
        background-color: #667eea;
        color: white;
        padding: 14px 20px;
        border-radius: 8px;
        font-size: 17px;
        font-weight: 600;
        margin: 12px auto;
        width: 80%;
        transition: all 0.3s ease;
    }

    a:hover {
        background-color: #5563c1;
        transform: scale(1.05);
    }

    /* ===== Logout Button Style ===== */
    .logout {
        background-color: #e74c3c;
    }

    .logout:hover {
        background-color: #c0392b;
    }

    /* ===== Fade Animation ===== */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-15px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>
    <div class="dashboard">
        <%
            AdminBean abean = (AdminBean)session.getAttribute("AdminBean");
            String data = (String)request.getAttribute("msg");
        %>

        <h1>Welcome, <%= abean.getA_fname() %> 👋</h1>
        <h2><%= data != null ? data : "Manage your products easily below." %></h2>

        <a href="AddProduct.html">➕ Add Product</a>
        <a href="view1">📦 View Products</a>
        <a href="logout" class="logout">🚪 Log Out</a>
    </div>
</body>
</html>

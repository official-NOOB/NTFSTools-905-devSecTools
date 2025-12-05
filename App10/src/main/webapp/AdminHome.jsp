<%@ page import="com.nit.admin.AdminBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
    body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #2980b9, #6dd5fa);
        margin: 0;
        padding: 0;
        color: #333;
    }

    .container {
        width: 90%;
        max-width: 600px;
        margin: 80px auto;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        text-align: center;
        padding: 40px 20px;
        animation: fadeIn 0.6s ease-in;
    }

    h1 {
        color: #2c3e50;
        margin-bottom: 20px;
    }

    .welcome {
        font-size: 1.3em;
        color: #16a085;
        margin-bottom: 30px;
        font-weight: 500;
    }

    a {
        display: block;
        width: 80%;
        margin: 10px auto;
        text-decoration: none;
        background-color: #3498db;
        color: white;
        padding: 12px 0;
        border-radius: 8px;
        font-weight: 600;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    a:hover {
        background-color: #1d6fa5;
        transform: scale(1.05);
    }

    .logout {
        background-color: #e74c3c;
    }

    .logout:hover {
        background-color: #c0392b;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

   
</style>
</head>
<body>

<%
    AdminBean ab = (AdminBean) session.getAttribute("AdminBean");
    if (ab == null) {
        response.sendRedirect("adminLogin.html");
        return;
    }
%>

<div class="container">
    <h1>Admin Dashboard</h1>
    <div class="welcome">
        Welcome <%= ab.getA_fname() %>!
    </div>

    <a href="AddProduct.html">➕ Add Product</a>
    <a href="view1">📦 View Products</a>
    <a href="logout" class="logout">🚪 Log Out</a>
</div>


</body>
</html>

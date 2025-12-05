<%@page import="com.nit.admin.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Home</title>

<style>
  /* ===== Reset & Base Styles ===== */
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: "Poppins", "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    color: #333;
  }

  /* ===== Main Container ===== */
  .dashboard-container {
    background-color: #ffffff;
    width: 500px;
    border-radius: 15px;
    box-shadow: 0 10px 35px rgba(0, 0, 0, 0.2);
    text-align: center;
    padding: 45px 40px;
    animation: fadeIn 0.7s ease-in-out;
  }

  /* ===== Header & Greeting ===== */
  h1 {
    color: #2c3e50;
    font-size: 26px;
    margin-bottom: 20px;
  }

  .greeting {
    font-size: 18px;
    color: #27ae60;
    margin-bottom: 15px;
    font-weight: 500;
  }

  .message {
    color: #555;
    font-size: 16px;
    margin-bottom: 30px;
  }

  /* ===== Navigation Links ===== */
  .links a {
    display: block;
    text-decoration: none;
    background-color: #667eea;
    color: #fff;
    padding: 12px;
    border-radius: 8px;
    font-weight: 600;
    margin: 10px auto;
    width: 75%;
    transition: all 0.3s ease;
  }

  .links a:hover {
    background-color: #5563c1;
    transform: scale(1.05);
  }

  .logout {
    background-color: #e74c3c !important;
  }

  .logout:hover {
    background-color: #c0392b !important;
  }

  /* ===== Animation ===== */
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-15px); }
    to { opacity: 1; transform: translateY(0); }
  }

  

  /* ===== Responsive ===== */
  @media (max-width: 480px) {
    .dashboard-container {
      width: 90%;
      padding: 30px 20px;
    }
    h1 {
      font-size: 22px;
    }
    .links a {
      width: 100%;
    }
  }
</style>
</head>

<body>
<%
    AdminBean abean = (AdminBean) session.getAttribute("AdminBean");
    if (abean == null) {
        response.sendRedirect("adminLogin.html");
        return;
    }
    String data = (String) request.getAttribute("msg");
%>

<div class="dashboard-container">
  <h1>Welcome, Admin 👋</h1>

  <div class="greeting">
    Hello <%= abean.getA_fname() %>!
  </div>

  <div class="message">
    <%= data != null ? data : "Manage your products and account below." %>
  </div>

  <div class="links">
    <a href="AddProduct.html">➕ Add Product</a>
    <a href="view1">📦 View Products</a>
    <a href="logout" class="logout">🚪 Log Out</a>
  </div>
</div>

</body>
</html>

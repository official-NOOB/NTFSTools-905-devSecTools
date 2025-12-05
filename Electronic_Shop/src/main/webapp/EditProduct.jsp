<%@page import="com.nit.admin.ProductBean"%>
<%@page import="com.nit.admin.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<style>
  /* ===== Base Setup ===== */
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

  /* ===== Form Container ===== */
  .form-container {
    background-color: #ffffff;
    border-radius: 14px;
    padding: 45px 50px;
    width: 420px;
    box-shadow: 0 10px 35px rgba(0, 0, 0, 0.2);
    text-align: center;
    animation: fadeIn 0.7s ease-in-out;
  }

  h1 {
    color: #2c3e50;
    font-size: 26px;
    margin-bottom: 10px;
  }

  .greeting {
    font-size: 18px;
    color: #27ae60;
    margin-bottom: 25px;
    font-weight: 500;
  }

  /* ===== Form Fields ===== */
  form {
    display: flex;
    flex-direction: column;
    gap: 18px;
  }

  label {
    text-align: left;
    font-weight: 600;
    color: #333;
    font-size: 15px;
  }

  input[type="text"],
  input[type="number"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 15px;
    transition: 0.2s;
    background-color: #f9f9f9;
  }

  input:focus {
    border-color: #667eea;
    box-shadow: 0 0 6px rgba(102, 126, 234, 0.4);
    background-color: #fff;
    outline: none;
  }

  /* ===== Buttons ===== */
  input[type="submit"] {
    background-color: #667eea;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 10px;
  }

  input[type="submit"]:hover {
    background-color: #5563c1;
    transform: scale(1.04);
  }

  .back-link {
    display: inline-block;
    text-decoration: none;
    background-color: #34495e;
    color: white;
    padding: 10px 22px;
    border-radius: 8px;
    margin-top: 20px;
    font-size: 15px;
    transition: all 0.3s ease;
  }

  .back-link:hover {
    background-color: #2c3e50;
    transform: scale(1.05);
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-15px); }
    to { opacity: 1; transform: translateY(0); }
  }

  @media (max-width: 480px) {
    .form-container {
      width: 90%;
      padding: 30px 25px;
    }
    h1 {
      font-size: 22px;
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
  ProductBean pb = (ProductBean) request.getAttribute("pbitem");
%>

<div class="form-container">
  <h1>Edit Product</h1>
  <div class="greeting">
    Hello <%= abean.getA_fname() %> 👋 — please update the details below.
  </div>

  <form action="update" method="post">
    <label for="pprice">Product Price (₹)</label>
    <input type="number" id="pprice" name="pprice" value="<%= pb.getP_price() %>" required>

    <label for="pqty">Product Quantity</label>
    <input type="number" id="pqty" name="pqty" value="<%= pb.getP_qty() %>" required>

    <input type="hidden" name="pcode" value="<%= pb.getP_code() %>">

    <input type="submit" value="Update Product">
  </form>

  <a href="view1" class="back-link">← Back to Products</a>
</div>
</body>
</html>

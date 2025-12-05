<%@page import="com.nit.admin.ProductBean"%>
<%@page import="com.nt.customer.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Buy Product</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #6DD5FA, #2980B9);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        width: 45%;
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(15px);
        padding: 35px 40px;
        border-radius: 20px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
        animation: fadeIn 0.8s ease-in-out;
        color: #fff;
    }

    h2 {
        text-align: center;
        font-size: 26px;
        margin-bottom: 25px;
        letter-spacing: 1px;
    }

    .line {
        margin-bottom: 15px;
        padding: 10px 0;
        border-bottom: 1px solid rgba(255,255,255,0.3);
    }

    .label {
        font-weight: 600;
        color: #f9f9f9;
        font-size: 15px;
    }

    .value {
        font-size: 17px;
        color: #fff;
        font-weight: 500;
        float: right;
    }

    input[type="number"] {
        padding: 10px;
        width: 100%;
        border-radius: 10px;
        border: none;
        font-size: 16px;
        margin-top: 7px;
        outline: none;
        background: rgba(255,255,255,0.8);
    }

    .btn {
        margin-top: 25px;
        width: 100%;
        padding: 12px;
        background: #27ae60;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 18px;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    .btn:hover {
        background: #219150;
        transform: translateY(-2px);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-15px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<div class="container">

<%
    CustomerBean cb = (CustomerBean) session.getAttribute("CustomerBean");
    ProductBean pb = (ProductBean) request.getAttribute("pbitem");
    String reqNo = (String) request.getAttribute("reqNo");
%>

<h2>Hello <%= cb.getC_fname() %>, Review Your Product</h2>

<div class="line">
    <span class="label">Request No:</span>
    <span class="value"><%= reqNo %></span>
</div>

<div class="line">
    <span class="label">Product Code:</span>
    <span class="value"><%= pb.getP_code() %></span>
</div>

<div class="line">
    <span class="label">Product Name:</span>
    <span class="value"><%= pb.getP_name() %></span>
</div>

<div class="line">
    <span class="label">Company:</span>
    <span class="value"><%= pb.getP_company() %></span>
</div>

<div class="line">
    <span class="label">Price:</span>
    <span class="value">₹ <%= pb.getP_price() %></span>
</div>

<div class="line">
    <span class="label">Available Quantity:</span>
    <span class="value"><%= pb.getP_qty() %></span>
</div>

<form action="Update2" method="post">

    <div class="line" style="border-bottom:none;">
        <span class="label">Enter Quantity to Buy:</span><br>
        <input type="number" name="bqty" min="1" required>
    </div>

    <!-- Hidden Fields -->
    <input type="hidden" name="pcode" value="<%= pb.getP_code() %>">
    <input type="hidden" name="availableqty" value="<%= pb.getP_qty() %>">
    <input type="hidden" name="price" value="<%= pb.getP_price() %>">
    <input type="hidden" name="reqNo" value="<%= reqNo %>">

    <input type="submit" class="btn" value="Buy Now">
</form>

</div>

</body>
</html>

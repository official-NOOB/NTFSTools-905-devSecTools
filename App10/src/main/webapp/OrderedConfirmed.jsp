<%@page import="com.nt.customer.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmation</title>

<style>
    body {
        background: #eef2f3;
        font-family: Arial, sans-serif;
    }
    .card {
        width: 40%;
        background: white;
        margin: 60px auto;
        padding: 30px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
    }
    h2 {
        color: #2e2e2e;
        margin-bottom: 10px;
    }
    h3 {
        color: #444;
        margin: 8px 0;
    }
    .btn-link {
        display: inline-block;
        margin: 12px;
        padding: 10px 18px;
        background: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-size: 17px;
        font-weight: bold;
    }
    .btn-link:hover {
        background: #3d8b40;
    }
    .logout {
        background: #e53935;
    }
    .logout:hover {
        background: #c62828;
    }
</style>

</head>
<body>

<div class="card">

<%
    CustomerBean cb = (CustomerBean) session.getAttribute("CustomerBean");
    String reqNo = (String) request.getAttribute("reqNo");
    int amount = (int) request.getAttribute("amount");
%>

<h2>Hello <%= cb.getC_fname() %> 👋</h2>
<h3>Your Request No: <b><%= reqNo %></b></h3>
<h3>You have been charged: <b>₹ <%= amount %> /-</b></h3>
<h3>Your order has been placed <span style="color:green;">successfully!</span></h3>

<br><br>

<a class="btn-link" href="ViewCustomerProduct.jsp">View Products</a>
<a class="btn-link logout" href="logout1">Logout</a>

</div>

</body>
</html>

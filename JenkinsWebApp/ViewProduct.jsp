<%@page import="java.util.Iterator"%>
<%@page import="com.nit.admin.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nit.admin.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product Inventory</title>
<style>
    /* ===== Reset ===== */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: "Poppins", "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        min-height: 100vh;
        padding: 40px;
    }

    h1 {
        color: #fff;
        margin-bottom: 30px;
        font-size: 30px;
    }

    /* ===== Table Styling ===== */
    table {
        width: 90%;
        max-width: 900px;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.8s ease-in-out;
    }

    th, td {
        padding: 14px 18px;
        text-align: center;
    }

    th {
        background-color: #667eea;
        color: white;
        font-size: 16px;
        letter-spacing: 0.5px;
    }

    tr:nth-child(even) {
        background-color: #f8f8f8;
    }

    tr:hover {
        background-color: #eef1ff;
    }

    td {
        font-size: 15px;
        color: #333;
    }

    /* ===== Buttons ===== */
    a.action-btn {
        text-decoration: none;
        padding: 8px 14px;
        border-radius: 6px;
        font-size: 14px;
        font-weight: 600;
        color: #fff;
        transition: all 0.3s ease;
    }

    .edit-btn {
        background-color: #27ae60;
    }

    .edit-btn:hover {
        background-color: #1e8f52;
        transform: scale(1.05);
    }

    .delete-btn {
        background-color: #e74c3c;
    }

    .delete-btn:hover {
        background-color: #c0392b;
        transform: scale(1.05);
    }

    /* ===== Message Box ===== */
    .empty-msg {
        background-color: #fff;
        padding: 30px 50px;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
        font-size: 18px;
        color: #555;
        margin-top: 20px;
        animation: fadeIn 0.8s ease-in-out;
    }

    /* ===== Fade Animation ===== */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-15px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>
<%
    AdminBean abean = (AdminBean)session.getAttribute("AdminBean");
    ArrayList<ProductBean> al = (ArrayList<ProductBean>)session.getAttribute("ProductList");
%>

<h1>Hello, <%= abean.getA_fname() %> 👋 — Product Inventory</h1>

<%
    if (al == null || al.size() == 0) {
%>
    <div class="empty-msg">📦 Product inventory is currently empty.</div>
<%
    } else {
%>
    <table>
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Company</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        <%
            Iterator<ProductBean> i = al.iterator();
            while(i.hasNext()) {
                ProductBean pb = i.next();
        %>
        <tr>
            <td><%= pb.getP_code() %></td>
            <td><%= pb.getP_name() %></td>
            <td><%= pb.getP_company() %></td>
            <td>₹<%= pb.getP_price() %></td>
            <td><%= pb.getP_qty() %></td>
            <td>
                <a href="edit?pcode=<%= pb.getP_code() %>" class="action-btn edit-btn">Edit</a>
                <a href="delete?pcode=<%= pb.getP_code() %>" class="action-btn delete-btn">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
<%
    }
%>

</body>
</html>

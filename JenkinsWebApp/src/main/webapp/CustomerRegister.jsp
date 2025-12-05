<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management Portal</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background: #ffffff;
        padding: 40px 50px;
        border-radius: 12px;
        box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.15);
        text-align: center;
        max-width: 480px;
        width: 90%;
        animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }


    hr {
        border: none;
        height: 2px;
        background: #1cc88a;
        width: 60px;
        margin: 15px auto 25px;
        border-radius: 5px;
    }

    .message {
        color: #4e73df;
        font-size: 18px;
        font-weight: 500;
        margin-bottom: 30px;
        background: #f8f9fc;
        padding: 15px;
        border-radius: 8px;
        border-left: 5px solid #1cc88a;
    }

    .links {
        margin-top: 20px;
    }

    a {
        display: inline-block;
        background-color: #4e73df;
        color: #ffffff;
        text-decoration: none;
        padding: 12px 30px;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s ease;
        box-shadow: 0 4px 10px rgba(78, 115, 223, 0.3);
    }

    a:hover {
        background-color: #2e59d9;
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(78, 115, 223, 0.4);
    }

   

</style>
</head>

<body>
    <div class="container">
        <hr>

        <div class="message">
            <%
               String data = (String)request.getAttribute("msg");
            out.println(data);
            %>
        </div>

        <div class="links">
            <a href="CustomerLogin.html"> Add User Details</a>
        </div>

        
    </div>
</body>
</html>

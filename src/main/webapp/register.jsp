<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("Home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f1f3f5; }
    .register-container {
      width: 450px;
      margin: 80px auto;
      background: white;
      padding: 35px;
      border-radius: 10px;
      box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
    }
    input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
      width: 100%;
      padding: 12px;
      margin-top: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    input[type="submit"] {
      width: 100%;
      padding: 12px;
      background: #198754;
      border: none;
      color: white;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #157347;
    }
    .message {
      color: red;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <div class="register-container">
    <h2>Register</h2>
    <form action="register" method="post">
      <input type="text" name="name" placeholder="Full Name" required />
      <input type="email" name="email" placeholder="Email Address" required />
      <input type="tel" name="mobile" placeholder="Mobile Number" required pattern="[0-9]{10}" title="Enter a 10-digit mobile number" />
      <input type="password" name="password" placeholder="Password" required />
      <input type="submit" value="Register" />
    </form>
    <div class="message">
      <%
        String message = request.getParameter("message");
        if ("registered".equals(message)) {
          out.println("✅ Registration successful. You can now login.");
        } else if ("register_failed".equals(message)) {
          out.println("❌ Registration failed. Try again.");
        } else if ("error".equals(message)) {
          out.println("⚠️ Something went wrong.");
        }
      %>
    </div>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
  </div>
</body>
</html>

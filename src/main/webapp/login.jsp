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
  <title>Login</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f8f9fa; }
    .login-container {
      width: 400px;
      margin: 100px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
    }
    input[type="text"], input[type="password"] {
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
      background: #6f42c1;
      border: none;
      color: white;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }
    .message {
      color: red;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
      <input type="text" name="username" placeholder="Username" required />
      <input type="password" name="password" placeholder="Password" required />
      <input type="submit" value="Login" />
    </form>
    <div class="message">
      <%
        String message = request.getParameter("message");
        if ("invalid".equals(message)) {
          out.println("❌ Invalid username or password.");
        } else if ("error".equals(message)) {
          out.println("⚠️ Something went wrong.");
        }
      %>
    </div>
    <p>Don't have an account? <a href="register.jsp">Register</a></p>
  </div>
</body>
</html>

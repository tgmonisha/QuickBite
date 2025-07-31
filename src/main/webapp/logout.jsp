<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Destroys the current session
    response.sendRedirect("Home.jsp?message=logout_success"); // Redirect after logout
%>
    
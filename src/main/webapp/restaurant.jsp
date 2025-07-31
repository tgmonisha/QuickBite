<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Restaurant" %>
<%@ page import="java.util.*, com.project.DAO.RestaurantDAO, com.project.DAOImpl.RestaurantDAOImpl, com.project.model.Restaurant" %>
<%
    String keyword = request.getParameter("keyword");
    RestaurantDAO dao = new RestaurantDAOImpl();
    List<Restaurant> restaurants;

    if (keyword != null && !keyword.trim().isEmpty()) {
        restaurants = dao.searchRestaurants(keyword);
        request.setAttribute("message", "Showing results for: " + keyword);
    } else {
        restaurants = dao.getAllRestaurants();
        request.setAttribute("message", "All Restaurants");
    }
%>
<%@ page import="com.project.model.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Available Restaurants</title>
  <style>
        html {
            scroll-behavior: smooth;
        }
    </style>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <nav class="navbar">
    <div class="navbar-left">
      <img src="images/quickbitelogo.png" alt="Logo" class="logo">
      <div class="location">
        <span class="city">Bangalore</span>
        <span class="dropdown">▼</span>
      </div>
    </div>
    <div class="navbar-right">
      <a href="search.jsp">Search</a>
      <a href="offers.jsp">Offers</a>
      
      <a href="help.jsp">Help</a>
      <a href="cart.jsp">Cart</a>
      
      <a href="login.jsp">Login</a>
      <a href="logout.jsp">Logout</a>
      
      
    </div>
  </nav>

  <h1 class="title">Available Restaurants</h1>
  
  
  

 <div style="text-align: center; margin: 20px;">
    <input type="text" id="searchInput" onkeyup="searchRestaurants()" placeholder="🔍 Search by name, address, time, rating..." 
           style="padding:10px; width:350px; font-size:16px; border-radius: 10px; border: 1px solid #ccc; box-shadow: 2px 2px 5px #aaa;">
</div>
 
   

    <script>
        function toggleSearch() {
            const container = document.getElementById("searchContainer");
            container.style.display = container.style.display === "none" ? "block" : "none";
        }
    </script>

    <h2><%= request.getAttribute("message") %></h2>

    <h2><%= request.getAttribute("message") != null ? request.getAttribute("message") : "All Restaurants" %></h2>

<div id="restaurantList">
<% if (restaurants != null && !restaurants.isEmpty()) {
    for (Restaurant r : restaurants) { %>

    <div class="restaurant-card" style="margin: 15px; border: 1px solid #ddd; padding: 10px; border-radius: 8px;" data-name="<%= r.getName().toLowerCase() %>" data-address="<%= r.getAddress().toLowerCase() %>" data-time="<%= r.getDeliveryTime() %>" data-rating="<%= r.getRating() %>">
        <img src="<%= r.getImagePath() %>" alt="<%= r.getName() %>" style="width:150px;height:100px; border-radius:5px;">
        <h3><%= r.getName() %></h3>
        <p><strong>Address:</strong> <%= r.getAddress() %></p>
        <p><strong>Delivery Time:</strong> <%= r.getDeliveryTime() %> mins</p>
        <p><strong>Rating:</strong> <%= r.getRating() %> / 5</p>
    </div>

<% } } else { %>
    <p>No restaurants found.</p>
<% } %>
</div>
<script>
function searchRestaurants() {
    const input = document.getElementById("searchInput").value.toLowerCase();
    const cards = document.querySelectorAll("#restaurantList .restaurant-card");

    cards.forEach(card => {
        const name = card.getAttribute("data-name");
        const address = card.getAttribute("data-address");
        const time = card.getAttribute("data-time");
        const rating = card.getAttribute("data-rating");

        if (name.includes(input) || address.includes(input) || time.includes(input) || rating.includes(input)) {
            card.style.display = "block";
        } else {
            card.style.display = "none";
        }
    });
}
</script>





</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.project.model.Restaurant, java.util.List" %>
<%@ page import="com.project.model.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
%>
<% if (loggedInUser != null) { %>
  <p style="text-align:center; color: black; font-weight: bold;">👋 Welcome,to QuickBite Restaurants </p>
<% }
%>
<%
    String msg = request.getParameter("message");
    if ("logout_success".equals(msg)) {
%>
    <div style="color: green; font-weight: bold;">✅ You have successfully logged out.</div>
<%
    }
%>




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>QuickBite - Restaurants</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="styles.css">
  <style>
  
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background:  background: linear-gradient(to bottom right, #fff0f5, #e0ffff); /* pink to aqua gradient */
     
      color: #333;
    }
    .navbar {
      background-color: #87CEEB;
      color: black;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 20px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .navbar a {
      color: black;
      text-decoration: none;
      margin-left: 20px;
      font-weight: bold;
    }
    .logo {
      height: 40px;
    }
    .title {
      text-align: center;
      margin-top: 30px;
      font-size: 2.5em;
      color: #222;
    }
    .restaurant-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      padding: 30px;
    }
    .restaurant-card {
      background-color:#C0C0C0;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      width: 300px;
      text-align: center;
      transition: transform 0.2s ease;
    }
    .restaurant-card:hover {
      transform: translateY(-5px);
    }
    .restaurant-card img {
      background-color:#AFEEEE;
      width: 100%;
      height: 180px;
      border-top-left-radius: 15px;
      border-top-right-radius: 15px;
      object-fit: cover;
    }
    .restaurant-info {
      padding: 15px;
    }
    .restaurant-info h2 {
      margin: 10px 0 5px;
      color: #ff6f61;
    }
    .restaurant-info p {
      margin: 4px 0;
      color: #555;
    }
    .title {
      color: green;
      font-weight: bold;
     } 
     .city {
  font-weight: 600;
  font-size: 16px;
  color: #6a1b9a; /* Deep Purple or pick your own color */
  margin-left: 10px;
}
      
    .footer {
      background-color: #333;
      color: white;
      display: flex;
      justify-content: space-around;
      padding: 30px 10px;
      flex-wrap: wrap;
    }
    .footer-section h3 {
      color: #FF7F50;
    }
    .footer-section ul {
      list-style-type: none;
      padding: 0;
    }
    .footer-section ul li a {
      color: #FFFFFF;
      text-decoration: none;
      line-height: 1.8;
    }
    .modal-content {
      background-color: #ffe6e6;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
      width: 300px;
      margin: auto;
    }
    input, textarea, select, button {
      width: 100%;
      margin: 10px 0;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    button {
      background-color: #ff6f61;
      color: white;
      border: none;
      font-weight: bold;
    }
    #notification-bar {
      display: none;
      text-align: center;
      padding: 10px;
      font-weight: bold;
    }
    
  .city {
    font-size: 20px;
    color: #333;
    display: flex;
    align-items: center;
  }

  .glowing-pin {
    color: #d63384; /* Hot Pink */
    animation: pulse 1.5s infinite;
    font-size: 24px;
    margin-right: 8px;
  }

  @keyframes pulse {
    0% {
      text-shadow: 0 0 0px rgba(214, 51, 132, 0.8);
      transform: scale(1);
    }
    50% {
      text-shadow: 0 0 10px rgba(214, 51, 132, 0.8);
      transform: scale(1.2);
    }
    100% {
      text-shadow: 0 0 0px rgba(214, 51, 132, 0.8);
      transform: scale(1);
    }
  }

    
    
  </style>
</head>
<body>

<div id="notification-bar" class="notification-bar"></div>

<nav class="navbar">
  <div class="navbar-left">
    <img src="images/quickbitelogo.png" alt="Logo" class="logo">
    <div class="location">
  <span class="city">
    <i class="fas fa-map-marker-alt glowing-pin"></i> Bengaluru
  </span>
</div>
    
  </div>
  <div class="navbar-right">
    <a href="search.jsp">Search</a>
    <a href="offers.jsp">Offers</a>
    <a href="help.jsp">Help</a>
    <a href="cart.jsp">Cart</a>
    <% if (loggedInUser != null)
    { %>
      <a href="logout.jsp">Logout</a><% 
    } else {
    	%> <a href="#" onclick="toggleModals('login')">Login</a><% 
    	} %>
    
  </div>
</nav>



<h1 class="title">Available Restaurants</h1>
<%-- Show add button only if user is logged in (optional) --%>
<% if (loggedInUser != null) { %>
  <div class="top-link">
    <a href="Addrestaurant.html" class="add-btn"> Add Restaurants</a>
  </div>
<% } %>

<style>
  .add-btn {
    display: inline-block;
    background-color: rgb(0, 0, 255);
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 25px;
    text-decoration: none;
    transition: background-color 0.3s, transform 0.2s;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  .add-btn:hover {
    background-color: #0000cc;
    transform: scale(1.05);
  }

  .top-link {
    text-align: center;
    margin: 10px 0 20px 0;
  }
</style>


<div class="restaurant-container">
<%
    List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("allRestaurants");
    if (restaurants != null && !restaurants.isEmpty()) {
        for (Restaurant restaurant : restaurants) {
%>
  <div class="restaurant-card">
    <a href="menu?restaurantId=<%= restaurant.getResturantId() %>" style="text-decoration: none; color: inherit;">
      <img src="<%= restaurant.getImagePath() %>" alt="Not Available" />
      <div class="restaurant-info">
        <h2><%= restaurant.getName() %></h2>
        <p>⭐ <%= restaurant.getRating() %> · <%= restaurant.getDeliveryTime() %></p>
        <p class="desc"><%= restaurant.getCuisineType() %></p>
      </div>
    </a>
  </div>
<%
        }
    } else {
%>
    <p style="text-align: center; color: red;">No restaurants available.</p>
<%
    }
%>
</div>

<footer class="footer">
  <div class="footer-section">
    <h3>Company</h3>
    <ul>
      <li><a href="#">About us</a></li>
      <li><a href="#">Team</a></li>
      <li><a href="#">Careers</a></li>
      <li><a href="#">Blog</a></li>
    </ul>
  </div>
  <div class="footer-section">
    <h3>Contact</h3>
    <ul>
      <li><a href="#">Help & Support</a></li>
      <li><a href="#">Partner with us</a></li>
      <li><a href="#">Ride with us</a></li>
    </ul>
  </div>
  <div class="footer-section">
    <h3>Legal</h3>
    <ul>
      <li><a href="#">Terms & Conditions</a></li>
      <li><a href="#">Refund & Cancellation</a></li>
      <li><a href="#">Privacy Policy</a></li>
      <li><a href="#">Cookie Policy</a></li>
    </ul>
  </div>
  <div class="footer-section">
    <h3>Social</h3>
    <ul>
      <li><a href="#">Facebook</a></li>
      <li><a href="#">Twitter</a></li>
      <li><a href="#">Instagram</a></li>
      <li><a href="#">YouTube</a></li>
    </ul>
  </div>
</footer>

<!-- Modals and JS remain unchanged -->

<script>
function toggleModals(mode) {
  document.getElementById("registerModal").style.display = mode === 'register' ? 'flex' : 'none';
  document.getElementById("loginModal").style.display = mode === 'login' ? 'flex' : 'none';
}
function closeModals() {
  document.getElementById("registerModal").style.display = "none";
  document.getElementById("loginModal").style.display = "none";
}
window.onload = function () {
  const urlParams = new URLSearchParams(window.location.search);
  const message = urlParams.get("message");
  const notification = document.getElementById("notification-bar");

  if (message) {
    let text = "";
    let color = "#323232";
    if (message === "registered") {
      text = "✅ Registration Successful!";
      color = "#28a745";
    } else if (message === "register_failed") {
      text = "❌ Registration Failed!";
      color = "#dc3545";
    } else if (message === "login_success") {
      text = "✅ Login Successful!";
      color = "#28a745";
    } else if (message === "invalid") {
      text = "❌ Invalid Username or Password!";
      color = "#ffc107";
    } else if (message === "error") {
      text = "❌ Something went wrong!";
      color = "#dc3545";
    }

    notification.innerText = text;
    notification.style.backgroundColor = color;
    notification.style.display = "block";

    setTimeout(() => {
      notification.style.display = "none";
    }, 3000);
  }
}
</script>
<!-- LOGIN MODAL -->
<div id="loginModal" class="modal" style="display:none; position:fixed; z-index:999; left:0; top:0; width:100%; height:100%; overflow:auto; background-color: rgba(0,0,0,0.5); align-items:center; justify-content:center;">
  <div class="modal-content">
    <span onclick="closeModals()" style="float:right; cursor:pointer; font-weight:bold;">&times;</span>
    <h2 style="text-align:center;">Login</h2>
    <form action="login" method="post">
      <input type="text" name="username" placeholder="Username" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Login</button>
    </form>
    <p style="text-align:center;">Don't have an account? <a href="#" onclick="toggleModals('register')">Register</a></p>
  </div>
</div>
<!-- Inside <body> -->
<a href="#" onclick="openLoginModal()">Login</a>

<div id="loginModal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close" onclick="closeLoginModal()">&times;</span>
    <jsp:include page="login.jsp" />
  </div>
</div>

<script>
  function openLoginModal() {
    document.getElementById('loginModal').style.display = 'block';
  }

  function closeLoginModal() {
    document.getElementById('loginModal').style.display = 'none';
  }

  // Auto-close modal on successful login
  window.onload = function () {
    const message = '<%= request.getParameter("message") %>';
    if (message === "login_success") {
      alert("✅ Login successfully");
      closeLoginModal();
    } else if (message === "invalid") {
      alert("❌ Invalid login");
    }
  };
</script>

<style>
  .modal {
    position: fixed;
    z-index: 999;
    left: 0; top: 0; width: 100%; height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5);
  }
  .modal-content {
    background-color: white;
    margin: 10% auto;
    padding: 20px;
    width: 40%;
    border-radius: 10px;
    position: relative;
  }
  .close {
    position: absolute;
    right: 10px;
    top: 5px;
    font-size: 24px;
    font-weight: bold;
    color: red;
    cursor: pointer;
  }
</style>



</body>
</html>

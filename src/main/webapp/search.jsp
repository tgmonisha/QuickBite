<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.model.Restaurant, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <title>Search Restaurants</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    h1 {
      text-align: center;
      margin-top: 30px;
      color: #333;
    }

    form {
      display: flex;
      justify-content: center;
      margin: 30px 0;
    }

    input[type="text"] {
      width: 300px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 25px 0 0 25px;
      font-size: 16px;
      outline: none;
    }

    button {
      padding: 10px 20px;
      border: none;
      background-color: #ff6600;
      color: white;
      font-size: 16px;
      border-radius: 0 25px 25px 0;
      cursor: pointer;
    }

    button:hover {
      background-color: #e65c00;
    }

    .restaurant-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 20px;
    }

    .restaurant-card {
      background-color: white;
      width: 300px;
      padding: 20px;
      margin: 15px;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .restaurant-card:hover {
      transform: translateY(-5px);
    }

    .restaurant-card a {
      text-decoration: none;
      color: #333;
    }

    .restaurant-card h2 {
      margin: 0 0 10px;
      color: #ff6600;
    }

    .restaurant-card p {
      margin: 5px 0;
      color: #555;
    }

    .no-results {
      text-align: center;
      color: #777;
      font-size: 18px;
      margin-top: 20px;
    }
  </style>
</head>
<body>

  <h1>Search Restaurants</h1>

  <form action="search" method="get">
    <input type="text" name="keyword" placeholder="Search by name or cuisine" required>
    <button type="submit">Search</button>
  </form>

  <div class="restaurant-container">
    <%
      List<Restaurant> searchResults = (List<Restaurant>) request.getAttribute("searchResults");
      if (searchResults != null && !searchResults.isEmpty()) {
          for (Restaurant r : searchResults) {
    %>
      <div class="restaurant-card">
        <a href="menu?restaurantId=<%= r.getResturantId() %>">
          <h2><%= r.getName() %></h2>
          <p><%= r.getCuisineType() %> | ⭐ <%= r.getRating() %></p>
        </a>
      </div>
    <%
          }
      } else if (searchResults != null) {
    %>
      <div class="no-results">No results found.</div>
    <% } %>
  </div>

</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ page import="com.project.model.Restaurant, java.util.List" %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!--   <title>Search Restaurants</title> -->
<!-- </head> -->
<!-- <body> -->
<!--   <h1>Search Restaurants</h1> -->

<!--   <form action="search" method="get"> -->
<!--     <input type="text" name="keyword" placeholder="Search by name or cuisine" required> -->
<!--     <button type="submit">Search</button> -->
<!--   </form> -->

<!--   <div class="restaurant-container"> -->
<%--     <% --%>
    
<%--     %> --%>
<!--       <div class="restaurant-card"> -->
<%--         <a href="menu?restaurantId=<%= r.getResturantId() %>"> --%>
<%--           <h2><%= r.getName() %></h2> --%>
<%--           <p><%= r.getCuisineType() %> | ⭐ <%= r.getRating() %></p> --%>
<!--         </a> -->
<!--       </div> -->
<%--     <%  --%>

    
<%--     %> --%>
<!--       <p>No results found.</p> -->
<%--     <% } %> --%>
<!--   </div> -->
<!-- </body> -->
<!-- </html> -->


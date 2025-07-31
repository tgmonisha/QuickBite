package com.project.servlet;

import java.io.IOException;
import java.util.List;

import com.project.DAO.RestaurantDAO;
import com.project.DAOImpl.RestaurantDAOImpl;
import com.project.DAOImpl.UserDAOImpl;
import com.project.model.Restaurant;
import com.project.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String username = req.getParameter("username");
    String password = req.getParameter("password");

    UserDAOImpl dao = new UserDAOImpl();
    User user = dao.getUserByUsernameAndPassword(username, password); 

    if (user != null) {
        HttpSession session = req.getSession();
        session.setAttribute("user", user);

        // Fetch restaurant list
        RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
        List<Restaurant> restaurantList = restaurantDAO.getAllRestaurants();

        // Set in request
        req.setAttribute("allRestaurants", restaurantList);  // ✅ match Home.jsp code

        // Forward to Home.jsp
        RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
        rd.forward(req, res);
    } else {
        // Invalid login fallback
        res.sendRedirect("login.jsp?error=invalid_credentials");
    }
  }
}

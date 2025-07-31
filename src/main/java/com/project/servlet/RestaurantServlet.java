package com.project.servlet;

import java.io.IOException;
import java.util.List;

import com.project.DAO.RestaurantDAO;
import com.project.DAOImpl.RestaurantDAOImpl;
import com.project.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
        req.setAttribute("restaurants", restaurants);
        RequestDispatcher dispatcher = req.getRequestDispatcher("restaurant.jsp");
        dispatcher.forward(req, resp);
    }
}

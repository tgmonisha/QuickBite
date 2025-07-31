package com.project.DAOImpl;




import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.project.DAO.RestaurantDAO;
import com.project.model.Restaurant;
import com.project.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO{

	private String INSERT_RESTAURANT = "insert into `Restaurant` (`name`, `address`, `phoneNumber`, `cuisineType`, `DeliveryTime`, `adminUserId`, `rating`, `isActive`, `imagePath`) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private String GET_RESTAURANT_BYID = "select * from `Restaurant` where `restaurantId` = ?";
	private String UPDATE_RESTAURANT = "update `Restaurant` set `name` = ?, `address` = ?, `phoneNumber` = ?, `cuisineType` = ?, `DeliveryTime` = ?,  `adminUserId` = ?, `rating` = ?, `isActive` = ?, `imagePath` = ? where restaurantId = ?";
	private String DELETE_RESTAURANT_BYID = "DELETE from `Restaurant` where `restaurantId` = ?";
	private String GET_ALL_RESTAURANT = "select * from `Restaurant`";

	
	
	@Override
	public List<Restaurant> getAllRestaurants() {
		
		List<Restaurant> AllRestaurants = new ArrayList<Restaurant>();
		
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_RESTAURANT )){
			
			ResultSet res = preparedStatement.executeQuery();
			
			while(res.next()) {
				int id = res.getInt("restaurantId");
				String name = res.getString("name");
				String address = res.getString("address");
				String phonenumber = res.getString("phoneNumber");
				String cuisineType = res.getString("cuisineType");
				int deliverytime = res.getInt("deliveryTime");
				int adminuserId = res.getInt("adminUserId");
				Double rating = res.getDouble("rating");
				Boolean isActive = res.getBoolean("IsActive");
				String imagePath = res.getString("imagePath");
				Restaurant restaurant = new Restaurant(id, name, address, phonenumber, cuisineType, deliverytime, adminuserId, rating, isActive, imagePath);
				AllRestaurants.add(restaurant);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return AllRestaurants;
	}

	@Override
	public Restaurant getRestaurantById(int restaurantId) {
		Restaurant restaurant = null;
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_RESTAURANT_BYID )){
			preparedStatement.setInt(1, restaurantId);
			ResultSet res = preparedStatement.executeQuery();
			while(res.next()) {
				int id = res.getInt("restaurantId");
				String name = res.getString("name");
				String address = res.getString("address");
				String phonenumber = res.getString("phoneNumber");
				String cuisineType = res.getString("cuisineType");
				int deliveryTime = res.getInt("deliveryTime");
				int adminuserId = res.getInt("adminUserId");
				double rating = res.getDouble("rating");
				Boolean isActive = res.getBoolean("isActive");
				String imagePath = res.getString("imagePath");
				restaurant = new Restaurant(id, name, address, phonenumber, cuisineType, deliveryTime, adminuserId, rating, isActive, imagePath);
			}
			int i = preparedStatement.executeUpdate();
			System.out.println(i);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return restaurant;
	}
	@Override
	public List<Restaurant> searchRestaurants(String keyword) {
	    List<Restaurant> list = new ArrayList<>();
	    String sql = "SELECT * FROM Restaurant WHERE name LIKE ? OR address LIKE ? OR cuisineType LIKE ? OR deliveryTime LIKE ?";

	    try (
	        Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql)
	    ) {
	        ps.setString(1, "%" + keyword + "%");
	        ps.setString(2, "%" + keyword + "%");
	        ps.setString(3, "%" + keyword + "%");
	        ps.setString(4, "%" + keyword + "%");
	        
	        
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            int id = rs.getInt("restaurantId");
	            String name = rs.getString("name");
	            String address = rs.getString("address");
	            String phoneNumber = rs.getString("phoneNumber"); // ✅ correct column
	            String cuisineType = rs.getString("cuisineType");
	            int deliveryTime = rs.getInt("deliveryTime");
	            int adminUserId = rs.getInt("adminUserId");
	            double rating = rs.getDouble("rating");
	            boolean isActive = rs.getBoolean("isActive");
	            String imagePath = rs.getString("imagePath");

	            Restaurant restaurant = new Restaurant(
	                id, name, address, phoneNumber, cuisineType,
	                deliveryTime, adminUserId, rating, isActive, imagePath
	            );
	            list.add(restaurant);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	

	@Override
	public void addRestaurants(Restaurant restaurant) {
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESTAURANT);) {
			preparedStatement.setString(1, restaurant.getName());
			preparedStatement.setString(2, restaurant.getAddress());
			preparedStatement.setString(3, restaurant.getPhoneNumber());
			preparedStatement.setString(4, restaurant.getCuisineType());
			preparedStatement.setInt(5, restaurant.getDeliveryTime());
			preparedStatement.setInt(6, restaurant.getAdminuserId());
			preparedStatement.setDouble(7, restaurant.getRating());
			preparedStatement.setBoolean(8, restaurant.isActive());
			preparedStatement.setString(9, restaurant.getImagePath());
			int i = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RESTAURANT )) {
			
			preparedStatement.setString(1, restaurant.getName());
			preparedStatement.setString(2, restaurant.getAddress());
			preparedStatement.setString(3, restaurant.getPhoneNumber());
			preparedStatement.setString(4, restaurant.getCuisineType());
			preparedStatement.setInt(5, restaurant.getDeliveryTime());
			preparedStatement.setInt(6, restaurant.getAdminuserId());
			preparedStatement.setDouble(7, restaurant.getRating());
			preparedStatement.setBoolean(8, restaurant.isActive());
			preparedStatement.setString(8, restaurant.getImagePath());
			preparedStatement.setInt(8, restaurant.getResturantId());
			
			int i = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESTAURANT_BYID)){
			preparedStatement.setInt(1, restaurantId);
			int i = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

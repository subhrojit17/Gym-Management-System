package com.dao;

import com.entity.buying;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;


public class BuyingdaoImp implements BuyingDao {

    private Connection connection;

    public BuyingdaoImp(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<buying> getAllBookings() {
        List<buying> bookings = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM bookings");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                buying booking = extractFromBookingResultSet(resultSet);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return bookings;
    }

    @Override 
    public boolean processBuying(buying buying) {
        try (PreparedStatement statement = connection.prepareStatement(
                "INSERT INTO bookings (user_name, plan_id, booking_date) VALUES (?, ?, ?)")) {

            statement.setString(1, buying.getUserName());
            statement.setInt(2, buying.getPlanId());
            statement.setString(3, buying.getBookingDate());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
            return false;
        }
    }

    // Other methods...

    // Helper method to extract a Buying object from a ResultSet
    private buying extractFromBookingResultSet(ResultSet resultSet) throws SQLException {
        buying booking = new buying();
        booking.setBookingId(resultSet.getInt("booking_id"));
        booking.setUserName(resultSet.getString("user_name"));
        booking.setPlanId(resultSet.getInt("plan_id"));
        booking.setBookingDate(resultSet.getDate("booking_date").toString());
        return booking;
    }
}

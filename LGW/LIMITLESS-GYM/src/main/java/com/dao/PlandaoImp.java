package com.dao;

import com.dao.*;
import java.util.*;
import com.entity.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlandaoImp implements PlanDao {

    private Connection connection;

    public PlandaoImp(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<PlanDtls> getAllPlans() {
        List<PlanDtls> plans = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM plans");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                PlanDtls plan = extractPlanFromResultSet(resultSet);
                plans.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return plans;
    }

    @Override
    public PlanDtls getPlanById(int planId) {
        PlanDtls plan = null;

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM plans WHERE plan_id = ?");
             ResultSet resultSet = statement.executeQuery()) {

            statement.setInt(1, planId);

            if (resultSet.next()) {
                plan = extractPlanFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return plan;
    }

    @Override
    public PlanDtls getPlanByName(String planName) {
        PlanDtls plan = null;

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM plans WHERE plan_name = ?");
             ResultSet resultSet = statement.executeQuery()) {

            statement.setString(1, planName);

            if (resultSet.next()) {
                plan = extractPlanFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        return plan;
    }

    @Override
    public void addPlan(PlanDtls plan) {
        try (PreparedStatement statement = connection.prepareStatement(
                "INSERT INTO plans (plan_name, specification1, specification2, duration, price) " +
                        "VALUES (?, ?, ?, ?, ?)")) {

            statement.setString(1, plan.getPlanName());
            statement.setString(2, plan.getSpecification1());
            statement.setString(3, plan.getSpecification2());
            statement.setString(4, plan.getDuration());
            statement.setString(5, plan.getPrice());
            

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    @Override
    public void updatePlan(PlanDtls plan) {
        try (PreparedStatement statement = connection.prepareStatement(
                "UPDATE plans SET plan_name = ?, specification1 = ?, specification2 = ?, " +
                        "duration = ?, price = ? WHERE plan_id = ?")) {

            statement.setString(1, plan.getPlanName());
            statement.setString(2, plan.getSpecification1());
            statement.setString(3, plan.getSpecification2());
            statement.setString(4, plan.getDuration());
            statement.setString(5, plan.getPrice());
        
            statement.setInt(7, plan.getPlanId());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    @Override
    public void deletePlan(int planId) {
        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM plans WHERE plan_id = ?")) {

            statement.setInt(1, planId);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    // Helper method to extract a PlanDtls object from a ResultSet
    private PlanDtls extractPlanFromResultSet(ResultSet resultSet) throws SQLException {
        PlanDtls plan = new PlanDtls();
        plan.setPlanId(resultSet.getInt("plan_id"));
        plan.setPlanName(resultSet.getString("plan_name"));
        plan.setSpecification1(resultSet.getString("specification1"));
        plan.setSpecification2(resultSet.getString("specification2"));
        plan.setDuration(resultSet.getString("duration"));
        plan.setPrice(resultSet.getString("price"));
       
        return plan;
    }
}

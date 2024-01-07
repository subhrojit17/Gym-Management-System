package com.dao;

import java.util.List;

import com.entity.PlanDtls;
import com.entity.buying;
import com.DB.*;
import java.util.List;


public interface PlanDao {
    List<PlanDtls> getAllPlans();
    PlanDtls getPlanById(int planId);
    PlanDtls getPlanByName(String planName);
    void addPlan(PlanDtls plan);
    void updatePlan(PlanDtls plan);
    void deletePlan(int planId);
}

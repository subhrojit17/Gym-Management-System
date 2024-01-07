package com.dao;

import com.entity.buying;

import java.util.List;

public interface BuyingDao {
    boolean processBuying(buying buying);
    List<buying> getAllBookings();

}

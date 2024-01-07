package com.entity;

import java.util.Objects;

public class buying {
    private int bookingId;
    private String userName;
    private int planId;
    private String bookingDate;

    // Constructors

    public buying() {
    }

    public buying(String userName, int planId, String bookingDate) {
        this.userName = userName;
        this.planId = planId;
        this.bookingDate = bookingDate;
    }

    // Getters and Setters

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    // Equals and HashCode (Optional but recommended for proper comparison)

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        buying buying = (buying) o;
        return bookingId == buying.bookingId &&
                planId == buying.planId &&
                Objects.equals(userName, buying.userName) &&
                Objects.equals(bookingDate, buying.bookingDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bookingId, userName, planId, bookingDate);
    }

    // ToString (Optional but useful for logging and debugging)

    @Override
    public String toString() {
        return "Buying{" +
                "bookingId=" + bookingId +
                ", userName='" + userName + '\'' +
                ", planId=" + planId +
                ", bookingDate='" + bookingDate + '\'' +
                '}';
    }
}

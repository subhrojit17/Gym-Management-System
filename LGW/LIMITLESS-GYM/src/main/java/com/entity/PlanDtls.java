package com.entity;

public class PlanDtls {
    private int planId;
    private String planName;
    private String specification1;
    private String specification2;
    private String duration;
    private String price;

    // Constructors, getters, and setters
    

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getSpecification1() {
		return specification1;
	}

	public void setSpecification1(String specification1) {
		this.specification1 = specification1;
	}

	public String getSpecification2() {
		return specification2;
	}

	public void setSpecification2(String specification2) {
		this.specification2 = specification2;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}



	@Override
	public String toString() {
		return "PlanDtls [planId=" + planId + ", planName=" + planName + ", specification1=" + specification1
				+ ", specification2=" + specification2 + ", duration=" + duration + ", price=" + price + "]";
	}

	

}

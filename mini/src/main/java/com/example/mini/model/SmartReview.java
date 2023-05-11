package com.example.mini.model;


public class SmartReview {
	private Integer productNo ; 
	private String nick ;
	private Integer satisfactionGrade;
	private Integer repurchaseGrade; 
	private Integer deliveryGrade;
	private String cdatetime;
	private String productName;
	private Integer rId;
	
	
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public Integer getSatisfactionGrade() {
		return satisfactionGrade;
	}
	public void setSatisfactionGrade(Integer satisfactionGrade) {
		this.satisfactionGrade = satisfactionGrade;
	}
	public Integer getRepurchaseGrade() {
		return repurchaseGrade;
	}
	public void setRepurchaseGrade(Integer repurchaseGrade) {
		this.repurchaseGrade = repurchaseGrade;
	}
	public Integer getDeliveryGrade() {
		return deliveryGrade;
	}
	public void setDeliveryGrade(Integer deliveryGrade) {
		this.deliveryGrade = deliveryGrade;
	}
	public String getCdatetime() {
		return cdatetime;
	}
	public void setCdatetime(String cdatetime) {
		this.cdatetime = cdatetime;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getrId() {
		return rId;
	}
	public void setrId(Integer rId) {
		this.rId = rId;
	}


}

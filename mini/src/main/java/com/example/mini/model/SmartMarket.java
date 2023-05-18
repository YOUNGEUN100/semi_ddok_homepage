package com.example.mini.model;

public class SmartMarket {
	private Integer productNo ; 
	private String productName ; 
	private String productKind ; 
	private Integer productWeight; 
	private Integer productEa; 
	private String productVolume; 
	private String title; 
	private String content; 
	private Integer productPrice; 
	private Integer productStock; 
	private Integer productCnt; 
	private String discountYN; 
	private String deleteYN;
	private String imgPath;
	private String imgName;
	private Float satisfactionGrade;
	private Float repurchaseGrade;
	private Float deliveryGrade;
	private String orderDate;
	private int orderPrice;
	private String orderPrice2;
	private String orderNo;
	private Integer orderCnt;
	private String userId;
	private String weight; // productWeight + productVolumn 결합 해놓음.
	private String productPrice2; //세자리 수마다 , 찍는 역할.
	private String perPrice;
	private String name;
	
	
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductKind() {
		return productKind;
	}
	public void setProductKind(String productKind) {
		this.productKind = productKind;
	}
	public Integer getProductWeight() {
		return productWeight;
	}
	public void setProductWeight(Integer productWeight) {
		this.productWeight = productWeight;
	}
	public Integer getProductEa() {
		return productEa;
	}
	public void setProductEa(Integer productEa) {
		this.productEa = productEa;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getProductStock() {
		return productStock;
	}
	public void setProductStock(Integer productStock) {
		this.productStock = productStock;
	}
	public Integer getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(Integer productCnt) {
		this.productCnt = productCnt;
	}
	public String getDiscountYN() {
		return discountYN;
	}
	public void setDiscountYN(String discountYN) {
		this.discountYN = discountYN;
	}
	public String getDeleteYN() {
		return deleteYN;
	}
	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getProductVolume() {
		return productVolume;
	}
	public void setProductVolume(String productVolume) {
		this.productVolume = productVolume;
	}
	public String getImgName() {
		return imgName;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Integer getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}
	
	public Integer getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(Integer orderCnt) {
		this.orderCnt = orderCnt;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderPrice2() {
		return orderPrice2;
	}
	public void setOrderPrice2(String orderPrice2) {
		this.orderPrice2 = orderPrice2;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getProductPrice2() {
		return productPrice2;
	}
	public void setProductPrice2(String productPrice2) {
		this.productPrice2 = productPrice2;
	}
	public String getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(String perPrice) {
		this.perPrice = perPrice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Float getSatisfactionGrade() {
		return satisfactionGrade;
	}
	public void setSatisfactionGrade(Float satisfactionGrade) {
		this.satisfactionGrade = satisfactionGrade;
	}
	public Float getRepurchaseGrade() {
		return repurchaseGrade;
	}
	public void setRepurchaseGrade(Float repurchaseGrade) {
		this.repurchaseGrade = repurchaseGrade;
	}
	public Float getDeliveryGrade() {
		return deliveryGrade;
	}
	public void setDeliveryGrade(Float deliveryGrade) {
		this.deliveryGrade = deliveryGrade;
	}
	


}

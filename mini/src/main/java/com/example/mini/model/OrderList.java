package com.example.mini.model;

public class OrderList {
	
	private String orderDate;
	private int orderPrice;
	private String orderPrice2; // 총 금액 합
	private String orderNo;
	private Integer orderCnt;
	private String userId;
	private String weight; // productWeight + productVolumn 결합 해놓음.
	private String productPrice2; //세자리 수마다 , 찍는 역할.
	private String perPrice;
	private String status; // 배송상태
	private String userName;//user name
	private String addr;
	private String addr2;
	private String hp;
	private String payment;
	private int productNo ; 
	private String productName ; 
	private Integer productWeight; 
	private Integer productEa; 
	private String productVolume; 
	private String title; 
	private String content; 
	private Integer productPrice; 
	private String imgPath;
	private Float satisfactionGrade;//상품만족도
	private Float repurchaseGrade;//재구매의사
	private Float deliveryGrade;//배송만족도
	private Float starAvg;// 평점 평균
	
	
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderPrice2() {
		return orderPrice2;
	}
	public void setOrderPrice2(String orderPrice2) {
		this.orderPrice2 = orderPrice2;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(Integer orderCnt) {
		this.orderCnt = orderCnt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
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
	public String getProductVolume() {
		return productVolume;
	}
	public void setProductVolume(String productVolume) {
		this.productVolume = productVolume;
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
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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
	public Float getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(Float starAvg) {
		this.starAvg = starAvg;
	}
}

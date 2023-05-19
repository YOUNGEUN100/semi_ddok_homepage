package com.example.mini.model;

public class Product {
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
	private String[] ingList;//투데잇 상품 추천용 리스트
	
	
	
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
	public String[] getIngList() {
		return ingList;
	}
	public void setIngList(String[] ingList) {
		this.ingList = ingList;
	}
	
}

package com.example.mini.model;

public class Recipe {

	
	private int recipeNo;
	private String recipeName;
	private String time;
	private String difficulty;
	private int recipeHits;
	private String deleteYn;
	private String hashtag;
	private String cdatetime;
	private String udatetime;
	private String cookIngre;
	private String imgPath;
	private String pcode;
	private String hcode;
	private String tcode;
	private String tname;
	private String[] icode;
	private int cookIndex;
	private String cookContent;
	private String thumbnailYn;

	private String userId;
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public int getRecipeHits() {
		return recipeHits;
	}
	public void setRecipeHits(int recipeHits) {
		this.recipeHits = recipeHits;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getCdatetime() {
		return cdatetime;
	}
	public void setCdatetime(String cdatetime) {
		this.cdatetime = cdatetime;
	}
	public String getUdatetime() {
		return udatetime;
	}
	public void setUdatetime(String udatetime) {
		this.udatetime = udatetime;
	}
	public String getCookIngre() {
		return cookIngre;
	}
	public void setCookIngre(String cookIngre) {
		this.cookIngre = cookIngre;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getHcode() {
		return hcode;
	}
	public void setHcode(String hcode) {
		this.hcode = hcode;
	}
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String[] getIcode() {
		return icode;
	}
	public void setIcode(String[] icode) {
		this.icode = icode;
	}
	public int getCookIndex() {
		return cookIndex;
	}
	public void setCookIndex(int cookIndex) {
		this.cookIndex = cookIndex;
	}
	public String getCookContent() {
		return cookContent;
	}
	public void setCookContent(String cookContent) {
		this.cookContent = cookContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getThumbnailYn() {
		return thumbnailYn;
	}
	public void setThumbnailYn(String thumbnailYn) {
		this.thumbnailYn = thumbnailYn;
	}

	
}

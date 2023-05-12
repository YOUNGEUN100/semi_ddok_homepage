package com.example.mini.model;

public class TodayEat {
	private int recipeNo;
	private String recipeName;
	private String r_purpose;
	private String purpose;
	private String howto;
	private String[] ingredient;
	private String tool;
	private String cookIngre;
	
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
	public String getR_purpose() {
		return r_purpose;
	}
	public void setR_purpose(String r_purpose) {
		this.r_purpose = r_purpose;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getHowto() {
		return howto;
	}
	public void setHowto(String howto) {
		this.howto = howto;
	}
	public String[] getIngredient() {
		return ingredient;
	}
	public void setIngredient(String[] ingredient) {
		this.ingredient = ingredient;
	}
	public String getTool() {
		return tool;
	}
	public void setTool(String tool) {
		this.tool = tool;
	}
	public String getCookIngre() {
		return cookIngre;
	}
	public void setCookIngre(String cookIngre) {
		this.cookIngre = cookIngre;
	}
}
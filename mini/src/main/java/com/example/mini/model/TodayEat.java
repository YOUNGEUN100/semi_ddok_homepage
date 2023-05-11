package com.example.mini.model;

public class TodayEat {
	private int recipeNo;
	private String recipeName;
	private String purpose;
	private String howTo;
	private String ingredient;
	private String tool;
	
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
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getHowTo() {
		return howTo;
	}
	public void setHowTo(String howTo) {
		this.howTo = howTo;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getTool() {
		return tool;
	}
	public void setTool(String tool) {
		this.tool = tool;
	}
	
}


/*
SELECT R.RECIPE_NO, RECIPE_NAME, COOK_INGRE
FROM mini_db2.T4_RECIPE AS R
INNER JOIN mini_db2.T4_R_PURPOSE AS P ON R.RECIPE_NO = P.RECIPE_NO
INNER JOIN mini_db2.T4_HOWTO AS H ON R.RECIPE_NO = H.RECIPE_NO
INNER JOIN mini_db2.T4_INGREDIENT AS I ON R.RECIPE_NO = I.RECIPE_NO
INNER JOIN mini_db2.T4_TOOL AS T ON R.RECIPE_NO = T.RECIPE_NO
WHERE P.CODE = 'SNA' AND
	  H.CODE = 'ETC' AND
	  I.CODE = 'VEG' AND
	  T.CODE = 'OVE';
*/
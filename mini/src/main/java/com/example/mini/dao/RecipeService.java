package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Code;
import com.example.mini.model.Recipe;

public interface RecipeService {
	
	// 레시피 게시판 리스트(전체)
		List<Recipe> searchRecListAll(HashMap<String, Object> map) throws Exception;
		
	// 레시피 게시판 리스트
		List<Recipe> searchRecList(HashMap<String, Object> map) throws Exception;
		
	// 레시피 분류
		List<Code> searchRecipeKind(HashMap<String, Object> map);
		
	
}

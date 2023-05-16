package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Recipe;

public interface MyService {
	
	//레시피 저장
	List<Recipe> searchLikeRecipe(HashMap<String, Object>map);
}

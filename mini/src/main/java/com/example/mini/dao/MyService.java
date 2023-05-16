package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.My;

public interface MyService {
	
	//레시피 저장
	My searchLikeRecipe(HashMap<String, Object>map);
}

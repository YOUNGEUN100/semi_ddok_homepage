package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.TodayEat;

public interface TodayEatService {
	//맛집메뉴 추천
	TodayEat searchStoreInfo(HashMap<String, Object> hmap);
	
	//레시피 추천
	TodayEat searchRecipeInfo(HashMap<String, Object> hmap);
}

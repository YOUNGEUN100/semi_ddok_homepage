package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.TodayEat;

public interface TodayEatService {
	//맛집메뉴 추천
	TodayEat searchStoreInfo(HashMap<String, Object>map);
	
	//레시피 추천
	TodayEat searchRecipeInfo(HashMap<String, Object>map);
}

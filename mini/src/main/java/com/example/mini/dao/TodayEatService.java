package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Product;
import com.example.mini.model.TodayEat;

public interface TodayEatService {
	//맛집메뉴 추천
	TodayEat searchStoreInfo(HashMap<String, Object> hmap);
	
	//전체 메뉴 랜덤 추천
	TodayEat searchMenuRandom(HashMap<String, Object> hmap);
	
	//레시피 추천
	TodayEat searchRecipeInfo(HashMap<String, Object> hmap);
	
	// 구매유도 리스트
	List<TodayEat> searchProduct(HashMap<String, Object> map);
	
	//전체 레시피 랜덤 추천
	TodayEat searchRecipeRandom(HashMap<String, Object> hmap);
}

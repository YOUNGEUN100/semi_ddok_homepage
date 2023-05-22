package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Product;
import com.example.mini.model.TodayEat;

@Mapper
public interface TodayEatMapper {
	//맛집메뉴 추천
	TodayEat selectStoreInfo(HashMap<String, Object> hmap);
	
	//맛집메뉴 랜덤 추천
	TodayEat selectMenuRandom(HashMap<String, Object> hmap);
	
	//레시피 추천
	TodayEat selectRecipeInfo(HashMap<String, Object> hmap);
	
	// 구매유도 리스트
	List<TodayEat> selectProduct(HashMap<String, Object> map);
	
	//맛집메뉴 랜덤 추천
	TodayEat selectRecipeRandom(HashMap<String, Object> hmap);
}

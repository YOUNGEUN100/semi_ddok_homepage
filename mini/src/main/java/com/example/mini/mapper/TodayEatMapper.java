package com.example.mini.mapper;

import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;
import com.example.mini.model.TodayEat;

@Mapper
public interface TodayEatMapper {
	//맛집메뉴 추천
	TodayEat selectStoreInfo(HashMap<String, Object>map);
	
	//레시피 추천
	TodayEat selectRecipeInfo(HashMap<String, Object>map);
}

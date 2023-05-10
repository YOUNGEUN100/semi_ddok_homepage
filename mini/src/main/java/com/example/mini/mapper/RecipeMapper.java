package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Recipe;

@Mapper
public interface RecipeMapper {
	
	// 레시피 게시판 리스트
		List<Recipe> selectRecList(HashMap<String, Object> map);
	
}

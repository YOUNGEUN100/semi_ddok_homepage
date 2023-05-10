package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Code;
import com.example.mini.model.Recipe;

@Mapper
public interface RecipeMapper {
	
	// 레시피 게시판 리스트(전체)
	List<Recipe> selectRecListAll(HashMap<String, Object> map);
		
	// 레시피 게시판 리스트
	List<Recipe> selectRecList(HashMap<String, Object> map);
		
	// 레시피 분류
	List<Code> selectRecipeKind(HashMap<String, Object> map);
	
}

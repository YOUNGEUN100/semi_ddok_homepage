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
		
	// 목적별 레시피 게시판 리스트
	List<Recipe> selectRecListPur(HashMap<String, Object> map);
	
	// 방법별 레시피 게시판 리스트
	List<Recipe> selectRecListHow(HashMap<String, Object> map);
		
	// 도구별 레시피 게시판 리스트
	List<Recipe> selectRecListTool(HashMap<String, Object> map);
		
	// 레시피 분류
	List<Code> selectRecipeKind(HashMap<String, Object> map);
	
	// 레시피 상세정보
	Recipe selectRecipeInfo(HashMap<String, Object>map);
	
	// 만드는 방법 리스트
	List<Recipe> selectCookList(HashMap<String, Object> map);
	
	// 조회수 증가
	void updateRecipeCnt(HashMap<String, Object> map);
	
}

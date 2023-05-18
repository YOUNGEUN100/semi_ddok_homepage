package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Code;
import com.example.mini.model.Recipe;

public interface RecipeService {
	
	// 마이페이지 레시피 저장
	void AddMypageRecipe(HashMap<String, Object>map);
	// 마이페이지 중복 레시피 번호 확인
	int checkRecipeNo(HashMap<String, Object> map);
	
	// 레시피 게시판 리스트(전체)
	HashMap<String, Object> searchRecListAll(HashMap<String, Object> map) throws Exception;
		
	// 목적별 레시피 게시판 리스트
	HashMap<String, Object> searchRecListPur(HashMap<String, Object> map) throws Exception;
	// 방법별 레시피 게시판 리스트
	HashMap<String, Object> searchRecListHow(HashMap<String, Object> map) throws Exception;
	// 도구별 레시피 게시판 리스트
	HashMap<String, Object> searchRecListTool(HashMap<String, Object> map) throws Exception;
		
	// 레시피 분류
	List<Code> searchRecipeKind(HashMap<String, Object> map);
	
	// 레시피 상세정보
	Recipe searchRecipeInfo(HashMap<String, Object> map);
	
	// 만드는 방법 리스트
	List<Recipe> searchCookList(HashMap<String, Object> map) throws Exception;
	
	//레시피 등록
	void addRecipe(HashMap<String, Object>map);
	
	// 레시피 썸네일 이미지 등록
	void AddRecipeImg(HashMap<String, Object>map);
	
	// 중복 레시피 번호 확인
	int searchRecipeNoCnt(HashMap<String, Object> map);
}

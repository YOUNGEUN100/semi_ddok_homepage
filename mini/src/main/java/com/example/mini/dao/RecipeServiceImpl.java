package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.RecipeMapper;
import com.example.mini.model.Code;
import com.example.mini.model.Recipe;

@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired //Mapper와 연결
	private RecipeMapper recipeMapper;

	@Override
	public HashMap<String, Object> searchRecListAll(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap.put("cnt", recipeMapper.selectRecListCnt(map));
		resultMap.put("list", recipeMapper.selectRecListAll(map));
		resultMap.put("result","success");
		return resultMap;
	}
	
	@Override
	public List<Recipe> searchRecListPur(HashMap<String, Object> map) throws Exception {
		List<Recipe> list = recipeMapper.selectRecListPur(map);
		return list;
	}
	@Override
	public List<Recipe> searchRecListHow(HashMap<String, Object> map) throws Exception {
		List<Recipe> list = recipeMapper.selectRecListHow(map);
		return list;
	}
	@Override
	public List<Recipe> searchRecListTool(HashMap<String, Object> map) throws Exception {
		List<Recipe> list = recipeMapper.selectRecListTool(map);
		return list;
	}

	@Override
	public List<Code> searchRecipeKind(HashMap<String, Object> map) {
		return recipeMapper.selectRecipeKind(map);
	}

	// 레시피 상세 정보
	@Override
	public Recipe searchRecipeInfo(HashMap<String, Object> map) {
		Recipe info = recipeMapper.selectRecipeInfo(map);
		if(info != null) {
			recipeMapper.updateRecipeCnt(map);
		}
		return info;
	}
	
	// 만드는 방법 리스트
	@Override
	public List<Recipe> searchCookList(HashMap<String, Object> map) throws Exception {
		List<Recipe> list = recipeMapper.selectCookList(map);
		return list;
	}

	// 레시피 등록
	@Override
	public void addRecipe(HashMap<String, Object> map) {
		recipeMapper.insertRecipe(map);
		recipeMapper.insertPurposeCode(map);
		recipeMapper.insertHowtoCode(map);
		recipeMapper.insertToolCode(map);
		recipeMapper.insertRecipeImg(map);
	}
	
	

}

package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.RecipeMapper;
import com.example.mini.model.Code;
import com.example.mini.model.Funding;
import com.example.mini.model.Recipe;

@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired //Mapper와 연결
	private RecipeMapper recipeMapper;

	@Override
	public List<Recipe> searchRecListAll(HashMap<String, Object> map) throws Exception {
		List<Recipe> list = recipeMapper.selectRecListAll(map);
		return list;
	}
	
	@Override
	public List<Recipe> searchRecList(HashMap<String, Object> map) throws Exception {
		List<Recipe> list = recipeMapper.selectRecList(map);
		return list;
	}

	@Override
	public List<Code> searchRecipeKind(HashMap<String, Object> map) {
		return recipeMapper.selectRecipeKind(map);
	}
	

}

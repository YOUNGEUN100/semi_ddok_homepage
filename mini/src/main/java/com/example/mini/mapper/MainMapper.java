package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Main;
import com.example.mini.model.Recipe;

@Mapper
public interface MainMapper {
	List<Main> selectFundingList(HashMap<String, Object> map);
	
	List<Recipe> selectRandRecipeList(HashMap<String, Object> map);
}

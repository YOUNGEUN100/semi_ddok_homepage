package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Community;
import com.example.mini.model.Funding;
import com.example.mini.model.Recipe;

@Mapper
public interface MainMapper {
	List<Funding> selectFundingList(HashMap<String, Object> map);
	
	List<Recipe> selectRandRecipeList(HashMap<String, Object> map);
	
	List<Community> selectRanPolList(HashMap<String, Object> map);
	
}

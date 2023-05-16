package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Recipe;

@Mapper
public interface MyMapper {
	
	//레시피 저장
	List<Recipe> selectLikeRecipe(HashMap<String, Object>map);
}

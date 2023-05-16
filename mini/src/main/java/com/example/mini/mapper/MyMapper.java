package com.example.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.My;

@Mapper
public interface MyMapper {
	
	//레시피 저장
	My selectLikeRecipe(HashMap<String, Object>map);
}

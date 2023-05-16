package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MyMapper;
import com.example.mini.model.Recipe;

@Service
public class MyServiceImpl implements MyService{
	
	@Autowired
	MyMapper myMapper;
	
	@Override
	public List<Recipe> searchLikeRecipe(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myMapper.selectLikeRecipe(map);
	}

}

package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MainMapper;
import com.example.mini.model.Funding;
import com.example.mini.model.Recipe;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired // Mapper와 연결
	private MainMapper mainMapper;
	
	// 펀딩 리스트
	@Override
	public List<Funding> searchFundingList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = mainMapper.selectFundingList(map);
		return list;
	}
	
	@Override
	public List<Recipe> searchRandRecipeList(HashMap<String, Object> map) throws Exception {
		List<Recipe> list = mainMapper.selectRandRecipeList(map);
		return list;
	}

}

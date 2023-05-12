package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.TodayEatMapper;
import com.example.mini.model.TodayEat;

@Service
public class TodayEatServiceImpl implements TodayEatService{

	@Autowired //Mapper와 연결
	private TodayEatMapper todayEatMapper;

	@Override
	public TodayEat searchStoreInfo(HashMap<String, Object> map) {
		return null;
	}

	@Override
	public TodayEat searchRecipeInfo(HashMap<String, Object> map) {
		TodayEat info = todayEatMapper.selectRecipeInfo(map);
		return info;
	}

}

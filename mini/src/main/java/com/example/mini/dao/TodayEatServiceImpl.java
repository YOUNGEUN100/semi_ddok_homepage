package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.TodayEatMapper;
import com.example.mini.model.Product;
import com.example.mini.model.TodayEat;

@Service
public class TodayEatServiceImpl implements TodayEatService{

	@Autowired //Mapper와 연결
	private TodayEatMapper todayEatMapper;

	@Override
	public TodayEat searchStoreInfo(HashMap<String, Object> hmap) {
		TodayEat info = todayEatMapper.selectStoreInfo(hmap);
		return info;
	}

	@Override
	public TodayEat searchRecipeInfo(HashMap<String, Object> hmap) {
		TodayEat info = todayEatMapper.selectRecipeInfo(hmap);
		return info;
	}
	
	// 구매유도 리스트
	@Override
	public List<TodayEat> searchProduct(HashMap<String, Object> map) {
		List<TodayEat> list =  todayEatMapper.selectProduct(map);
		return list;
	}

}

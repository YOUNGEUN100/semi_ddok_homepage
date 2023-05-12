package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MainMapper;
import com.example.mini.model.Main;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired // Mapper와 연결
	private MainMapper mainMapper;
	
	// 펀딩 리스트
	@Override
	public List<Main> searchFundingList(HashMap<String, Object> map) throws Exception {
		List<Main> list = mainMapper.selectFundingList(map);
		return list;
	}

}

package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.LivingMapper;
import com.example.mini.model.Living;

@Service
public class LivingServiceImpl implements LivingService{
	
	@Autowired // Mapper와 연결
	private LivingMapper livingMapper;

	@Override //카드 리스트
	public List<Living> searchCardList(HashMap<String, Object> map) {
		List<Living> list = livingMapper.selectCardList(map);
		return list;
	}

	@Override //카드 슬라이드
	public List<Living> searchCardInfo(HashMap<String, Object> map) {
		List<Living> list = livingMapper.selectCardInfo(map);
		return list;
	}
	
	

}

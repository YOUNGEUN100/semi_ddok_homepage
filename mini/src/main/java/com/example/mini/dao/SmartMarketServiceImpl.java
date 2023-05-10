package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.SmartMarketMapper;
import com.example.mini.model.Code;

@Service
public class SmartMarketServiceImpl implements SmartMarketService{

	@Autowired
	SmartMarketMapper smartmarketMapper; //mapper 객체생성
	
	
	@Override
	public HashMap<String, Object> searchSmartMarketList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		resultMap.put("list",smartmarketMapper.selectSmartMarketList(map));
		resultMap.put("result","success");
		
		return resultMap;
	}


	@Override
	public List<Code> searchSmartMarketKind(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return smartmarketMapper.selectSmartMarketKind(map);
	}	
	
}

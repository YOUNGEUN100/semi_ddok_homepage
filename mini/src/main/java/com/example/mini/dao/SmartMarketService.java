package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Code;

public interface SmartMarketService {
	//상품 조회
	HashMap<String, Object> searchSmartMarketList(HashMap<String, Object> map) throws Exception;
	
	// 제품 종류 목록
	List<Code> searchSmartMarketKind(HashMap<String, Object> map);
}

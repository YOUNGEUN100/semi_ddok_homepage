package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Code;
import com.example.mini.model.SmartMarket2;

public interface SmartMarketService {
	//상품 조회
	HashMap<String, Object> searchSmartMarketList(HashMap<String, Object> map) throws Exception;
	//List<SmartMarket> searchSmartMarketList(HashMap<String, Object> map);
	
	//추천상품 조회
	HashMap<String, Object> searchSmartMarketRecommendList(HashMap<String, Object> map) throws Exception;
	
	// 상품정보
	HashMap<String, Object> searchSmartMarketInfo(HashMap<String, Object> map);
	
	// 상품 이미지 목록
	HashMap<String, Object> searchSmartMarketImgList(HashMap<String, Object> map) throws Exception;
	
	// 제품 종류 목록
	List<Code> searchSmartMarketKind(HashMap<String, Object> map);
}

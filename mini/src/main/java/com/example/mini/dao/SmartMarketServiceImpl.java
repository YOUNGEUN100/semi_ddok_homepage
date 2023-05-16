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
	
	
	//상품리스트
	@Override
	public HashMap<String, Object> searchSmartMarketList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		resultMap.put("list",smartmarketMapper.selectSmartMarketList(map));
		resultMap.put("result","success");
		
		return resultMap;
	}

	//상품 코드 리스트
	@Override
	public List<Code> searchSmartMarketKind(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return smartmarketMapper.selectSmartMarketKind(map);
	}

	//추천상품
	@Override
	public HashMap<String, Object> searchSmartMarketRecommendList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		resultMap.put("list",smartmarketMapper.selectSmartMarketRecommendList(map));
		resultMap.put("result","success");
		
		return resultMap;
	}

	
	//상품상세정보
	@Override
	public HashMap<String, Object> searchSmartMarketInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		//SmartMarket info = smartmarketMapper.selectSmartMarketInfo(map);
		resultmap.put("info", smartmarketMapper.selectSmartMarketInfo(map));
		return resultmap;
	}

	//상품상세 이미지 리스트
	@Override
	public HashMap<String, Object> searchSmartMarketImgList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		resultMap.put("list",smartmarketMapper.selectSmartMarketImgList(map));
		resultMap.put("result","success");
		
		return resultMap;
	}
	
	
	//상품 리뷰 리스트
	@Override
	public HashMap<String, Object> searchSmartMarketReviewList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		resultMap.put("cnt", smartmarketMapper.selectSmartMarketReviewCnt(map));
		resultMap.put("list",smartmarketMapper.selectSmartMarketReviewList(map));		
		resultMap.put("result","success");
		
		return resultMap;
	}

	@Override
	public void addCart(HashMap<String, Object> map) {
		smartmarketMapper.insertCart(map);
		
	}

	//카트 리스트
	@Override
	public HashMap<String, Object> searchCartList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list",smartmarketMapper.selectCartList(map));
		resultMap.put("result","success");
		
		return resultMap;
	}

	@Override
	public void removeCart(HashMap<String, Object> map) {
		smartmarketMapper.deleteCart(map);
	}

	@Override
	public void editCart(HashMap<String, Object> map) {
		smartmarketMapper.updateCart(map);
		
	}

	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		//SmartMarket info = smartmarketMapper.selectSmartMarketInfo(map);
		resultmap.put("info", smartmarketMapper.selectUserInfo(map));
		return resultmap;
	}

	
	
	
	
	
}

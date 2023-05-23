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
	
	// 상품리뷰 리스트
	HashMap<String, Object> searchSmartMarketReviewList(HashMap<String, Object> map) throws Exception;
	
	// 카트 리스트
	HashMap<String, Object> searchCartList(HashMap<String, Object> map) throws Exception;
	
	// 사용자 정보
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
	
	// 주문번호 생성
	HashMap<String, Object> searchOrderNo(HashMap<String, Object> map);

	// 상품 등록번호 추출(마지막 번호)
	HashMap<String, Object> searchProductLastNo(HashMap<String, Object> map);
	
	//주문 등록
	void addOrder(List<HashMap<String, Object>> list);	
	
	//상품 등록
	HashMap<String, Object> addProduct(HashMap<String, Object> map);
	
	//상품 삭제
	void removeProduct(HashMap<String,Object>map);
	
	//상품 이미지 등록
	void addProductImage(HashMap<String, Object> map);
	
	//상품 이미지 등록
	void addProductImage2(HashMap<String, Object> map);
	
	//카트 등록
	void addCart(HashMap<String, Object> map);
	
	//카트 수정(구매하기)
	void editCart(HashMap<String, Object> map);
	
	//카트 삭제
	void removeCart(HashMap<String, Object> map);
	
	
	
	
	
	
	
	
	
	
	
	
}

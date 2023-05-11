package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Code;
import com.example.mini.model.SmartMarket;
import com.example.mini.model.SmartMarket2;
import com.example.mini.model.SmartReview;

@Mapper
public interface SmartMarketMapper {
	
	//상품 리스트
	List<SmartMarket> selectSmartMarketList(HashMap<String, Object> map) throws Exception;
	
	//추천상품 리스트
	List<SmartMarket> selectSmartMarketRecommendList(HashMap<String, Object> map) throws Exception;
	
	//상품상세정보
	SmartMarket selectSmartMarketInfo(HashMap<String, Object>map);
	
	//상품 이미지 리스트
	List<SmartMarket2> selectSmartMarketImgList(HashMap<String, Object> map) throws Exception;
	
	//상품 리뷰 리스트
	List<SmartReview> selectSmartMarketReviewList(HashMap<String, Object> map) throws Exception;
	
	//리뷰 전체 갯수
	int selectSmartMarketReviewCnt(HashMap<String, Object> map);
	
	//상품건수
	int selectSmartMarketCnt(HashMap<String, Object> map);
	
	//상품입력
	void insertSmartMarket(HashMap<String,Object>map);
	
	//제품 목록
	List<Code> selectSmartMarketKind(HashMap<String, Object> map);
}

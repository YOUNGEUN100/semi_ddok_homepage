package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Cart;
import com.example.mini.model.Code;
import com.example.mini.model.OrderNo;
import com.example.mini.model.Product;
import com.example.mini.model.SmartMarket;
import com.example.mini.model.SmartMarket2;
import com.example.mini.model.SmartReview;
import com.example.mini.model.User;


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
	
	//사용자정보
	User selectUserInfo(HashMap<String, Object>map);
	
	//리뷰 전체 갯수
	int selectSmartMarketReviewCnt(HashMap<String, Object> map);
	
	
	//상품건수
	int selectSmartMarketCnt(HashMap<String, Object> map);
	
	//상품리스트건수
	int selectSmartMarketListCnt(HashMap<String, Object> map);
	
	//상품입력
	void insertSmartMarket(HashMap<String,Object>map);
	
	//상품삭제
	void deleteProduct(HashMap<String,Object>map);
	
	//제품 목록
	List<Code> selectSmartMarketKind(HashMap<String, Object> map);
	
	//카트 등록
	void insertCart(HashMap<String, Object> map);
	
	//주문 등록
	void insertOrder(HashMap<String, Object> map);
	
	//상품 등록
	void insertProduct(HashMap<String, Object> map);	

	//상품 이미지 등록
	void insertProductImage(HashMap<String, Object> map);
	//상품 이미지 등록
	void insertProductImage2(HashMap<String, Object> map);
	
	//상품정보(마지막 번호 추출)
	Product selectProductLastNo(HashMap<String, Object>map);
		
	//주문번호 생성
	OrderNo createOrderNo(HashMap<String, Object> map);
	
	//카트 수정(구매하기)
	void updateCart(HashMap<String, Object> map);
	
	// 리스트
	List<Cart> selectCartList(HashMap<String, Object> map) throws Exception;
	
	// 댓글 삭제
	void deleteCart(HashMap<String, Object> map);
	
	
	
	
}

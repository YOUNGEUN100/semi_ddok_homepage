package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Funding;
import com.example.mini.model.OrderList;
import com.example.mini.model.Recipe;

@Mapper
public interface MyMapper {
	
	//레시피 저장
	List<Recipe> selectLikeRecipe(HashMap<String, Object>map);
	
	//참여한 펀딩 리스트
	List<Funding> selectAttendFunding(HashMap<String,Object>map);
	
	//주문내역
	List<OrderList> selectOrderList(HashMap<String, Object>map);
	
	//주문 상세내역
	List<OrderList> selectOrderInfo(HashMap<String, Object>map);
	
	//리뷰관리
	List<OrderList> selectReview(HashMap<String, Object>map);
	
	//리뷰등록
	void insertReview(HashMap<String, Object>map);
}

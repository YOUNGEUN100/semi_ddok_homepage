package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.SmartMarket;
import com.example.mini.model.User;

@Mapper
public interface SmartMarketMapper {
	
	//상품 리스트
	List<SmartMarket> selectSmartMarketList(HashMap<String, Object> map) throws Exception;
	
	//로그인
	User selectSmartMarketInfo(HashMap<String, Object>map);
	
	//중복체크
	int selectSmartMarketCnt(HashMap<String, Object> map);
	
	//회원가입
	void insertSmartMarket(HashMap<String,Object>map);
}

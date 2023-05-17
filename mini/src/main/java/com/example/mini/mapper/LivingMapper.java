package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Living;

@Mapper
public interface LivingMapper {
	
	// 카드 리스트
	List<Living> selectCardList(HashMap<String, Object> map);
	
	// 카드 슬라이드
	List<Living> selectCardInfo(HashMap<String, Object> map);
}

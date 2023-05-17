package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Living;

public interface LivingService {
	// 카드 리스트
	List<Living> searchCardList(HashMap<String, Object> map);
	
	// 카드 슬라이드
	List<Living> searchCardInfo(HashMap<String, Object> map);
}

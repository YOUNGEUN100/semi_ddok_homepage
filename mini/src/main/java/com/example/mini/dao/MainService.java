package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Main;

public interface MainService {
	// 펀딩 리스트
	List<Main> searchFundingList(HashMap<String, Object> map) throws Exception;
}

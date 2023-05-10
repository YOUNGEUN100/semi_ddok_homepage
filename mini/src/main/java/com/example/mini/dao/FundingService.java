package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Funding;

public interface FundingService {
	
	// 랜선마켓 게시판 리스트
	List<Funding> searchLanList(HashMap<String, Object> map) throws Exception;
	
	// 오픈된 펀딩 리스트
	List<Funding> searchOpenFundingList(HashMap<String, Object> map) throws Exception;
	
	// 준비중 펀딩 리스트
	List<Funding> searchPlannedFundingList(HashMap<String, Object> map) throws Exception;
	
	// 오픈된 펀딩 상세정보
	Funding searchOpenFundingInfo(HashMap<String, Object> map);
	
	// 준비중 펀딩 상세정보
	Funding searchPlannedFundingInfo(HashMap<String, Object> map);
}

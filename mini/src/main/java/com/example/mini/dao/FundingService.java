package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Funding;

public interface FundingService {

	// 랜선마켓 게시판 리스트
	List<Funding> searchTradeFleaList(HashMap<String, Object> map) throws Exception;
	
	// 랜선마켓 게시판 리스트
	List<Funding> searchDonateFleaList(HashMap<String, Object> map) throws Exception;

	// 오픈중 펀딩 리스트
	List<Funding> searchOpenFundingList(HashMap<String, Object> map) throws Exception;

	// 준비중 펀딩 리스트
	List<Funding> searchPlannedFundingList(HashMap<String, Object> map) throws Exception;

	// 오픈된 펀딩 상세
	Funding searchOpenFundingInfo(HashMap<String, Object> map);

	// 준비중 펀딩 상세
	Funding searchPlannedFundingInfo(HashMap<String, Object> map);

	// 펀딩 신청
	HashMap<String, Object> insertFunding(HashMap<String, Object> map);

	// 중복신청 필터링용 카운트 잘 넘어가는지 확인용
	int checkFundingMember2(HashMap<String, Object> map);
}

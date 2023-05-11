package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Funding;

@Mapper
public interface FundingMapper {
	// 랜선장터 거래 리스트
	List<Funding> selectTradeFleaList(HashMap<String, Object> map);
	
	// 랜선장터 나눔 리스트
	List<Funding> selectDonateFleaList(HashMap<String, Object> map);

	// 오픈중 펀딩 리스트
	List<Funding> selectOpenFundingList(HashMap<String, Object> map);

	// 준비중 펀딩 리스트
	List<Funding> selectPlannedFundingList(HashMap<String, Object> map);

	// 오픈중 펀딩 상세
	Funding selectOpenFundingInfo(HashMap<String, Object> map);

	// 준비중 펀딩 상세
	Funding selectPlannedFundingInfo(HashMap<String, Object> map);

	// 펀딩 신청
	void applyFunding(HashMap<String, Object> map);

	// 중복신청 필터링용 카운트
	int checkFundingMember(HashMap<String, Object> map);

}

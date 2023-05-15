package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Funding;

public interface FundingService {

	// 랜선마켓 거래 리스트
	HashMap<String, Object> searchTradeFleaList(HashMap<String, Object> map) throws Exception;
	
	// 랜선마켓 나눔 리스트
	List<Funding> searchDonateFleaList(HashMap<String, Object> map) throws Exception;
	
	// 랜선장터 글보기
	HashMap<String, Object> searchFleaInfo(HashMap<String, Object> map);
	
	// 랜선장터 댓글 리스트
	List<Funding> searchFleaComment(HashMap<String, Object> map) throws Exception;
	
	// 랜선장터 게시글 등록
	void addFlea(HashMap<String, Object> map);
	
	// 랜선장터 댓글 입력
	void addFleaComment(HashMap<String, Object> map);
	
	// 랜선장터 댓글 삭제
	void removeComment(HashMap<String, Object> map);
	
	// 랜선장터 댓글 수정
	void modifyComment(HashMap<String, Object> map);
	
	// 랜선장터 거래완료
	void endTrade(HashMap<String, Object> map);
	
	// 랜선장터 게시글 삭제
	void removeFlea(HashMap<String, Object> map);
	
	// 랜선장터 게시글 수정
	void modifyFlea(HashMap<String, Object> map);

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
	
	// 펀딩 등록	
	void addFunding(HashMap<String, Object> map);
	
	// 펀딩 이미지 등록
	void addFundingImg(HashMap<String, Object> map);

}

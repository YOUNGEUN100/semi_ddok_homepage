package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Community;
import com.example.mini.model.Living;

@Mapper
public interface LivingMapper {
	
	// 카드 리스트
	List<Living> selectCardList(HashMap<String, Object> map);
	
	int pagingCnt(HashMap<String, Object> map);
	
	// 카드 슬라이드
	List<Living> selectCardInfo(HashMap<String, Object> map);
	
	// 카드 등록
	void insertCardInfo(HashMap<String, Object> map);
	
	// 카드 이미지 업로드
	void insertCard(HashMap<String, Object> map);
	
	// 인덱스1인 이미지 썸네일로 업데이트
	void thumbUpdate(HashMap<String, Object> map);
	
	// 카드 삭제
	void deleteCard(HashMap<String, Object> map);
	
	// 정책 리스트
	List<Community> selectPolList(HashMap<String, Object> map);
	
	// 정책 조회수
	void updatePolCnt(HashMap<String, Object> map);
	
	// 정책 리스트 개수
	int selectPolCnt(HashMap<String, Object> map);
	
	// 커뮤니티 글보기
	List<Community> selectPolInfo(HashMap<String, Object>map);
	
	// 댓글 리스트
	List<Community> selectComment(HashMap<String, Object> map);
	
	// 커뮤니티 글 등록
	void insertComment(HashMap<String,Object>map);
	
	// 커뮤니티 글 등록
	void insertPol(HashMap<String,Object>map);
	
	// 글 수정
	void updatePol(HashMap<String, Object> map);
	
	// 정책 글 삭제
	void deletePol(HashMap<String, Object> map);
	
	// 정책 댓글 삭제
	void deleteComment(HashMap<String, Object> map);
}

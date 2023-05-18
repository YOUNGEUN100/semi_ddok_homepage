package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Living;

public interface LivingService {
	// 카드 리스트
	List<Living> searchCardList(HashMap<String, Object> map);
	
	// 카드 슬라이드
	List<Living> searchCardInfo(HashMap<String, Object> map);
	
	// 정책 리스트
	HashMap<String, Object> searchPolList(HashMap<String, Object> map);
	
	// 정책 글보기
	HashMap<String, Object> searchPolInfo(HashMap<String, Object>map);
	
	// 댓글 리스트
	HashMap<String, Object> selectComment(HashMap<String, Object> map);
	
	// 정책 댓글 등록
	void addComment(HashMap<String,Object>map);
	
	// 정책 글 등록
	void addPol(HashMap<String,Object>map);
	
	// 정책 글 수정
	void modifyPol(HashMap<String,Object>map);
	
	// 정책 글 삭제
	void removePol(HashMap<String, Object> map);
	
	// 댓글 삭제
	void removeComment(HashMap<String, Object> map);

}

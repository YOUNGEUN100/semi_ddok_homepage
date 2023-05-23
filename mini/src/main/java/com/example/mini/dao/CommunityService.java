package com.example.mini.dao;

import java.util.HashMap;


public interface CommunityService {
		// 커뮤니티 리스트 (+ 조회수)
		HashMap<String, Object> searchComList(HashMap<String, Object> map);
		
		// 커뮤니티 글보기
		HashMap<String, Object> searchComInfo(HashMap<String, Object>map);
		
		// 댓글 리스트
		HashMap<String, Object> selectComment(HashMap<String, Object> map);
		
		// 커뮤니티 댓글 등록
		void addComment(HashMap<String,Object>map);
		
		// 댓글 등록
		void modifyComment(HashMap<String,Object>map);
		
		// 커뮤니티 글 등록
		void addCom(HashMap<String,Object>map);
		
		// 커뮤니티 글 수정
		void modifyCom(HashMap<String,Object>map);

		// 파일 등록
		void addFile(HashMap<String,Object>map);
		
		// 커뮤니티 글 삭제
		void removeCom(HashMap<String, Object> map);
		
		// 댓글 삭제
		void removeComment(HashMap<String, Object> map);
		
		/* 아래부터는 QNA 작성하는 공간입니다 */
		
		// QNA 리스트 (+ 조회수)
		HashMap<String, Object> searchQnaList(HashMap<String, Object> map);
		
		// 문의글 등록
		void addQna(HashMap<String,Object>map);
		
		// 문의글 보기
		HashMap<String, Object> searchQnaInfo(HashMap<String, Object>map);
		
}

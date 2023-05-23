package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Community;

@Mapper
public interface CommunityMapper {
	// 커뮤니티 리스트
	List<Community>  selectComList(HashMap<String, Object> map);
	
	// 커뮤니티 조회수
	void updateComCnt(HashMap<String, Object> map);
	
	// 커뮤니티 리스트 개수
	int selectComCnt(HashMap<String, Object> map);

	// 커뮤니티 글보기
	List<Community> selectComInfo(HashMap<String, Object>map);
	
	// 댓글 리스트
	List<Community> selectComment(HashMap<String, Object> map);
	
	// 댓글 등록
	void editComment(HashMap<String,Object>map);
	
	// 커뮤니티 글 등록
	void insertComment(HashMap<String,Object>map);
	
	// 커뮤니티 글 등록
	void insertCom(HashMap<String,Object>map);
	
	// 글 수정
	void updateCom(HashMap<String, Object> map);
	
	// 파일 등록
	void insertFile(HashMap<String,Object>map);
	
	// 커뮤니티 글 삭제
	void deleteCom(HashMap<String, Object> map);
	
	// 커뮤니티 글 삭제
	void deleteComment(HashMap<String, Object> map);
	
	
	/* 아래부터는 QNA 작성하는 공간입니다 */
	
	// QNA 리스트
	List<Community>selectQnaList(HashMap<String, Object> map);
	
	// 커뮤니티 리스트 개수
	int selectQnaCnt(HashMap<String, Object> map);
	
	// QNA 글 등록
	void insertQna(HashMap<String,Object>map);
	
	// QNA 글보기
	Community selectQnaInfo(HashMap<String, Object>map);
	
	// QNA 회원 글 개수
	int select1Cnt(HashMap<String,Object>map);
	// QNA 공지글 개수
	int select2Cnt(HashMap<String,Object>map);
}

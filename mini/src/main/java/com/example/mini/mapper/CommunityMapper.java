package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Community;
import com.example.mini.model.Recipe;

@Mapper
public interface CommunityMapper {
	// 커뮤니티 리스트
	List<Community> selectComList(HashMap<String, Object> map);
	
	// 커뮤니티 리스트 개수
	int selectComCnt(HashMap<String, Object> map);

	// 커뮤니티 글보기
	Community selectComInfo(HashMap<String, Object>map);
	
	// 커뮤니티 조회수
	void updateComCnt(HashMap<String, Object> map);
	
	// 커뮤니티 글 등록
	void insertCom(HashMap<String,Object>map);
	
	// 파일 등록
	void insertFile(HashMap<String,Object>map);
	
	// 커뮤니티 글 삭제
	void deleteCom(HashMap<String, Object> map);
	
}

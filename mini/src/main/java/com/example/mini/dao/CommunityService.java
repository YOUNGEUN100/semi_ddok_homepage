package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Community;


public interface CommunityService {
		// 커뮤니티 리스트
		HashMap<String, Object> searchComList(HashMap<String, Object> map);
		
		// 커뮤니티 글보기
		Community searchComInfo(HashMap<String, Object>map);
		
		// 커뮤니티 글 등록
		void addCom(HashMap<String,Object>map);

}

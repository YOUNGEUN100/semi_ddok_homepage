package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.User;

public interface UserService {
	
	//로그인
	HashMap<String, Object> searchUserInfo(HashMap<String, Object>map);
	
	//아이디 중복체크
	int searchUserCnt(HashMap<String, Object> map);
	
	//회원가입
	void addUser(HashMap<String, Object>map);
	
	//닉네임 중복체크
	int searchUserNickCnt(HashMap<String, Object>map);
	
	//아이디 찾기
	User searchUserId(HashMap<String, Object>map);
}

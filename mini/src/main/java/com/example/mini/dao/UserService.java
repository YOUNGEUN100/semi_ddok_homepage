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
	
	//아이디 없을때
	int searchUserIdCnt(HashMap<String, Object> map);
	
	//비밀번호 찾기
	User searchUserPw(HashMap<String, Object>map);
	
	//비번 분실로 비번 변경
	void editPw(HashMap<String, Object>map);
	
	//회원정보
	User searchUser(HashMap<String, Object>map);
	
	//회원 정보 변경
	void editUser(HashMap<String, Object>map);
	
	//회원탈퇴
	void removeUser(HashMap<String, Object>map);
}

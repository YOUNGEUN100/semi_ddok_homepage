package com.example.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.User;

@Mapper
public interface UserMapper {
	
	//로그인
	User selectUserInfo(HashMap<String, Object>map);
	
	//아이디 중복체크
	int selectUserCnt(HashMap<String, Object> map);
	
	//회원가입
	void insertUser(HashMap<String,Object>map);
	
	//닉네임 중복체크
	int selectUserNickCnt(HashMap<String, Object>map);
	
	//아이디 찾기
	User selectUserId(HashMap<String, Object>map);
	
	//아이디 없을때
	int selectUserIdCnt(HashMap<String, Object>map);
	
	//비밀번호 찾기
	User selectUserPw(HashMap<String, Object>map);
	
	//비밀번호를 잊어 비밀번호 업데이트
	void updatePw(HashMap<String, Object>map);
	
	//회원정보 
	User selectUser(HashMap<String, Object>map);
	
	//회원정보 변경
	void updateUser(HashMap<String, Object>map);
	
}

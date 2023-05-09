package com.example.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.User;

@Mapper
public interface UserMapper {
	
	//로그인
	User selectUserInfo(HashMap<String, Object>map);
	
	//중복체크
	int selectUserCnt(HashMap<String, Object> map);
	
	//회원가입
	void insertUser(HashMap<String,Object>map);
}

package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.User;

public interface UserService {
	
	//로그인
	HashMap<String, Object> searchUserInfo(HashMap<String, Object>map);
	
	//중복체크
	int searchUserCnt(HashMap<String, Object> map);
}

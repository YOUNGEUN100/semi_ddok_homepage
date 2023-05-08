package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.User;

public interface UserService {
	
	//로그인
	User searchUserInfo(HashMap<String, Object>map);
}

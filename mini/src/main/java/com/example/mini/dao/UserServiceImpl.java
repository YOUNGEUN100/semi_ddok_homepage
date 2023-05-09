package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.UserMapper;
import com.example.mini.model.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userMapper.selectUserCnt(map);
		if(cnt > 0) {
			User user = userMapper.selectUserInfo(map);
			//로그인 성공
			if(user != null) {
				resultMap.put("user", user);
				resultMap.put("result", "success");
				resultMap.put("message", user.getName()+"님 환영합니다.");
			}// 패스워드 다름
			else {
				resultMap.put("result", "fail");
				resultMap.put("message", "패스워드를 다시 확인해주세요");
			} 
			// 아이디 다름.
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지않습니다.");
		}
		
		return resultMap;
		
	}

	@Override
	public int searchUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserCnt(map);
	}

	@Override
	public void addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.insertUser(map);
	}

}

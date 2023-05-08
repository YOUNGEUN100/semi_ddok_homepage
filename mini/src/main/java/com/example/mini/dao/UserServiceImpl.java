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
	public User searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserInfo(map);
	}

}

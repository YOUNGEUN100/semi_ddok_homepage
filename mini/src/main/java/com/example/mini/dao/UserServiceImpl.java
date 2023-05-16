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
	//로그인
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
	//아이디 중복체크
	@Override
	public int searchUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserCnt(map);
	}
	//회원가입
	@Override
	public void addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.insertUser(map);
	}
	//닉네임 중복체크
	@Override
	public int searchUserNickCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserNickCnt(map);
	}
	//아이디찾기
	@Override
	public User searchUserId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserId(map);
	}
	//아이디찾기결과
	@Override
	public int searchUserIdCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserIdCnt(map);
	}
	//비밀번호 변경
	@Override
	public void editPw(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.updatePw(map);;
	}
	//비밀번호 찾기
	@Override
	public User searchUserPw(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserPw(map);
	}
	

}

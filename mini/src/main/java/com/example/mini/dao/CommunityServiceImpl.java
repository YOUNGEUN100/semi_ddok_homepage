package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.CommunityMapper;
import com.example.mini.model.Community;


@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired //Mapper와 연결
	private CommunityMapper communityMapper;

	// 커뮤니티 리스트
	@Override
	public HashMap<String, Object> searchComList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap.put("list", communityMapper.selectComList(map));
		resultMap.put("cnt", communityMapper.selectComCnt(map));
		resultMap.put("result","success");
		return resultMap;
	}
	// 커뮤니티 글보기
	@Override
	public Community searchComInfo(HashMap<String, Object> map) {
		Community info = communityMapper.selectComInfo(map);
		if(info != null) {
			communityMapper.updateComCnt(map);
		}
		return info;
	}
	// 커뮤니티 글쓰기
	@Override
	public void addCom(HashMap<String, Object> map) {
		communityMapper.insertCom(map);	
	}
	




	

}

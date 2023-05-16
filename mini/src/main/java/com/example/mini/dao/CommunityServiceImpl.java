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
	public HashMap<String, Object> searchComInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("info", communityMapper.selectComInfo(map));
		if(resultMap.get("info") != null) {
			communityMapper.updateComCnt(map);
		}
		return resultMap;
	}
	
	// 댓글 리스트 글보기
	@Override
	public HashMap<String, Object> selectComment(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", communityMapper.selectComment(map));
		return resultMap;
	}
	// 댓글 쓰기
	@Override
	public void addComment(HashMap<String, Object> map) {
		communityMapper.insertComment(map);	
	}

	// 커뮤니티 글쓰기
	@Override
	public void addCom(HashMap<String, Object> map) {
		communityMapper.insertCom(map);	
	}
	// 커뮤니티 글수정
	@Override
	public void modifyCom(HashMap<String, Object> map) {
		communityMapper.updateCom(map);
	}
	
	// 파일 등록
	@Override
	public void addFile(HashMap<String, Object> map) {
		communityMapper.insertFile(map);
	}
	// 커뮤니티 글 삭제
	@Override
	public void removeCom(HashMap<String, Object> map) {
		communityMapper.deleteCom(map);
	}
	
	




	

}

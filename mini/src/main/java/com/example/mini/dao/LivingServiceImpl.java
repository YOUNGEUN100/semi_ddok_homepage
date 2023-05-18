package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.LivingMapper;
import com.example.mini.model.Living;

@Service
public class LivingServiceImpl implements LivingService{
	
	@Autowired // Mapper와 연결
	private LivingMapper livingMapper;

	@Override //카드 리스트
	public List<Living> searchCardList(HashMap<String, Object> map) {
		List<Living> list = livingMapper.selectCardList(map);
		return list;
	}

	@Override //카드 슬라이드
	public List<Living> searchCardInfo(HashMap<String, Object> map) {
		List<Living> list = livingMapper.selectCardInfo(map);
		return list;
	}
	
	
	@Override // 정책 리스트
	public HashMap<String, Object> searchPolList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap.put("list", livingMapper.selectPolList(map));
		resultMap.put("cnt", livingMapper.selectPolCnt(map));
		resultMap.put("result","success");
		return resultMap;
	}
	
	
	@Override // 정책 글보기
	public HashMap<String, Object> searchPolInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("info", livingMapper.selectPolInfo(map));
		if(resultMap.get("info") != null) {
			livingMapper.updatePolCnt(map);
		}
		return resultMap;
	}
	
	@Override // 댓글 리스트 글보기
	public HashMap<String, Object> selectComment(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", livingMapper.selectComment(map));
		return resultMap;
	}
		
	@Override // 댓글 쓰기
	public void addComment(HashMap<String, Object> map) {
		livingMapper.insertComment(map);	
	}	
	
	@Override // 커뮤니티 글쓰기
	public void addPol(HashMap<String, Object> map) {
		livingMapper.insertPol(map);	
	}
	
	@Override // 커뮤니티 글수정
	public void modifyPol(HashMap<String, Object> map) {
		livingMapper.updatePol(map);
	}	
	
	@Override // 정책 글 삭제
	public void removePol(HashMap<String, Object> map) {
		livingMapper.deletePol(map);
	}
	@Override // 정책 댓글 삭제
	public void removeComment(HashMap<String, Object> map) {
		livingMapper.deleteComment(map);
	}


}

package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.FundingMapper;
import com.example.mini.model.Funding;

@Service
public class FundingServiceImpl implements FundingService {

	@Autowired // Mapper와 연결
	private FundingMapper fundingMapper;

	@Override // 랜선마켓 게시판 리스트
	public List<Funding> searchLanList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectLanList(map);
		return list;
	}

	@Override // 오픈중 펀딩 리스트
	public List<Funding> searchOpenFundingList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectOpenFundingList(map);
		return list;
	}

	@Override // 준비중 펀딩 리스트
	public List<Funding> searchPlannedFundingList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectPlannedFundingList(map);
		return list;
	}

	@Override // 오픈중 펀딩 상세
	public Funding searchOpenFundingInfo(HashMap<String, Object> map) {
		Funding info = fundingMapper.selectOpenFundingInfo(map);
		return info;
	}

	@Override // 준비중 펀딩 상세
	public Funding searchPlannedFundingInfo(HashMap<String, Object> map) {
		Funding info = fundingMapper.selectPlannedFundingInfo(map);
		return info;
	}

	@Override // 펀딩 신청
	public HashMap<String, Object> insertFunding(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = fundingMapper.checkFundingMember(map);

		if (cnt > 0) {
			resultMap.put("result", "fail");
			resultMap.put("message", "이미 신청한 펀딩입니다.");

		} else {
			fundingMapper.applyFunding(map);			
			resultMap.put("result", "success");
			resultMap.put("message", "펀딩이 신청되었습니다.");

		}
		return resultMap;
	}

	@Override // 중복신청 필터링용 카운트 잘 넘어가는지 확인용
	public int checkFundingMember2(HashMap<String, Object> map) {
		int cnt = fundingMapper.checkFundingMember(map);
		return cnt;
	}

}

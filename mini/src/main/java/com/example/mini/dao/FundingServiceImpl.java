package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.FundingMapper;
import com.example.mini.model.Funding;

@Service
public class FundingServiceImpl implements FundingService{

	@Autowired //Mapper와 연결
	private FundingMapper fundingMapper;

	@Override
	public List<Funding> searchLanList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectLanList(map);
		return list;
	}

	@Override
	public List<Funding> searchOpenFundingList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectOpenFundingList(map);
		return list;
	}

	@Override
	public List<Funding> searchPlannedFundingList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectPlannedFundingList(map);
		return list;
	}

	@Override
	public Funding searchOpenFundingInfo(HashMap<String, Object> map) {
		Funding info = fundingMapper.selectOpenFundingInfo(map);
		return info;
	}
	


}

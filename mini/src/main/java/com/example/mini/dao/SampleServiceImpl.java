package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.SampleMapper;
import com.example.mini.model.Sample;

@Service
public class SampleServiceImpl implements SampleService{

	@Autowired //Mapper와 연결
	private SampleMapper sampleMapper;
	
	@Override
	public List<Sample> searchLanList(HashMap<String, Object> map) throws Exception {
		List<Sample> list = sampleMapper.selectLanList(map);
		return list;
	}




	

}

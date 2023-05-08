package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Sample;

public interface SampleService {
	List<Sample> searchLanList(HashMap<String, Object> map) throws Exception;
	
	List<Sample> searchFundingList(HashMap<String, Object> map) throws Exception;
}

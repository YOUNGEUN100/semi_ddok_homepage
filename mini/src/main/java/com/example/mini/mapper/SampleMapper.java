package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Sample;

@Mapper
public interface SampleMapper {
	List<Sample> selectLanList(HashMap<String, Object> map);
}

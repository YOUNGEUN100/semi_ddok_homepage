package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Main;

@Mapper
public interface MainMapper {
	List<Main> selectFundingList(HashMap<String, Object> map);
}

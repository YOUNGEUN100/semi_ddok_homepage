package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MyMapper;
import com.example.mini.model.Funding;
import com.example.mini.model.OrderList;
import com.example.mini.model.Recipe;
import com.example.mini.model.SmartMarket;

@Service
public class MyServiceImpl implements MyService{
	
	@Autowired
	MyMapper myMapper;
	//저장된 레시피
	@Override
	public List<Recipe> searchLikeRecipe(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myMapper.selectLikeRecipe(map);
	}
	//참여 펀딩 내역
	@Override
	public List<Funding> searchAttendFunding(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myMapper.selectAttendFunding(map);
	}
	//주문내역
	@Override
	public List<OrderList> searchOderList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myMapper.selectOrderList(map);
	} 
	@Override
	public List<OrderList> searchOrderInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myMapper.selectOrderInfo(map);
	}
	@Override
	public List<OrderList> searchReview(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myMapper.selectReview(map);
	}
	@Override
	public void addReivew(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		myMapper.insertReview(map);
	}
	
	
}

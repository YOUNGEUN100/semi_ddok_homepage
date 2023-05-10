package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.SmartMarketService;
import com.example.mini.model.Code;
import com.example.mini.model.SmartMarket2;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;


@Controller
public class SmartMarketController {
	
	@Autowired
	SmartMarketService smartmarketService;
	
	
	//상품리스트
	@RequestMapping(value = "/smartmarket-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchSmartMarketList(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		request.setAttribute("map", map);
		resultMap = smartmarketService.searchSmartMarketList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	// 추천상품
	@RequestMapping(value = "/smartmarket-recommend-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchSmartMarketRecommendList(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		request.setAttribute("map", map);
		resultMap = smartmarketService.searchSmartMarketRecommendList(map);		
		return new Gson().toJson(resultMap);
	}
	
	//상품 상세정보
	@RequestMapping(value = "/smartmarket-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewSmartmarket(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = smartmarketService.searchSmartMarketInfo(map);
		
		HashMap<String, Object> imgList = smartmarketService.searchSmartMarketImgList(map);
		resultMap.put("imgList", imgList);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
	// 3-2. 똑똑한 마켓
		@RequestMapping("/smart-market.do")
		public String smartMarket(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			List<Code> codeList = smartmarketService.searchSmartMarketKind(map);
			map.put("codeList", new Gson().toJson(codeList)); //코드정보를 가져온다
			request.setAttribute("map", map);
			return "/c-smart-market";
		}
			
		// 3-2. 똑똑한 마켓 상세
		@RequestMapping("/smart-market-view.do")
		public String smartMarketInfo(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/c-smart-market-view";
		}
	
}

package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.FundingService;
import com.example.mini.model.Funding;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;

@Controller
public class FundingController {

	// 본인 페이지 확인하는데 뜨지 않으면 확인할 것
	// 1. 조장이 페이지 주소에 오타를 냈다.
	// 2. 조장이 jsp 파일에 오타를 냈다.
	// 오타 찾으면 알려주세요.
	
	@Autowired
    private FundingService fundingService;	
	
	// 2-1. 랜선펀딩
	@RequestMapping("/funding.do")
	public String funding0(Model model) throws Exception{
		return "/b-funding-list";
	}
	
	// 2-1. 랜선펀딩 오픈 예정
	@RequestMapping("/funding-open.do")
	public String funding(Model model) throws Exception{
		return "/b-funding-open";
	}
	
	// 2-1. 랜선펀딩 진행 중
	@RequestMapping("/funding-planned.do")
	public String funding2(Model model) throws Exception{
		return "/b-funding-planned";
	}
	
	// 2-1. 랜선펀딩 등록 및 수정
	@RequestMapping("/funding-edit.do")
	public String funding3(Model model) throws Exception{
		return "/b-funding-edit";
	}
	
	// 2-2. 랜선마켓
	@RequestMapping("/lan-market.do")
	public String lanmarkete(Model model) throws Exception{
		return "/b-lan-market-list";
	}
	
	// 2-2. 랜선마켓 상세
	@RequestMapping("/lan-market-view.do")
	public String lanmarketInfo(Model model) throws Exception{
		return "/b-lan-market-view";
	}
		
	// 2-2. 랜선마켓 작성 및 수정
	@RequestMapping("/lan-market-edit.do")
	public String lanmarketEdit(Model model) throws Exception{
		return "/b-lan-market-edit";
	}
	
	
	
	// 랜선마켓 게시판 리스트 
	@RequestMapping(value = "/lanmarket/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchLanList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Funding> list = fundingService.searchLanList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			return new Gson().toJson(resultMap);
		}
	
	// 오픈된 펀딩 리스트 
	@RequestMapping(value = "/funding/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchFundingList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Funding> list = fundingService.searchOpenFundingList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			return new Gson().toJson(resultMap);
		}
		
	// 준비중 펀딩 리스트	
	@RequestMapping(value = "/funding/list2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchFundingList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Funding> list = fundingService.searchPlannedFundingList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			return new Gson().toJson(resultMap);
		}
		

	
	
}
		
	
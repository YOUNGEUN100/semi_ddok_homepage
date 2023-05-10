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
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FundingController {
	
	@Autowired
    private FundingService fundingService;	
	
	@Autowired
	HttpSession session;
	
	// 2-1. 랜선펀딩
	@RequestMapping("/funding.do")
	public String funding0(Model model) throws Exception{
		return "/funding";
	}
	
	// 2-1. 랜선펀딩 진행중 상세
	@RequestMapping("/funding/view/open.do")
	public String funding(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/funding_view_open";
	}
	
	// 2-1. 랜선펀딩 예정 상세
	@RequestMapping("/funding/view/planned.do")
	public String funding2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/funding_view_planned";
	}
	
	// 2-1. 랜선펀딩 등록 및 수정
	@RequestMapping("/funding/edit.do")
	public String funding3(Model model) throws Exception{
		return "/funding_edit";
	}
	
	// 2-2. 랜선마켓
	@RequestMapping("/flea.do")
	public String lanmarkete(Model model) throws Exception{
		return "/flea";
	}
	
	// 2-2. 랜선마켓 상세
	@RequestMapping("/flea/view.do")
	public String lanmarketInfo(Model model) throws Exception{
		return "/flea_view";
	}
		
	// 2-2. 랜선마켓 작성 및 수정
	@RequestMapping("/flea/edit.do")
	public String lanmarketEdit(Model model) throws Exception{
		return "/flea_edit";
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
	
	@RequestMapping(value = "/funding/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchFundingInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
																		
    		HashMap<String, Object> resultMap = new HashMap<String, Object>();
    		Funding info = fundingService.searchOpenFundingInfo(map);
    		resultMap.put("info", info);
    		resultMap.put("result", "success");
    		return new Gson().toJson(resultMap);
		}

	@RequestMapping(value = "/funding/view2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchFundingInfo2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
																	
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			Funding info = fundingService.searchPlannedFundingInfo(map);
			resultMap.put("info", info);
			resultMap.put("result", "success");
			return new Gson().toJson(resultMap);
		}
	
}
		
	
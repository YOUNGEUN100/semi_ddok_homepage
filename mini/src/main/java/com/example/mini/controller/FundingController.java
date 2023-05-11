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
import com.example.mini.mapper.FundingMapper;
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
	public String funding0(Model model) throws Exception {
		return "/funding";
	}

	// 2-1. 랜선펀딩 진행중 상세
	@RequestMapping("/funding/view/open.do")
	public String funding(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/funding_view_open";
	}

	// 2-1. 랜선펀딩 예정 상세
	@RequestMapping("/funding/view/planned.do")
	public String funding2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/funding_view_planned";
	}

	// 2-1. 랜선펀딩 등록 및 수정
	@RequestMapping("/funding/edit.do")
	public String funding3(Model model) throws Exception {
		return "/funding_edit";
	}

	// 2-2. 랜선마켓
	@RequestMapping("/flea.do")
	public String lanmarkete(Model model) throws Exception {
		return "/flea";
	}

	// 2-2. 랜선장터 상세
	@RequestMapping("/flea/view.do")
	public String lanmarketInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/flea_view";
	}

	// 2-2. 랜선장터 작성 및 수정
	@RequestMapping("/flea/edit.do")
	public String lanmarketEdit(Model model) throws Exception {
		return "/flea_edit";
	}

	// 랜선장터 거래 리스트
	@RequestMapping(value = "/fleamarket/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Funding> list = fundingService.searchTradeFleaList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}	
	
	// 랜선장터 나눔 리스트
	@RequestMapping(value = "/fleamarket/list2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Funding> list = fundingService.searchDonateFleaList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 글보기
	@RequestMapping(value = "/fleamarket/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Funding info = fundingService.searchFleaInfo(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);		
	}
	
	// 랜선장터 댓글 리스트
	@RequestMapping(value = "/fleamarket/comment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaComment(Model model, @RequestParam HashMap<String, Object>map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Funding> list = fundingService.searchFleaComment(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 댓글 등록
	@RequestMapping(value = "/fleamarket/addcomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addFleaComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.addFleaComment(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 오픈중 펀딩 리스트
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

	// 오픈중 펀딩 상세
	@RequestMapping(value = "/funding/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Funding info = fundingService.searchOpenFundingInfo(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 준비중 펀딩 상세
	@RequestMapping(value = "/funding/view2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingInfo2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Funding info = fundingService.searchPlannedFundingInfo(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 펀딩 신청
	@RequestMapping(value = "/funding/apply.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertFunding(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = fundingService.insertFunding(map);
		return new Gson().toJson(resultMap);
	}

	// 중복신청 필터링용 카운트 잘 넘어가는지 확인용
	@RequestMapping(value = "/funding/cnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingI(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int info = fundingService.checkFundingMember2(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
}

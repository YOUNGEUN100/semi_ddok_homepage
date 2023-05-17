package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.LivingService;
import com.example.mini.model.Living;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LivingController {
	
	@Autowired
	private LivingService livingService;

	@Autowired
	HttpSession session;

	
	// 4-1. 알뜰정책
	@RequestMapping("/policy.do")
	public String policy(Model model) throws Exception{
		return "/policy";
	}
	
	// 4-1. 알뜰정책 상세
	@RequestMapping("/policy/view.do")
	public String policyInfo(Model model) throws Exception{
		return "/policy_view";
	}
	
	@RequestMapping("/policy/edit.do")
	public String policyEdit(Model model) throws Exception{
		return "/policy_edit";
	}
	
	
	// 4-2. 생활백서
	@RequestMapping("/livingTip.do")
	public String livingTip(Model model) throws Exception{
		return "/livingTip";
	}
	
	// 4-2. 생활백서 상세
	@RequestMapping("/livingTip/view.do")
	public String livingTipView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/livingTip_view";
	}
	
	@RequestMapping("/livingTip/edit.do")
	public String livingTipEdit(Model model) throws Exception{
		return "/livingTip_edit";
	}
	
	
	// 4-3. 혼족여지도
	@RequestMapping("/livingMap.do")
	public String livingMap(Model model) throws Exception{
		return "/livingMap";
	}
	
	// 카드 리스트
	@RequestMapping(value = "/livingTip/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Living> list = livingService.searchCardList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 카드 슬라이드
	@RequestMapping(value = "/livingTip/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCardInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Living> list = livingService.searchCardInfo(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	
	
}
		
	
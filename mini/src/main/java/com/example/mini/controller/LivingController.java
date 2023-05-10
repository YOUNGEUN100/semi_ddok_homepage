package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;

@Controller
public class LivingController {

	
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
	public String livingTipView(Model model) throws Exception{
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
	
	

	
	
}
		
	
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
		return "/d-policy-list";
	}
	
	// 4-1. 알뜰정책 상세
	@RequestMapping("/policy-view.do")
	public String policyInfo(Model model) throws Exception{
		return "/d-policy-view";
	}
	
	// 4-2. 생활백서
	@RequestMapping("/cardnews.do")
	public String cardnews(Model model) throws Exception{
		return "/d-cardnews-list";
	}
	
	// 4-2. 생활백서 상세
	@RequestMapping("/cardnews-view.do")
	public String cardnewsInfo(Model model) throws Exception{
		return "/d-cardnews-view";
	}
	
	// 4-3. 혼족여지도
	@RequestMapping("/usefulmap.do")
	public String smartMap(Model model) throws Exception{
		return "/d-useful-map";
	}
	

	
	
}
		
	
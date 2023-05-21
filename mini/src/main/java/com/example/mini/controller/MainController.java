package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.MainService;
import com.example.mini.dao.UserService;
import com.example.mini.model.Community;
import com.example.mini.model.Funding;
import com.example.mini.model.Living;
import com.example.mini.model.Recipe;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MainService mainService;
	
	// 메인페이지
	@RequestMapping("/main.do")
	public String main(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("ssessionId"));
    	request.setAttribute("sessionStatus", session.getAttribute("ssessionStatus"));
    	

		return "/index";
	}
	
	@RequestMapping(value = "/main/session.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sessionId", session.getAttribute("sessionId"));
		resultMap.put("sessionStatus", session.getAttribute("ssessionStatus"));
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/index/funding.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Funding> list = mainService.searchFundingList(map);
		resultMap.put("list", list);		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/index/recipe.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recipeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = mainService.searchRandRecipeList(map);
		resultMap.put("list", list);	
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/index/card.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Living> list = mainService.searchRandCardList(map);
		resultMap.put("list", list);	
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/index/policy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchRanPolList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Community> list = mainService.searchRanPolList(map);
		resultMap.put("list", list);	
		return new Gson().toJson(resultMap);
	}
	
}
		
	
package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.SampleService;
import com.example.mini.model.Sample;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;

@Controller
public class SampleController {

	// 본인 페이지 확인하는데 뜨지 않으면 확인할 것
	// 1. 조장이 페이지 주소에 오타를 냈다.
	// 2. 조장이 jsp 파일에 오타를 냈다.
	// 오타 찾으면 알려주세요.
	
	@Autowired
    private SampleService sampleService; 
	
	// 샘플세팅페이지
	@RequestMapping("/sample.do")
	public String sample(Model model) throws Exception{
		return "/sampleSet";
	}
	
	// 메인페이지
	@RequestMapping("/main.do")
	public String main(Model model) throws Exception{
		return "/index";
	}
	
	// 1. 투데잇 페이지
	@RequestMapping("/today-eat.do")
	public String todayEat(Model model) throws Exception{
		return "/a-today-eat";
	}
	
	// 1. 맛집 메뉴 추천 페이지
	@RequestMapping("/recom-food.do")
	public String recommendFood(Model model) throws Exception{
		return "/a-recom-food";
	}
	
	// 1. 맛집 메뉴 추천 페이지 상세
	@RequestMapping("/recom-food-result.do")
	public String recommendFoodResult(Model model) throws Exception{
		return "/a-recom-food-result";
	}
	
	// 1. 레시피 추천 페이지
	@RequestMapping("/recom-recipe.do")
	public String recommendrecipe(Model model) throws Exception{
		return "/a-recom-recipe";
	}
	
	// 1. 레시피 추천 페이지 상세
	@RequestMapping("/recom-recipe-result.do")
	public String recommendrecipeResult(Model model) throws Exception{
		return "/a-recom-recipe-result";
	}
	
	
	
	// 3-1. 똑똑한 레시피
	/* @RequestMapping("/smart-recipe.do")
	public String recipe(Model model) throws Exception{
		return "/c-smart-recipe";
	}
	
	// 3-1. 똑똑한 레시피 상세
	@RequestMapping("/smart-recipe-view.do")
	public String recipeInfo(Model model) throws Exception{
		return "/c-smart-recipe-view";
	}
	*/
		
	// 3-2. 똑똑한 마켓
	@RequestMapping("/smart-market.do")
	public String smartMarket(Model model) throws Exception{
		return "/c-smart-market";
	}
		
	// 3-2. 똑똑한 마켓 상세
	@RequestMapping("/smart-market-view.do")
	public String smartMarketInfo(Model model) throws Exception{
		return "/c-smart-market-view";
	}
	
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
	
	// 5. 커뮤니티
	@RequestMapping("/community.do")
	public String community(Model model) throws Exception{
		return "/e-community-list";
	}
	
	// 5. 커뮤니티 상세
	@RequestMapping("/community-view.do")
	public String communityInfo(Model model) throws Exception{
		return "/e-community-view";
	}
	
	// 5. 커뮤니티 글 작성 및 수정
	@RequestMapping("/community-edit.do")
	public String communityEdit(Model model) throws Exception{
		return "/e-community-edit";
	}
	

		
		
	
	
	
//	@RequestMapping(value = "/recipe/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
//	@ResponseBody
//	public String searchRecipeList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("result", "success");
//		return new Gson().toJson(resultMap);
//	}
	
	
}
		
	
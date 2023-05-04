package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.model.Model;

@Controller
public class SampleController {

	// 메인페이지
	@RequestMapping("/main.do")
	public String main(Model model) throws Exception{
		return "/a-main";
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
	


	// 2-2. 랜선마켓
	@RequestMapping("/lan-market.do")
	public String lanmarkete(Model model) throws Exception{
		return "/b-lan-market-list";
	}
	
	// 2-2. 랜선마켓 상세
	@RequestMapping("/lan-market-info.do")
	public String lanmarketInfo(Model model) throws Exception{
		return "/b-lan-market-info";
	}
		
	// 2-2. 랜선마켓 작성 및 수정
	@RequestMapping("/lan-market-edit.do")
	public String lanmarketEdit(Model model) throws Exception{
		return "/b-lan-market-edit";
	}
	
	// 3-1. 똑똑한 레시피
	@RequestMapping("/smart-recipe.do")
	public String recipe(Model model) throws Exception{
		return "/c-smart-recipe-list";
	}
	
	// 3-1. 똑똑한 레시피 상세
	@RequestMapping("/smart-recip-info.do")
	public String recipeInfo(Model model) throws Exception{
		return "/c-smart-recipe-info";
	}
		
	// 3-2. 똑똑한 마켓
	@RequestMapping("/smart-market.do")
	public String smartMarket(Model model) throws Exception{
		return "/c-smart-market-list";
	}
		
	// 3-2. 똑똑한 마켓 상세
	@RequestMapping("/smart-market-info.do")
	public String smartMarketInfo(Model model) throws Exception{
		return "/c-smart-market-info";
	}
	
	// 4-1. 알뜰정책
	@RequestMapping("/pocily.do")
	public String policy(Model model) throws Exception{
		return "/d-pocily-list";
	}
	
	// 4-1. 알뜰정책 상세
	@RequestMapping("/pocily-info.do")
	public String policyInfo(Model model) throws Exception{
		return "/d-pocily-info";
	}
	
	// 4-2. 생활백서
	@RequestMapping("/cardnews.do")
	public String cardnews(Model model) throws Exception{
		return "/d-cardnews-list";
	}
	
	// 4-2. 생활백서 상세
	@RequestMapping("/cardnews-info.do")
	public String cardnewsInfo(Model model) throws Exception{
		return "/d-cardnews-info";
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
	@RequestMapping("/community-info.do")
	public String communityInfo(Model model) throws Exception{
		return "/e-community-info";
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
		
	
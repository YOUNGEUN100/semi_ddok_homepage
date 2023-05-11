package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ch.qos.logback.core.model.Model;

@Controller
public class TodayEatController {

	
		// 투데잇 페이지
		@RequestMapping("/todayEat.do")
		public String todayEat(Model model) throws Exception{
			return "/todayEat";
		}
		
		// 맛집메뉴 추천 페이지
		@RequestMapping("/todayEat/store.do")
		public String recommendFood(Model model) throws Exception{
			return "/todayEat_store";
		}
		
		// 맛집메뉴 추천 결과페이지
		@RequestMapping("/todayEat/store/result.do")
		public String recommendFoodResult(Model model) throws Exception{
			return "/todayEat_store_result";
		}
		
		// 레시피 추천 페이지
		@RequestMapping("/todayEat/recipe.do")
		public String recommendrecipe(Model model) throws Exception{
			return "/todayEat_recipe";
		}
		
		// 레시피 추천 결과페이지
		@RequestMapping("/todayEat/recipe/result.do")
		public String recommendrecipeResult(Model model) throws Exception{
			return "/todayEat_recipe_result";
		}
	
	
}
		
	
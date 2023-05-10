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
public class TodayEatController {

	
		// 투데잇 페이지
		@RequestMapping("/todayEat.do")
		public String todayEat(Model model) throws Exception{
			return "/todayEat";
		}
		
		// 맛집 메뉴 추천 페이지
		@RequestMapping("/todayEat/store.do")
		public String recommendFood(Model model) throws Exception{
			return "/todayEat_store";
		}
		
		// 맛집 메뉴 추천 페이지 상세
		@RequestMapping("/todayEat/store/result.do")
		public String recommendFoodResult(Model model) throws Exception{
			return "/todayEat_store_result";
		}
		
		// 레시피 추천 페이지
		@RequestMapping("/todayEat/recipe.do")
		public String recommendrecipe(Model model) throws Exception{
			return "/todayEat_recipe";
		}
		
		// 레시피 추천 페이지 상세
		@RequestMapping("/todayEat/recipe/result.do")
		public String recommendrecipeResult(Model model) throws Exception{
			return "/todayEat_recipe_result";
		}
	
	
}
		
	
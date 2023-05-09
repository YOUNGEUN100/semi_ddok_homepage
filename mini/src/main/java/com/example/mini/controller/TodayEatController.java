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
	
	
}
		
	
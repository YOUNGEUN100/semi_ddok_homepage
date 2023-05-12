package com.example.mini.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.TodayEatService;
import com.example.mini.model.TodayEat;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TodayEatController {
	
	@Autowired
	private TodayEatService todayEatService;
	
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
	public String todayEatRecipe(Model model) throws Exception{
		return "/todayEat_recipe";
	}
	
	// 레시피 추천 결과페이지
	@RequestMapping("/todayEat/recipe/result.do")
	public String selectRecipe(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/todayEat_recipe_result";
	}
	
	
	@RequestMapping(value = "/todayEat/recipe/result.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectRecipeInfo(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Array arr = (Array) map.get("ingredient");
		System.out.println(map);
		String json = map.get("ingredient").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<String> list = mapper.readValue(json, new TypeReference<List<String>>(){});
		map.put("ingredient", list);
		TodayEat info = todayEatService.searchRecipeInfo(map);
		resultMap.put("info", info);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
}
		
	
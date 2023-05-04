package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ch.qos.logback.core.model.Model;

import com.google.gson.Gson;

@Controller
public class SampleController {

	@RequestMapping("/recipe.do")
	public String recipe(Model model) throws Exception{
		return "/smart-recipe";
	}
	
	@RequestMapping("/funding.do")
	public String funding0(Model model) throws Exception{
		return "/b-funding-list";
	}
	
	@RequestMapping("/funding-open.do")
	public String funding(Model model) throws Exception{
		return "/b-funding-open";
	}
	
	@RequestMapping("/funding-planned.do")
	public String funding2(Model model) throws Exception{
		return "/b-funding-planned";
	}
	
	@RequestMapping("/lan-market.do")
	public String lanmarkete(Model model) throws Exception{
		return "/b-lan-market-list";
	}
	
	@RequestMapping(value = "/recipe/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
}
		
	
package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.RecipeService;
import com.example.mini.model.Recipe;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;

@Controller
public class RecipeController {

	// 본인 페이지 확인하는데 뜨지 않으면 확인할 것
	// 1. 조장이 페이지 주소에 오타를 냈다.
	// 2. 조장이 jsp 파일에 오타를 냈다.
	// 오타 찾으면 알려주세요.
	
	@Autowired
    private RecipeService recipeService; 
	
	
	// 똑똑한 레시피
	@RequestMapping("/smart-recipe.do")
	public String recipe(Model model) throws Exception{
		return "/c-smart-recipe";
	}
	
	// 똑똑한 레시피 상세
	@RequestMapping("/smart-recipe-view.do")
	public String recipeInfo(Model model) throws Exception{
		return "/c-smart-recipe-view";
	}
	
	// 똑똑한 레시피 상세
		@RequestMapping("/smart-recipe-edit.do")
		public String recipeEdit(Model model) throws Exception{
			return "/c-smart-recipe-edit";
		}
		
	
	
	
//	@RequestMapping(value = "/recipe/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
//	@ResponseBody
//	public String searchRecipeList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("result", "success");
//		return new Gson().toJson(resultMap);
//	}
	
	
}
		
	
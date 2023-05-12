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
import com.example.mini.model.Code;
import com.example.mini.model.Recipe;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class RecipeController {

	@Autowired
    private RecipeService recipeService; 
	
	
	
	
	
	// 페이지 - 똑똑한 레시피
	@RequestMapping("/recipe.do")
	public String recipe(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		List<Code> codeList = recipeService.searchRecipeKind(map);
		map.put("codeList", new Gson().toJson(codeList)); //코드정보를 가져온다
		request.setAttribute("map", map);
		return "/recipe";
	}
	// 레시피 전체 리스트
	@RequestMapping(value = "/recipe/all.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListAll(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		
		resultMap = recipeService.searchRecListAll(map);
		return new Gson().toJson(resultMap);
	}
	// 목적별 레시피
	@RequestMapping(value = "/recipe/list/purpose.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListPur(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchRecListPur(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	// 방법별 레시피
	@RequestMapping(value = "/recipe/list/howto.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListHow(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchRecListHow(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	// 도구별 레시피
	@RequestMapping(value = "/recipe/list/tool.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListTool(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchRecListTool(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
		
	
	// 페이지 - 똑똑한 레시피 상세
	@RequestMapping("/recipe/view.do")
	public String recipeInfo(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/recipe_view";
	}
	// 레시피 상세정보
	@RequestMapping(value = "/recipe/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recipeInfoView(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Recipe info = recipeService.searchRecipeInfo(map);
		resultMap.put("info", info);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	// 만드는 방법 리스트
	@RequestMapping(value = "/recipe/cook.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchCookList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchCookList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	// 페이지 - 똑똑한 레시피 등록 및 수정
	@RequestMapping("/recipe/edit.do")
	public String recipeEdit(Model model) throws Exception{
			return "/recipe_edit";
	}
	
	
	
	// 레시피 등록
	@RequestMapping(value = "/recipe/save.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recipeSave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		recipeService.addRecipe(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
				
	
}
		
	
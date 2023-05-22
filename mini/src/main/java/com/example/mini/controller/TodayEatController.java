package com.example.mini.controller;

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
import com.example.mini.model.Product;
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
	// 전체 메뉴 랜덤 추천
	@RequestMapping(value = "/todayEat/menu/result.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuRandon(Model model, @RequestParam HashMap <String, Object> hmap) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		TodayEat menu = todayEatService.searchMenuRandom(hmap);
		resultMap.put("menu", menu);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 맛집메뉴 추천 페이지
	@RequestMapping("/todayEat/store.do")
	public String recommendFood(Model model) throws Exception{
		return "/todayEat_store";
	}
	
	// 맛집메뉴 추천 결과페이지
	@RequestMapping("/todayEat/store/result.do")
	public String selectStore(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> hmap) throws Exception{
		request.setAttribute("hmap", hmap);
		return "/todayEat_store_result";
	}
	@RequestMapping(value = "/todayEat/store/result.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectStoreInfo(Model model, @RequestParam HashMap <String, Object> hmap) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String json = hmap.get("nation").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
	    hmap.put("nation", list);
		TodayEat info = todayEatService.searchStoreInfo(hmap);
		resultMap.put("info", info);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
	
	// 레시피 추천 페이지
	@RequestMapping("/todayEat/recipe.do")
	public String todayEatRecipe(Model model) throws Exception{
		return "/todayEat_recipe";
	}
	
	// 전체 레시피 랜덤 추천
	@RequestMapping(value = "/todayEat/recipe/resultR.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchRecipeRandom(Model model, @RequestParam HashMap <String, Object> hmap) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		TodayEat menu = todayEatService.searchRecipeRandom(hmap);
		resultMap.put("menu", menu);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 레시피 추천 결과페이지
	@RequestMapping("/todayEat/recipe/result.do")
	public String selectRecipe(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> hmap) throws Exception{
		request.setAttribute("hmap", hmap);
		return "/todayEat_recipe_result";
	}
	@RequestMapping(value = "/todayEat/recipe/result.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectRecipeInfo(Model model, @RequestParam HashMap <String, Object> hmap) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = hmap.get("ingredient").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
	    hmap.put("ingredient", list);
		TodayEat info = todayEatService.searchRecipeInfo(hmap);
		resultMap.put("info", info);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 구매유도 리스트
	@RequestMapping(value = "/todayEat/recipe/product.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchProduct(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("ingList").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<Object> list1 = mapper.readValue(json, new TypeReference<List<Object>>(){});
	    map.put("ingList", list1);
		List<TodayEat> list = todayEatService.searchProduct(map);
		resultMap.put("list", list);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
}
		
	
package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.MyService;
import com.example.mini.model.Funding;
import com.example.mini.model.OrderList;
import com.example.mini.model.Recipe;
import com.example.mini.model.SmartMarket;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	
	@Autowired
	MyService myService;
		
	@Autowired
	HttpSession session;
	
	//마이페이지
	@RequestMapping("/myPage.do") 
    public String mypage(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
    	request.setAttribute("sessionId", session.getAttribute("sessionId"));
        return "/mypage";
    }
	
	@RequestMapping(value = "/order/product.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewOrderList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrderList> list = myService.searchOderList(map);
		resultMap.put("result", "success");
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//주문상세내역
	@RequestMapping("/myPage/order.do") 
    public String mypageOrder(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
    	request.setAttribute("sessionId", session.getAttribute("sessionId"));
        return "/myPage_order";
    }
	
	@RequestMapping(value = "/order/detail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewOrder(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrderList> list = myService.searchOrderInfo(map);
		resultMap.put("result", "success");
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//찜한레시피
	@RequestMapping("/myPage/recipe.do") 
    public String readMyPage(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
    	request.setAttribute("sessionId", session.getAttribute("sessionId"));
        return "/myPage_recipe";
    }
	
	@RequestMapping(value = "/recipe/like.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewRecipe(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = myService.searchLikeRecipe(map);
		resultMap.put("result", "success");
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	
		
		//참여한 펀딩 리스트
		@RequestMapping("/myPage/funding.do") 
	    public String mypageFunding(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
	    	request.setAttribute("sessionId", session.getAttribute("sessionId"));
	        return "/myPage_funding";
	    }
		
		
		@RequestMapping(value = "/funding/attend.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchFundingList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Funding> list = myService.searchAttendFunding(map);
			resultMap.put("result", "success");
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
		//리뷰페이지
		@RequestMapping("/myPage/review.do") 
	    public String mypageReview(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
	    	request.setAttribute("sessionId", session.getAttribute("sessionId"));
	        return "/myPage_review";
	    }
		
		@RequestMapping(value = "/myPage/review.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String review(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<OrderList> list = myService.searchReview(map);
			resultMap.put("result", "success");
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
		
		@RequestMapping(value = "/review/insert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addUser(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			myService.addReivew(map);
			resultMap.put("result", "success");
			
			return new Gson().toJson(resultMap);
		}
		
		
}

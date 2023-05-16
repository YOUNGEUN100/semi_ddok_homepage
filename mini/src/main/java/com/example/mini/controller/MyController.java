package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.MyService;
import com.example.mini.model.My;
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
    public String mypage(Model model) throws Exception{

        return "/mypage";
    }
	
	//찜한레시피
	@RequestMapping("/recipe/myPage.do") 
    public String readBbs(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
    	request.setAttribute("sessionId", session.getAttribute("sessionId"));
        return "/myPage_recipe";
    }
	
	@RequestMapping(value = "/recipe/like.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewBbs(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		My info = myService.searchLikeRecipe(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
		@RequestMapping("/myPagee/order.do") 
	    public String mypageOrder(Model model) throws Exception{

	        return "/myPage_order";
	    }
		
		@RequestMapping("/mypage/funding.do") 
	    public String mypageFunding(Model model) throws Exception{

	        return "/myPage_funding";
	    }
		
		@RequestMapping("/mypage/review.do") 
	    public String mypageReview(Model model) throws Exception{

	        return "/myPage_review";
	    }
}

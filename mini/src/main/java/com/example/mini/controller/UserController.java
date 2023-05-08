package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.UserService;
import com.example.mini.model.User;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/login.do") 
    public String main(Model model) throws Exception{
    	String id = (String) session.getAttribute("sessionId");
    	String name = (String) session.getAttribute("sessionName");
    	String status = (String) session.getAttribute("sessionStatus");
    	
    	session.removeAttribute(id);
    	session.removeAttribute(name);
    	session.removeAttribute(status);
    	
    	session.invalidate();
    	
        return "/user-login";
    }
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			session.setAttribute("sessionId", user.getUserId());
			session.setAttribute("sessionName", user.getName());
			session.setAttribute("sessionStatus", user.getStatus());
		}
		return new Gson().toJson(resultMap);
		
    }
	
	@RequestMapping("/join.do") 
    public String add(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "/user-join";
    }
	
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addBbs(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/user/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserCnt(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/find.do") 
    public String findAccount(Model model) throws Exception{

        return "/user-find";
    }
	

	@RequestMapping("/mypage.do") 
    public String mypage(Model model) throws Exception{

        return "/user-mypage";
    }
	
	@RequestMapping("/mypage-order.do") 
    public String mypageOrder(Model model) throws Exception{

        return "/user-mypage-order";
    }
	
	@RequestMapping("/mypage-funding.do") 
    public String mypageFunding(Model model) throws Exception{

        return "/user-mypage-funding";
    }
	
	@RequestMapping("/mypage-review.do") 
    public String mypageReview(Model model) throws Exception{

        return "/user-mypage-review";
    }
	
	@RequestMapping("/payment.do") 
    public String payment(Model model) throws Exception{

        return "/user-payment";
    }
	
	@RequestMapping("/cart.do") 
    public String cart(Model model) throws Exception{

        return "/user-cart";
    }
	
	
	
	
	
}

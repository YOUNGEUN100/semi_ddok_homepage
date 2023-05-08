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

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/login.do") 
    public String main(Model model) throws Exception{

        return "/user-login";
    }
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewBbs(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User result = userService.searchUserInfo(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/find.do") 
    public String findAccount(Model model) throws Exception{

        return "/user-find";
    }
	
	@RequestMapping("/join.do") 
    public String joinUser(Model model) throws Exception{

        return "/user-join";
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

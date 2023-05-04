package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.model.Model;

@Controller
public class UserController {
	
	@RequestMapping("/login.do") 
    public String main(Model model) throws Exception{

        return "/user-login";
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

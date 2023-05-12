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
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserService userService;
	
	// 메인페이지
	@RequestMapping("/main.do")
	public String main(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("ssessionId"));
    	request.setAttribute("sessionStatus", session.getAttribute("ssessionStatus"));

		return "/index";
	}
	
	@RequestMapping(value = "/main/session.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sessionId", session.getAttribute("sessionId"));
		resultMap.put("sessionStatus", session.getAttribute("ssessionStatus"));
		return new Gson().toJson(resultMap);
	}
	

	
}
		
	
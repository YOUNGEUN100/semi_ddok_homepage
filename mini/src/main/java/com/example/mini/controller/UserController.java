package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.model.Model;

@Controller
public class UserController {
	
	@RequestMapping("/login.do") 
    public String main(Model model) throws Exception{

        return "/login";
    }
}

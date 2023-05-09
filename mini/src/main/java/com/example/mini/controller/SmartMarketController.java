package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.SmartMarketService;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;

@Controller
public class SmartMarketController {
	
	@Autowired
	SmartMarketService smartmarketService;
	
	@RequestMapping(value = "/smartmarket-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchSmartMarketList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = smartmarketService.searchSmartMarketList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	
	
	
}

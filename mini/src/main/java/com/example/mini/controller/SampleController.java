package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.SampleService;
import com.example.mini.model.Sample;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;

@Controller
public class SampleController {

	
	@Autowired
    private SampleService sampleService; 
	
	

	
}
		
	
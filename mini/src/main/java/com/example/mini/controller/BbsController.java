package com.example.mini.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mini.dao.BbsService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BbsController {

	@Autowired //
	BbsService bbsService;// 서비스 객체생성 (interface 추상클래스여서 new를 선언하지 않는다.)

	@Autowired
	HttpSession session;

	@RequestMapping("/bbs.do")
	public String main(HttpServletRequest request, Model model) throws Exception {
		// System.out.println(session.getAttribute("sessionId"));
		// System.out.println(session.getAttribute("sessionName"));
		request.setAttribute("sessionid", session.getAttribute("sessionId")); // 페이지에서 값을 넘길때 request 메소드를 이용한다.
		request.setAttribute("sessionstatus", session.getAttribute("sessionStatus"));
		return "/bbs-list";
	}

	@RequestMapping("/insert.do") // 게시판 등록
	public String insert(Model model) throws Exception {
		return "/bbs-insert";
	}

	@RequestMapping("/map.do") // 지도
	public String map(Model model) throws Exception {
		return "/map_test";
	}

}

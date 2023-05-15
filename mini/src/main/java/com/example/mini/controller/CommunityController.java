package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.CommunityService;
import com.example.mini.model.Community;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	
	@Autowired
    private CommunityService communityService; 
	
	@Autowired
	HttpSession session;


	// 5. 커뮤니티
	@RequestMapping("/community.do")
	public String community(Model model) throws Exception{
		return "/community";
	}
	// 커뮤니티 리스트 뿌리기
	@RequestMapping(value = "/community/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String communityList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = communityService.searchComList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 5. 커뮤니티 상세
		@RequestMapping("/community/view.do")
		public String communityInfo(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/community_view";
		}
	// 커뮤니티 글보기	
	@RequestMapping(value = "/community/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String communityView(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Community info = communityService.searchComInfo(map);
		resultMap.put("info", info);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	

	// 5. 커뮤니티 글 작성 및 수정
	@RequestMapping("/community/edit.do")
	public String communityEdit(Model model) throws Exception{
		return "/community_edit";
	}
	
	// 커뮤니티 글등록
	@RequestMapping(value = "/community/save.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String communitySave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.addCom(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	// QNA
	@RequestMapping("/qna.do")
	public String qna(Model model) throws Exception{
		return "/qna";
	}
	// qna 상세보기
	@RequestMapping("/qna/view.do")
	public String qnaView(Model model) throws Exception{
		return "/qna_view";
	}
	// QNA 작성 수정
	@RequestMapping("/qna/edit.do")
	public String qnaEdit(Model model) throws Exception{
		return "/qna_edit";
	}


		
	
}
		
	
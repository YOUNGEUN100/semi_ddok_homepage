package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.SmartMarketService;
import com.example.mini.model.Code;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class SmartMarketController {
	
	@Autowired
	SmartMarketService smartmarketService;
	
	@Autowired
    HttpSession session;
	
	//카트 리스트
	@RequestMapping("/cart.do")
    public String cart(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		map.put("userid", session.getAttribute("sessionId"));
        return "/cart";
    }
	
	//카트 등록
	@RequestMapping(value = "/addCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCart(Model model, @RequestParam  HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("userid", session.getAttribute("sessionId"));
		smartmarketService.addCart(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	//카트 리스트
		@RequestMapping(value = "/cart-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchCartList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			map.put("userid", session.getAttribute("sessionId"));
			resultMap = smartmarketService.searchCartList(map);		
			return new Gson().toJson(resultMap);
		}
	
		
	//카트 삭제
	@RequestMapping(value = "/cart-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam  HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		smartmarketService.removeCart(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//카트 수정(구매하기)
	@RequestMapping(value = "/cart-edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editCart(Model model, @RequestParam  HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String productCnt = (String) map.get("productCnt"); //숫자형으로 파싱
		String cartNo = (String) map.get("cartNo"); //숫자형으로 파싱
		
		map.put("productCnt", Integer.parseInt(productCnt));
		map.put("cartNo", Integer.parseInt(cartNo));		
		
		smartmarketService.editCart(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	//주문페이지
	@RequestMapping("/order.do") 
    public String order(Model model) throws Exception{

        return "/order";
    }
	

	
	//상품리스트
	@RequestMapping(value = "/smartmarket-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchSmartMarketList(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		request.setAttribute("map", map);
		resultMap = smartmarketService.searchSmartMarketList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	// 추천상품
	@RequestMapping(value = "/smartmarket-recommend-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchSmartMarketRecommendList(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		request.setAttribute("map", map);
		resultMap = smartmarketService.searchSmartMarketRecommendList(map);		
		return new Gson().toJson(resultMap);
	}
	
	//상품 상세정보
	@RequestMapping(value = "/smartmarket-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewSmartmarket(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = smartmarketService.searchSmartMarketInfo(map);
		
		HashMap<String, Object> imgList = smartmarketService.searchSmartMarketImgList(map); //상품 상세 이미지리스트
		//HashMap<String, Object> reviewList = smartmarketService.searchSmartMarketReviewList(map); //리뷰 리스트
		
		map.put("userid", session.getAttribute("sessionId"));
		resultMap.put("imgList", imgList);
		//resultMap.put("reviewList", reviewList);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
	
	//사용자 정보
		@RequestMapping(value = "/userinfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String Userinfo(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = smartmarketService.searchUserInfo(map);
			
			map.put("userid", session.getAttribute("sessionId"));
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}
		
		
		
		
	
	//리뷰 페이징
	@RequestMapping(value = "/reviewlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchReviewList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String startNum = (String) map.get("startNum");
		String lastNum = (String) map.get("lastNum");
		
		map.put("startNum", Integer.parseInt(startNum));
		map.put("lastNum", Integer.parseInt(lastNum));
		
		resultMap = smartmarketService.searchSmartMarketReviewList(map);		
		return new Gson().toJson(resultMap);
	}
	
	
	
	
		// 3-2. 똑똑한 마켓
		@RequestMapping("/market.do")
		public String smartMarket(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			List<Code> codeList = smartmarketService.searchSmartMarketKind(map);
			map.put("codeList", new Gson().toJson(codeList)); //코드정보를 가져온다
			request.setAttribute("map", map);
			return "/market";
		}
			
		// 3-2. 똑똑한 마켓 상세
		@RequestMapping("/market/view.do")
		public String smartMarketInfo(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			map.put("userid", session.getAttribute("sessionId"));
			return "/market_view";
		}
		
		// 3-2. 똑똑한 마켓 상세
		@RequestMapping("/market/edit.do")
		public String smartMarketEdit(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			 request.setAttribute("map", map);
			return "/market_edit";
		}
		
		
		
		
		
	
}

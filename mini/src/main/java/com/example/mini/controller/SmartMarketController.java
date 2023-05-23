package com.example.mini.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.mini.dao.SmartMarketService;
import com.example.mini.model.Code;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
    //public String order(Model model) throws Exception{
	public String order(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/order";
    }
	
	

	//주문 등록
	@RequestMapping(value = "/addOrder.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addOrder(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//map.put("userid", session.getAttribute("sessionId"));
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<HashMap<String, Object>> list = mapper.readValue(json, new TypeReference<List<HashMap<String, Object>>>(){});
		map.put("list", list);
		System.out.println(map.get("list"));
	    smartmarketService.addOrder(list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//주문 번호 생성
	@RequestMapping(value = "/createOrderNo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String createOrderNo(Model model, @RequestParam  HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = smartmarketService.searchOrderNo(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	
	

	
	//상품리스트
	@RequestMapping(value = "/smartmarket-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchSmartMarketList(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		request.setAttribute("map", map);
		
		String startNum = (String) map.get("startNum");
		String lastNum = (String) map.get("lastNum");
		
		map.put("startNum", Integer.parseInt(startNum));
		map.put("lastNum", Integer.parseInt(lastNum));
		
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

	
	//상품 등록
	@RequestMapping(value = "/addProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addProduct(Model model, @RequestParam  HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("userid", session.getAttribute("sessionId"));
		resultMap = smartmarketService.addProduct(map);
		resultMap.put("productNo", map.get("idproductNo"));
		
		
		System.out.println("상품번호 : "+ map.get("idproductNo"));
		
		
		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//상품 삭제
	@RequestMapping(value = "/smartmarket/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeProduct(Model model, @RequestParam  HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		smartmarketService.removeProduct(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}	
	
	//상품 이미지 등록
	@RequestMapping(value = "/addProductImage.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addProductImage(Model model, @RequestParam  HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("userid", session.getAttribute("sessionId"));
		smartmarketService.addProductImage(map);
		resultMap.put("result", "success-image");
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
			List<Code> codeList = smartmarketService.searchSmartMarketKind(map);
			map.put("codeList", new Gson().toJson(codeList)); //코드정보를 가져온다
			request.setAttribute("map", map);
			return "/market_edit";
		}
		
		

		
		// 상품 이미지 썸네일 첨부파일
		@RequestMapping("/fileUpload_product2.dox")
		    public String result2(@RequestParam("file1") MultipartFile multi, @RequestParam("productNo") int productNo, HttpServletRequest request,HttpServletResponse response, Model model)
		    {
		        String url = null;
		        String path="/images/";
		        try {
		 
		            //String uploadpath = request.getServletContext().getRealPath(path);
		            String uploadpath = path;
		            String originFilename = multi.getOriginalFilename();
		            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
		            long size = multi.getSize();
		            String saveFileName = genSaveFileName(extName);
		            
		            System.out.println("uploadpath : " + uploadpath);
		            System.out.println("originFilename : " + originFilename);
		            System.out.println("extensionName : " + extName);
		            System.out.println("size : " + size);
		            System.out.println("saveFileName : " + saveFileName);
		            String path2 = System.getProperty("user.dir");
		            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images");
		            if(!multi.isEmpty())
		            {
		                File file = new File(path2 + "\\src\\main\\webapp\\images", saveFileName);
		                multi.transferTo(file);

		                HashMap<String, Object> map = new HashMap<String, Object>();
		                map.put("imageName", saveFileName);
		                map.put("productNo", productNo);
		                map.put("imageOrgName", originFilename+saveFileName);	                
		                map.put("imagePath", uploadpath);
		                map.put("imageSize", size);
		                
		                // insert 쿼리 실행
		                smartmarketService.addProductImage(map); 
		                model.addAttribute("filename", multi.getOriginalFilename());
		                model.addAttribute("uploadPath", file.getAbsolutePath());
		                
		                return "/market_edit";
		            }
		        }catch(Exception e) {
		            System.out.println(e);
		        }
		        return "redirect:market/edit.do";
		    }
	// 펀딩 상세 첨부파일
	@RequestMapping("/fileUpload_product3.dox")
	    public String result3(@RequestParam("file2") MultipartFile multi, @RequestParam("productNo") int productNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="/images/";
	        try {
	 
	            //String uploadpath = request.getServletContext().getRealPath(path);
	            String uploadpath = path;
	            String originFilename = multi.getOriginalFilename();
	            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
	            long size = multi.getSize();
	            String saveFileName = genSaveFileName(extName);
	            
	            System.out.println("uploadpath : " + uploadpath);
	            System.out.println("originFilename : " + originFilename);
	            System.out.println("extensionName : " + extName);
	            System.out.println("size : " + size);
	            System.out.println("saveFileName : " + saveFileName);
	            String path2 = System.getProperty("user.dir");
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images", saveFileName);
	                multi.transferTo(file);

	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("imageName", saveFileName);
	                map.put("productNo", productNo);
	                map.put("imageOrgName", originFilename);	                
	                map.put("imagePath", uploadpath+saveFileName);
	                map.put("imageSize", size);
	                
	                // insert 쿼리 실행
	                smartmarketService.addProductImage2(map); 
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "/market_edit";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:market/edit.do";
	    }
	    
	    // 현재 시간을 기준으로 파일 이름 생성
	    private String genSaveFileName(String extName) {
	        String fileName = "";
	        
	        Calendar calendar = Calendar.getInstance();
	        fileName += calendar.get(Calendar.YEAR);
	        fileName += calendar.get(Calendar.MONTH);
	        fileName += calendar.get(Calendar.DATE);
	        fileName += calendar.get(Calendar.HOUR);
	        fileName += calendar.get(Calendar.MINUTE);
	        fileName += calendar.get(Calendar.SECOND);
	        fileName += calendar.get(Calendar.MILLISECOND);
	        fileName += extName;
	        
	        return fileName;
	    }		
	
}

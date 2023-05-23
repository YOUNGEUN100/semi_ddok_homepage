package com.example.mini.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.mini.dao.FundingService;
import com.example.mini.model.Funding;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class FundingController {

	@Autowired
	private FundingService fundingService;

	@Autowired
	HttpSession session;

	// 2-1. 랜선펀딩
	@RequestMapping("/funding.do")
	public String funding0(Model model) throws Exception {
		return "/funding";
	}

	// 2-1. 랜선펀딩 진행중 상세
	@RequestMapping("/funding/view/open.do")
	public String funding(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/funding_view_open";
	}

	// 2-1. 랜선펀딩 예정 상세
	@RequestMapping("/funding/view/planned.do")
	public String funding2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/funding_view_planned";
	}

	// 2-1. 랜선펀딩 등록 및 수정
	@RequestMapping("/funding/edit.do")
	public String funding3(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/funding_edit";
	}

	// 2-2. 랜선마켓
	@RequestMapping("/flea.do")
	public String lanmarkete(Model model) throws Exception {
		return "/flea";
	}

	// 2-2. 랜선장터 상세
	@RequestMapping("/flea/view.do")
	public String lanmarketInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/flea_view";
	}

	// 2-2. 랜선장터 작성 및 수정
	@RequestMapping("/flea/edit.do")
	public String lanmarketEdit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/flea_edit";
	}

	// 랜선장터 거래 리스트
	@RequestMapping(value = "/fleamarket/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		
		resultMap = fundingService.searchTradeFleaList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}	
	
	// 랜선장터 나눔 리스트
	@RequestMapping(value = "/fleamarket/list2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		
		resultMap = fundingService.searchDonateFleaList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 글보기
	@RequestMapping(value = "/fleamarket/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = fundingService.searchFleaInfo(map);	
		List<Funding> imgList = fundingService.searchFleaImg(map);
		resultMap.put("imgList", imgList);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);		
	}
	
	// 랜선장터 게시글 등록
	@RequestMapping(value = "/fleamarket/addFlea.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addFlea(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.addFlea(map);
		resultMap.put("boardNo", map.get("idFlea"));
		System.out.println("보드번호"+map.get("idFlea"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);		
	}
	
	// 랜선장터 댓글 리스트
	@RequestMapping(value = "/fleamarket/comment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFleaComment(Model model, @RequestParam HashMap<String, Object>map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", fundingService.searchFleaComment(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 댓글 등록
	@RequestMapping(value = "/fleamarket/addcomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addFleaComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.addFleaComment(map);	
		fundingService.editReno(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 대댓글 등록
	@RequestMapping(value = "/fleamarket/addrecomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addFleaReComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.addFleaReComment(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 댓글 삭제
	@RequestMapping(value = "/fleamarket/removerecomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeReComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.removeReComment(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 댓글 삭제
	@RequestMapping(value = "/fleamarket/removecomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.removeComment(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 댓글 삭제
	@RequestMapping(value = "/fleamarket/editcomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mopdifyComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.modifyComment(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 거래 종료
	@RequestMapping(value = "/fleamarket/finishFlea.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String endTrade(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.endTrade(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 게시글 삭제
	@RequestMapping(value = "/fleamarket/deleteFlea.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeFlea(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.removeFlea(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 랜선장터 게시글 삭제
	@RequestMapping(value = "/fleamarket/editFlea.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyFlea(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.modifyFlea(map);		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 오픈중 펀딩 리스트
	@RequestMapping(value = "/funding/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Funding> list = fundingService.searchOpenFundingList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 준비중 펀딩 리스트
	@RequestMapping(value = "/funding/list2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Funding> list = fundingService.searchPlannedFundingList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 오픈중 펀딩 상세
	@RequestMapping(value = "/funding/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Funding info = fundingService.searchOpenFundingInfo(map);
		List<Funding> imgInfo = fundingService.fundingImgDetail2(map);
		List<Funding> imgList = fundingService.searchFundingImg(map);
		resultMap.put("info", info);
		resultMap.put("imgInfo", imgInfo);
		resultMap.put("imgList", imgList);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 준비중 펀딩 상세
	@RequestMapping(value = "/funding/view2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingInfo2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Funding info = fundingService.searchPlannedFundingInfo(map);
		List<Funding> imgInfo = fundingService.fundingImgDetail2(map);
		List<Funding> imgList = fundingService.searchFundingImg(map);
		resultMap.put("info", info);
		resultMap.put("imgInfo", imgInfo);
		resultMap.put("imgList", imgList);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 펀딩 신청
	@RequestMapping(value = "/funding/apply.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertFunding(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = fundingService.insertFunding(map);
		return new Gson().toJson(resultMap);
	}

	// 중복신청 필터링용 카운트 잘 넘어가는지 확인용
	@RequestMapping(value = "/funding/cnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchFundingI(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int info = fundingService.checkFundingMember2(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 펀딩 등록
	@RequestMapping(value = "/funding/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addFunding(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.addFunding(map);
		resultMap.put("fundingNo", map.get("id"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 펀딩 수정
	@RequestMapping(value = "/funding/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyFunding(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.modifyFunding(map);
		//resultMap.put("fundingNo", map.get("id"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 펀딩 삭제
	@RequestMapping(value = "/funding/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeFunding(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		fundingService.removeFunding(map);

		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 펀딩 이미지 삭제
	@RequestMapping(value = "/funding/removeimg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeFundingImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("selectedItems").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
	    map.put("selectedItems", list);
		fundingService.removeFundingImg(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
//	// 펀딩 이미지 리스트
//	@RequestMapping(value = "/funding/imglist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String searchFundingImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		List<Funding> list = fundingService.searchFundingImg(map);
//		resultMap.put("result", "success");
//		return new Gson().toJson(resultMap);
//	}
	
	// 랜선장터 첨부파일
	@RequestMapping("/fleamarket/fileUpload1.dox")
	    public String result1(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="/images/flea/";
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
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images\\flea\\");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images\\flea\\", saveFileName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("imgName", saveFileName);
	                map.put("boardNo", boardNo);
	                map.put("orlgName", originFilename);
	                map.put("saveName", saveFileName);
	                map.put("filePath", uploadpath);
	                map.put("fileSize", size);
	                map.put("fileKind",extName);
	                
	                // insert 쿼리 실행
	                fundingService.addFleaFile(map); 
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:../flea.do";
	    }
	
	// 펀딩 썸네일 첨부파일
	@RequestMapping("/funding/fileUpload2.dox")
	    public String result2(@RequestParam("file1") MultipartFile multi, @RequestParam("fundingNo") int fundingNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="/images/funding/";
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
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images\\funding\\");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images\\funding\\", saveFileName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("imgName", saveFileName);
	                map.put("fundingNo", fundingNo);
	                map.put("imgOrgName", originFilename);	                
	                map.put("imgPath", uploadpath);
	                map.put("imgSize", size);
	                
	                // insert 쿼리 실행
	                fundingService.addFundingImg(map); 
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:../funding.do";
	    }
	// 펀딩 상세 첨부파일
	@RequestMapping("/funding/fileUpload3.dox")
	    public String result3(@RequestParam("file2") MultipartFile multi, @RequestParam("fundingNo") int fundingNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="/images/funding/";
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
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images\\funding\\");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images\\funding\\", saveFileName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("imgName", saveFileName);
	                map.put("fundingNo", fundingNo);
	                map.put("imgOrgName", originFilename);	                
	                map.put("imgPath", uploadpath);
	                map.put("imgSize", size);
	                
	                // insert 쿼리 실행
	                fundingService.addFundingImg2(map); 
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:../funding.do";
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

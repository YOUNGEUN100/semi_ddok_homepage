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

import com.example.mini.dao.CommunityService;
import com.example.mini.model.Community;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		
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
		resultMap = communityService.searchComInfo(map);
		return new Gson().toJson(resultMap);
	}
	

	// 5. 커뮤니티 글 작성 및 수정
	@RequestMapping("/community/edit.do")
	public String communityEdit(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/community_edit";
	}
	
	// 커뮤니티 글등록
	@RequestMapping(value = "/community/save.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String communitySave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.addCom(map);
		resultMap.put("boardNo", map.get("id"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	// 커뮤니티 글수정
		@RequestMapping(value = "/community/modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String communityModify(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			communityService.modifyCom(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}
	// 커뮤니티 글삭제
	@RequestMapping(value = "/community/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String communityRemove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.removeCom(map);
		resultMap.put("boardNo", map.get("id"));
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 파일 업로드
	 @RequestMapping("/community/fileUpload.dox")
	    public String resultCom(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="c:\\images";
	        try {
	 
	            //String uploadpath = request.getServletContext().getRealPath(path);
	            String filePath = path;
	            String orlgName = multi.getOriginalFilename();
	            String extName = orlgName.substring(orlgName.lastIndexOf("."),orlgName.length());
	            long fileSize = multi.getSize();
	            String saveName = genSaveFileName(extName);
	            
	            System.out.println("filePath : " + filePath);
	            System.out.println("orlgName : " + orlgName);
	            System.out.println("extName : " + extName);
	            System.out.println("size : " + fileSize);
	            System.out.println("saveName : " + saveName);
	            String path2 = System.getProperty("user.dir");
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images", saveName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("images", "\\images\\" + saveName);
	                map.put("boardNo", boardNo);
	                map.put("orlgName", orlgName);
	                map.put("saveName", saveName);
	                map.put("filePath", filePath);
	                map.put("fileSize", fileSize);
	                map.put("fileKind",extName);
	                
	                // insert 쿼리 실행
	                communityService.addFile(map); 
	                
	           model.addAttribute("orlgName", multi.getOriginalFilename());
	           model.addAttribute("saveName",saveName);
	           model.addAttribute("filePath", file.getAbsolutePath());
	           model.addAttribute("fileSize",fileSize);
	           
	                return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:community.do";
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
		
	
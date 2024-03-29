package com.example.mini.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.mini.dao.LivingService;
import com.example.mini.model.Living;
import com.google.gson.Gson;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LivingController {
	
	@Autowired
	private LivingService livingService;
	


	@Autowired
	HttpSession session;

	
	// 4-1. 알뜰정책
	@RequestMapping("/policy.do")
	public String policy(Model model) throws Exception{
		return "/policy";
	}
	
	// 4-1. 알뜰정책 상세
	@RequestMapping("/policy/view.do")
	public String policyInfo(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/policy_view";
	}
	
	@RequestMapping("/policy/edit.do")
	public String policyEdit(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/policy_edit";
	}
	
	
	// 4-2. 생활백서
	@RequestMapping("/livingTip.do")
	public String livingTip(Model model) throws Exception{
		return "/livingTip";
	}
	
	// 4-2. 생활백서 상세
	@RequestMapping("/livingTip/view.do")
	public String livingTipView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/livingTip_view";
	}
	
	@RequestMapping("/livingTip/edit.do")
	public String livingTipEdit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/livingTip_edit";
	}
	
	
	// 4-3. 혼족여지도
	@RequestMapping("/livingMap.do")
	public String livingMap(Model model) throws Exception{
		return "/livingMap";
	}
	
	// 카드 리스트
	@RequestMapping(value = "/livingTip/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		resultMap = livingService.searchCardList(map);
		
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 카드 슬라이드
	@RequestMapping(value = "/livingTip/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCardInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Living> list = livingService.searchCardInfo(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 카드 등록
	@RequestMapping(value = "/livingTip/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCardInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		livingService.addCardInfo(map);
		resultMap.put("cardNo", map.get("id"));	
		System.out.println(map.get("id"));	
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 카드 삭제
	@RequestMapping(value = "/livingTip/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeCard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		livingService.removeCard(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 정책 리스트 뿌리기
	@RequestMapping(value = "/policy/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchPolList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		
		resultMap = livingService.searchPolList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 정책 글보기	
	@RequestMapping(value = "/policy/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchPolInfo(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = livingService.searchPolInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 리스트 글보기	
	@RequestMapping(value = "/policy/commentList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectComment(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = livingService.selectComment(map);
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 글등록
	@RequestMapping(value = "/policy/commentSave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addComment(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		livingService.addComment(map);
		return new Gson().toJson(resultMap);
	}
	
	// 정책 글등록
	@RequestMapping(value = "/policy/save.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addPol(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		livingService.addPol(map);
		resultMap.put("boardNo", map.get("id"));
		return new Gson().toJson(resultMap);
	}
	
	// 정책 글수정
	@RequestMapping(value = "/policy/modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyPol(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		livingService.modifyPol(map);
		return new Gson().toJson(resultMap);
	}
	
	// 정책 글삭제
	@RequestMapping(value = "/policy/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removePol(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		livingService.removePol(map);
		return new Gson().toJson(resultMap);
	}
	// 댓글 삭제
	@RequestMapping(value = "/policy/commentRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeComment(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		livingService.removeComment(map);
		return new Gson().toJson(resultMap);
	}

	// 파일 업로드
	 @RequestMapping("/policy/fileUpload.dox")
	    public String resultCom(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="/images/policy/";
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
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images\\policy\\");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images\\policy\\", saveName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("images", filePath);
	                map.put("boardNo", boardNo);
	                map.put("orlgName", orlgName);
	                map.put("saveName", saveName);
	                map.put("filePath", filePath);
	                map.put("fileSize", fileSize);
	                map.put("fileKind",extName);
	                
	                // insert 쿼리 실행
	                livingService.addpFile(map);
	                
	           model.addAttribute("orlgName", multi.getOriginalFilename());
	           model.addAttribute("saveName",saveName);
	           model.addAttribute("filePath", file.getAbsolutePath());
	           model.addAttribute("fileSize",fileSize);
	           
	                // return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:../policy.do";
	    }
	 
	 private static final String FILE_DIRECTORY_P = System.getProperty("user.dir") + "/src/main/webapp/images/policy/";

	    @GetMapping("/download/{filename}")
	    public ResponseEntity<Resource> downloadFileP(@PathVariable String filename, HttpServletRequest request) throws IOException {
	        // 파일 경로 생성
	        Path filePath = Paths.get(FILE_DIRECTORY_P, filename);
	        Resource resource = new org.springframework.core.io.UrlResource(filePath.toUri());

	        // 파일이 존재하는지 확인
	        if (!resource.exists()) {
	            throw new IllegalArgumentException("파일을 찾을 수 없습니다: " + filename);
	        }

	        // 다운로드할 파일의 MIME 타입 설정
	        String contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());

	        // MIME 타입이 알 수 없는 경우 기본값 설정
	        if (contentType == null) {
	            contentType = "application/octet-stream";
	        }

	        // 다운로드할 파일에 대한 헤더 설정
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.parseMediaType(contentType));
	        headers.setContentDispositionFormData("attachment", filename);

	        // 파일을 ResponseEntity로 래핑하여 반환
	        return ResponseEntity.ok()
	                .headers(headers)
	                .body(resource);
	    }
	 
	 
	 

	 // 카드정보 파일 업로드
	 @RequestMapping("/livingTip/fileUpload.dox")
	    public String update(@RequestParam("file1") MultipartFile multi, @RequestParam("cardNo") int cardNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="/images/cardinfo/";
	        try {
	 
	            //String uploadpath = request.getServletContext().getRealPath(path);
	            String filePath = path;
	            String orlgName = multi.getOriginalFilename();
	            String extName = orlgName.substring(orlgName.lastIndexOf("."),orlgName.length());
	            long fileSize = multi.getSize();
	            String saveName = genSaveFileName(extName);
	            
	            System.out.println("imgPath : " + filePath);
	            System.out.println("imgOrgName : " + orlgName);
	            System.out.println("extName : " + extName);
	            System.out.println("imgSize : " + fileSize);
	            System.out.println("imgName : " + saveName);
	            String path2 = System.getProperty("user.dir");
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\image\\cardinfo\\");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images\\cardinfo\\", saveName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("cardNo", cardNo);
	                map.put("imgOrgName", orlgName);
	                map.put("imgName", saveName);
	                map.put("imgPath", filePath);
	                map.put("imgSize", fileSize);
	                map.put("fileKind",extName);
	                
	                // insert 쿼리 실행
	                livingService.addFile(map);
	                
	           model.addAttribute("orlgName", multi.getOriginalFilename());
	           model.addAttribute("saveName",saveName);
	           model.addAttribute("filePath", file.getAbsolutePath());
	           model.addAttribute("fileSize",fileSize);
	           
	                // return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:../livingTip.do";
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
		
	
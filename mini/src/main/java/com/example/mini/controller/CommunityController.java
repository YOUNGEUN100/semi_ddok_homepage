package com.example.mini.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.mini.dao.CommunityService;
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
	// 댓글 리스트 글보기	
		@RequestMapping(value = "/community/commentList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String commentList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = communityService.selectComment(map);
			return new Gson().toJson(resultMap);
		}
	// 댓글 글등록
	@RequestMapping(value = "/community/commentSave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentSave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.addComment(map);
		return new Gson().toJson(resultMap);
	}
	// 댓글 수정
	@RequestMapping(value = "/community/editcomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyComment(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.modifyComment(map);
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
		return new Gson().toJson(resultMap);
	}
	// 커뮤니티 글수정
		@RequestMapping(value = "/community/modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String communityModify(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			communityService.modifyCom(map);
			return new Gson().toJson(resultMap);
		}
	// 커뮤니티 글삭제
	@RequestMapping(value = "/community/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String communityRemove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.removeCom(map);
		resultMap.put("boardNo", map.get("id"));
		return new Gson().toJson(resultMap);
	}
	// 댓글 삭제
		@RequestMapping(value = "/community/commentRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String commentRemove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			communityService.removeComment(map);
			return new Gson().toJson(resultMap);
		}
	
	// 파일 업로드
	 @RequestMapping("/community/fileUpload.dox")
	    public String resultCom(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	       // String url = null;
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
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\images\\file");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\images\\file", saveName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("images", "../images/file/" + saveName);
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
	           
	                // return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:../community.do";
	    }
	 
	 private static final String FILE_DIRECTORY = System.getProperty("user.dir") + "/src/main/webapp/images/file/";

	    @GetMapping("/download/{filename}")
	    public ResponseEntity<Resource> downloadFile(@PathVariable String filename, HttpServletRequest request) throws IOException {
	        // 파일 경로 생성
	        Path filePath = Paths.get(FILE_DIRECTORY, filename);
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
	public String qna(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/qna";
	}
	// QNA 리스트 뿌리기
	@RequestMapping(value = "/qna/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String qnaList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		
		resultMap = communityService.searchQnaList(map);
		return new Gson().toJson(resultMap);
	}
	
	
	// qna 상세보기
	@RequestMapping("/qna/view.do")
	public String qnaView(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/qna_view";
	}

	
	// QNA 작성 수정
	@RequestMapping("/qna/edit.do")
	public String qnaEdit(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/qna_edit";
	}

	// 문의 글등록
	@RequestMapping(value = "/qna/save.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String qnaSave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.addQna(map);
		// resultMap.put("boardNo", map.get("id"));
		return new Gson().toJson(resultMap);
	}
	// 문의 글보기	
		@RequestMapping(value = "/qna/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String qnaView(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = communityService.searchQnaInfo(map);
			return new Gson().toJson(resultMap);
		}
	
}
		
	
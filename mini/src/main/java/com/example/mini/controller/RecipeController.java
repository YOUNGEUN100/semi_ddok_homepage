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

import com.example.mini.dao.RecipeService;
import com.example.mini.model.Code;
import com.example.mini.model.Recipe;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class RecipeController {

	@Autowired
    private RecipeService recipeService; 
	
	@Autowired
	HttpSession session;
	
	// 페이지 - 똑똑한 레시피
	@RequestMapping("/recipe.do")
	public String recipe(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		List<Code> codeList = recipeService.searchRecipeKind(map);
		map.put("codeList", new Gson().toJson(codeList)); //코드정보를 가져온다
		request.setAttribute("map", map);
		return "/recipe";
	}
	// 레시피 전체 리스트
	@RequestMapping(value = "/recipe/all.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListAll(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String startNum = (String) map.get("startNum");
		map.put("startNum", Integer.parseInt(startNum));
		
		resultMap = recipeService.searchRecListAll(map);
		return new Gson().toJson(resultMap);
	}
	// 목적별 레시피
	@RequestMapping(value = "/recipe/list/purpose.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListPur(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchRecListPur(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	// 방법별 레시피
	@RequestMapping(value = "/recipe/list/howto.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListHow(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchRecListHow(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	// 도구별 레시피
	@RequestMapping(value = "/recipe/list/tool.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchRecipeListTool(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchRecListTool(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
		
	
	// 페이지 - 똑똑한 레시피 상세
	@RequestMapping("/recipe/view.do")
	public String recipeInfo(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/recipe_view";
	}
	// 레시피 상세정보
	@RequestMapping(value = "/recipe/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recipeInfoView(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Recipe info = recipeService.searchRecipeInfo(map);
		resultMap.put("info", info);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	// 만드는 방법 리스트
	@RequestMapping(value = "/recipe/cook.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") 
	@ResponseBody
	public String searchCookList(Model model, @RequestParam HashMap <String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Recipe> list = recipeService.searchCookList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	// 마이페이지 레시피 저장
	@RequestMapping(value = "/recipe/mypageSave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recipeMypageSave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = recipeService.checkRecipeNo(map);
		if (cnt == 0) {
			recipeService.AddMypageRecipe(map);
			resultMap.put("message", "등록되었습니다.");
		} else {
			resultMap.put("message", "이미 등록된 레시피입니다.");
		}
		return new Gson().toJson(resultMap);
	}
	
	
	// 페이지 - 똑똑한 레시피 등록 및 수정
	@RequestMapping("/recipe/edit.do")
	public String recipeEdit(Model model) throws Exception{
			return "/recipe_edit";
	}
	
	
	
	// 레시피 등록
	@RequestMapping(value = "/recipe/save.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recipeSave(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		recipeService.addRecipe(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 레시피 번호 중복 체크
	@RequestMapping(value = "/recipe/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = recipeService.searchRecipeNoCnt(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}	
	
	/* @RequestMapping("/fileUpload.dox")
	    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("recipeNo") int recipeNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="c:\\img";
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
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("img", "\\img\\" + saveFileName);
	                map.put("recipeNo", recipeNo);
	                
	                // insert 쿼리 실행
	                // insertBoardImg(map); 
	                
	             //   model.addAttribute("filename", multi.getOriginalFilename());
	             //   model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "filelist";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:recipe.do";
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
	    } */
	
	
	
	
	
}
		
	
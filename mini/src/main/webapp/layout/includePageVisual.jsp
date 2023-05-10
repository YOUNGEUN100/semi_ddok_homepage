<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="pageVisual">
	<div class="wrapper">
		<span id="pageIconBox"></span>
		<h2 id="pageTitle"></h2>
	    <p id="pageInfo"></p>
	</div>
</div>
<style>
#pageVisual .wrapper {height:100%; padding-bottom:2em; margin-bottom:2em;}
#pageTitle {margin:0.5em 0;}
</style>
<script type="text/javascript">
function pageName(){
	var pageTitle = document.getElementById("pageTitle");
	var pageInfo = document.getElementById("pageInfo");
	var pageIconBox = document.getElementById("pageIconBox");
	var pageIcon = document.createElement("img");
	
	let urlList = window.location.href.split('/');
	const id = urlList[urlList.length - 1];
	
	switch(id){
		case "sample.do" : 
			 pageTitle.innerHTML = "sampleSet Page";
			 break;
		case "recipe.do" : 
			 pageTitle.innerHTML = "똑똑한 레시피";
			 break;
		case "market.do" : 
			 pageTitle.innerHTML = "똑똑한 마켓"
			 break;
		case "login.do" : 
			 pageTitle.innerHTML = "로그인";
			 break;
		case "join.do" : 
			 pageTitle.innerHTML = "회원가입";
			 break;
		default :
			 pageTitle.innerHTML = "noneSet Page";
	};
	
	switch(id){
		case "sample.do" : 
			 pageInfo.innerHTML = "샘플세팅 페이지입니다 😀";
			 break;
		
		case "recipe.do" : 
		case "market.do" : 
			 pageInfo.innerHTML = "머리는 똑똑하게, 배는 빵빵하게";
			 pageIcon.setAttribute("src", "../images/pageVisual_icon03.png");
			 pageIconBox.appendChild(pageIcon);
			 break;
			 
		case "login.do" : 
		case "join.do" : 
			 pageInfo.innerHTML = "똑똑과 함께하는 당신은 똑똑함 풀충전";
			 pageIcon.setAttribute("src", "../images/pageVisual_icon00.png");
			 pageIconBox.appendChild(pageIcon);
			 break;
			 
		default :
			 pageInfo.innerHTML = "설정되지 않은 페이지입니다 😥";
	};
};
pageName();
</script>
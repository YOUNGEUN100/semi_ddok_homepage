<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="pageVisual">
	<div class="wrapper">
		<span id="pageIconBox"></span>
		<h2 id="pageTitle"></h2>
	    <p id="pageInfo"></p>
	</div>
</div>
<script type="text/javascript">
function pageName(){
	var pageTitle = document.getElementById("pageTitle");
	var pageInfo = document.getElementById("pageInfo");
	var pageIconBox = document.getElementById("pageIconBox");
	var pageIcon = document.createElement("img");
	
	let urlList = window.location.href.split('/');
	const pageList = urlList[3].split('.');
	const pageId = pageList[0];
	const pageSubList = urlList[urlList.length - 1].split('.');
	const pageSubId = pageSubList[pageSubList.length - 2];
	console.log(pageId);
	console.log(pageSubId);
	
	switch(pageId){
	case "todayEat" : 
		pageInfo.innerHTML = "오늘도 무엇을 어떻게 먹을지 고민중이신가요?";
		pageIcon.setAttribute("src", "../images/pageVisual_icon01.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "funding" : 
	case "flea" : 
		pageInfo.innerHTML = "우리의 지갑과 통장은 소중하니까!";
		pageIcon.setAttribute("src", "../images/pageVisual_icon02.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "recipe" : 
	case "market" : 
	case "cart" : 
	case "order" : 
		pageInfo.innerHTML = "머리는 똑똑하게, 배는 빵빵하게";
		pageIcon.setAttribute("src", "../images/pageVisual_icon03.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "policy" : 
	case "livingTip" : 
	case "livingMap" : 
		pageInfo.innerHTML = "우리, 똑소리나게 알아두고 똑부러지게 살아봐요";
		pageIcon.setAttribute("src", "../images/pageVisual_icon04.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "community" : 
	case "qna" : 
		pageInfo.innerHTML = "우리, 똑소리나게 알아두고 똑부러지게 살아봐요";
		pageIcon.setAttribute("src", "../images/pageVisual_icon05.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "myPage" : 
	case "login" : 
	case "join" : 
		pageInfo.innerHTML = "똑똑과 함께하는 당신은 똑똑함 풀충전";
		pageIcon.setAttribute("src", "../images/pageVisual_icon00.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "sample" : 
		pageInfo.innerHTML = "샘플세팅 페이지입니다 😀";
		break;
	default :
		 pageInfo.innerHTML = "설정되지 않은 페이지입니다 😥";
	};
	
	switch(pageSubId){
	case "todayEat" : 
		pageTitle.innerHTML = "투데잇 : Today-Eat";
		break;
	case "store" : 
		pageTitle.innerHTML = "투데잇 : 맛집메뉴 추천";
		break;
	case "recipe" : 
		pageTitle.innerHTML = "투데잇 : 레시피 추천";
		break;
	case "funding" : 
		pageTitle.innerHTML = "랜선펀딩";
		break;
	case "flea" : 
		pageTitle.innerHTML = "랜선장터";
		break;
	case "recipe" : 
		pageTitle.innerHTML = "똑똑한 레시피";
		break;
	case "market" : 
		pageTitle.innerHTML = "똑똑한 마켓";
		break;
	case "cart" : 
		pageTitle.innerHTML = "똑똑한 마켓 : 장바구니";
		break;
	case "order" : 
		pageTitle.innerHTML = "똑똑한 마켓 : 주문";
		break;
	case "policy" : 
		pageTitle.innerHTML = "알쓸정책";
		break;
	case "livingTip" : 
		pageTitle.innerHTML = "생활백서";
		break;
	case "livingMap" : 
		pageTitle.innerHTML = "혼족여지도";
		break;
	case "community" : 
		pageTitle.innerHTML = "커뮤니티";
		break;
	case "qna" : 
		pageTitle.innerHTML = "QnA";
		break;
	case "myPage" : 
		pageTitle.innerHTML = "마이페이지";
		break;
	case "join" : 
		pageTitle.innerHTML = "회원가입";
		break;
	case "login" : 
		pageTitle.innerHTML = "로그인";
		break;
	case "find" : 
		pageTitle.innerHTML = "ID/PW 찾기";
		break;
	case "sample" : 
		pageTitle.innerHTML = "sampleSet Page";
		break;
	default : 
		pageTitle.innerHTML = "noneSet Page";
	};
};
pageName();
</script>
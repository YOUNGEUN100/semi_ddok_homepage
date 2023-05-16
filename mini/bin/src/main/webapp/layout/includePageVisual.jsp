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
	const pageNameList = urlList[urlList.length - 1].split('.');
	const pageName = pageNameList[0];
	console.log(pageId);
	console.log(pageName);
	
	switch(pageId){
	case "todayEat" : 
		pageInfo.innerHTML = "오늘도 무엇을 어떻게 먹을지 고민중이신가요?";
		pageIcon.setAttribute("src", "/images/pageVisual_icon01.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "funding" : 
	case "flea" : 
		pageInfo.innerHTML = "우리의 지갑과 통장은 소중하니까!";
		pageIcon.setAttribute("src", "/images/pageVisual_icon02.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "recipe" : 
	case "market" : 
	case "cart" : 
	case "order" : 
		pageInfo.innerHTML = "머리는 똑똑하게, 배는 빵빵하게";
		pageIcon.setAttribute("src", "/images/pageVisual_icon03.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "policy" : 
	case "livingTip" : 
	case "livingMap" : 
		pageInfo.innerHTML = "우리, 똑소리나게 알아두고 똑부러지게 살아봐요";
		pageIcon.setAttribute("src", "/images/pageVisual_icon04.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "community" : 
	case "qna" : 
		pageInfo.innerHTML = "우리, 똑소리나게 알아두고 똑부러지게 살아봐요";
		pageIcon.setAttribute("src", "/images/pageVisual_icon05.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "myPage" : 
	case "login" : 
	case "join" : 
		pageInfo.innerHTML = "똑똑과 함께하는 당신은 똑똑함 풀충전";
		pageIcon.setAttribute("src", "/images/pageVisual_icon00.png");
		pageIconBox.appendChild(pageIcon);
		break;
	case "sample" : 
		pageInfo.innerHTML = "샘플세팅 페이지입니다 😀";
		break;
	default :
		 pageInfo.innerHTML = "설정되지 않은 페이지입니다 😥";
	};
	
	switch(pageName){
	case "todayEat" : 
		document.title = "똑똑 :: 투데잇";
		pageTitle.innerHTML = "투데잇 : Today-Eat";
		break;
	case "store" : 
		document.title = "똑똑 :: 투데잇 - 맛집메뉴";
		pageTitle.innerHTML = "투데잇 : 맛집메뉴 추천";
		break;
	case "recipe" : 
		document.title = "똑똑 :: 투데잇 - 레시피";
		pageTitle.innerHTML = "투데잇 : 레시피 추천";
		break;
	case "result" : 
		const pageMidName = urlList[urlList.length - 2];
		if(pageMidName === "store"){
			document.title = "똑똑 :: 투데잇 - 맛집메뉴";
			pageTitle.innerHTML = "투데잇 : 맛집메뉴 추천";
			break;
		} else if(pageMidName === "recipe"){
			document.title = "똑똑 :: 투데잇 - 레시피";
			pageTitle.innerHTML = "투데잇 : 레시피 추천";
			break;
		} else{
			document.title = "똑똑";
			pageTitle.innerHTML = "noneSet Page";
			break;
		};
	case "funding" : 
		document.title = "똑똑 :: 소비N빵 - 랜선펀딩";
		pageTitle.innerHTML = "랜선펀딩";
		break;
	case "open" : 
		document.title = "똑똑 :: 소비N빵 - 랜선펀딩";
		pageTitle.innerHTML = "랜선펀딩 : 진행중";
		break;
	case "planned" :
		document.title = "똑똑 :: 소비N빵 - 랜선펀딩"; 
		pageTitle.innerHTML = "랜선펀딩 : 오픈예정";
		break;
	case "flea" : 
		document.title = "똑똑 :: 소비N빵 - 랜선장터";
		pageTitle.innerHTML = "랜선장터";
		break;
	case "recipe" : 
		document.title = "똑똑 :: 똑똑Eating - 레시피";
		pageTitle.innerHTML = "똑똑한 레시피";
		break;
	case "market" : 
		document.title = "똑똑 :: 똑똑Eating - 마켓";
		pageTitle.innerHTML = "똑똑한 마켓";
		break;
	case "cart" : 
		document.title = "똑똑 :: 똑똑Eating - 장바구니";
		pageTitle.innerHTML = "똑똑한 마켓 : 장바구니";
		break;
	case "order" : 
		document.title = "똑똑 :: 똑똑Eating - 주문";
		pageTitle.innerHTML = "똑똑한 마켓 : 주문";
		break;
	case "policy" : 
		document.title = "똑똑 :: 똑똑Living - 알쓸정책";
		pageTitle.innerHTML = "알쓸정책";
		break;
	case "livingTip" : 
		document.title = "똑똑 :: 똑똑Living - 생활백서";
		pageTitle.innerHTML = "생활백서";
		break;
	case "livingMap" : 
		document.title = "똑똑 :: 똑똑Living - 혼족여지도";
		pageTitle.innerHTML = "혼족여지도";
		break;
	case "community" : 
		document.title = "똑똑 :: 커뮤니티";
		pageTitle.innerHTML = "커뮤니티";
		break;
	case "qna" : 
		document.title = "똑똑 :: QnA - 커뮤니티";
		pageTitle.innerHTML = "QnA";
		break;
	case "view" : 
		const pageFstName = urlList[urlList.length - 2];
		if(pageFstName === "flea"){
			document.title = "똑똑 :: 소비N빵 - 랜선장터";
			pageTitle.innerHTML = "랜선장터";
			break;
		} else if(pageFstName === "recipe"){
			document.title = "똑똑 :: 똑똑Eating - 레시피";
			pageTitle.innerHTML = "똑똑한 레시피";
			break;
		} else if(pageFstName === "market"){
			document.title = "똑똑 :: 똑똑Eating - 마켓";
			pageTitle.innerHTML = "똑똑한 마켓";
			break;
		} else if(pageFstName === "cart"){
			document.title = "똑똑 :: 똑똑Eating - 장바구니";
			pageTitle.innerHTML = "똑똑한 마켓 : 장바구니";
			break;
		} else if(pageFstName === "order"){
			document.title = "똑똑 :: 똑똑Eating - 주문";
			pageTitle.innerHTML = "똑똑한 마켓 : 주문";
			break;
		} else if(pageFstName === "policy"){
			document.title = "똑똑 :: 똑똑Living - 알쓸정책";
			pageTitle.innerHTML = "알쓸정책";
			break;
		} else if(pageFstName === "livingTip"){
			document.title = "똑똑 :: 똑똑Living - 생활백서";
			pageTitle.innerHTML = "생활백서";
			break;
		} else if(pageFstName === "livingMap"){
			document.title = "똑똑 :: 똑똑Living - 혼족여지도";
			pageTitle.innerHTML = "혼족여지도";
			break;
		} else if(pageFstName === "community"){
			document.title = "똑똑 :: 커뮤니티";
			pageTitle.innerHTML = "커뮤니티";
			break;
		} else if(pageFstName === "qna"){
			document.title = "똑똑 :: QnA - 커뮤니티";
			pageTitle.innerHTML = "QnA";
			break;
		} else{
			document.title = "똑똑";
			pageTitle.innerHTML = "noneSet Page";
			break;
		};
	case "myPage" : 
		document.title = "똑똑 :: 마이페이지";
		pageTitle.innerHTML = "마이페이지";
		break;
	case "join" : 
		document.title = "똑똑 :: 회원가입";
		pageTitle.innerHTML = "회원가입";
		break;
	case "login" : 
		document.title = "똑똑 :: 로그인";
		pageTitle.innerHTML = "로그인";
		break;
	case "find" : 
		document.title = "똑똑 :: ID/PW 찾기";
		pageTitle.innerHTML = "ID/PW 찾기";
		break;
	case "sample" : 
		document.title = "똑똑";
		pageTitle.innerHTML = "sampleSet Page";
		break;
	default : 
		document.title = "똑똑";
		pageTitle.innerHTML = "noneSet Page";
	};
};
pageName();
</script>
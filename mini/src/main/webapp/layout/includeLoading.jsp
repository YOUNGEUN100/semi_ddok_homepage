<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="loading">
	<div class="progressBar" aria-hidden="true">
		<span class="progressBar_gauge"></span>
	</div>
	<p id="loadingText"></p>
</div>

<style>
#loading {position:absolute; top:0; left:0; width:100%; height:100%; z-index:99999; padding:0 20px; display:flex; flex-flow:column wrap; justify-content:center; align-items:center; text-align:center;}
#loading .progressBar {position:relative; width:300px; height:1em; border-radius:0.2em; background:var(--base-colorBasicGray); overflow:hidden;}
#loading .progressBar .progressBar_gauge {position:absolute; top:0; lefT:0; width:20px; height:1em; border-radius:0.2em; background:var(--main-colorRed); animation:loadingBar 3.5s ease-out;}
#loading #loadingText {margin-top:1em; font-weight:600; font-size:1.125em; color:var(--main-colorRed);}

@keyframes loadingBar {
	0% {width:0; opacity:1;}
	90% {width:100%; opacity:1;}
	100% {width:100%; opacity:0;}
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	result = $('#result');
	result.hide();
	setTimeout(function(){
		loading = $('#loading');
		loading.fadeOut();
		result.fadeIn();
	}, 3000);
});

function loadingText(){
	var loadingText = document.getElementById("loadingText");
	
	let urlList = window.location.href.split('/');
	const pageMidName = urlList[urlList.length - 2];
	
	switch(pageMidName){
	case "store" : 
		loadingText.innerHTML = "딱맞는 메뉴와 맛집을 찾는 중입니다.";
		break;
	case "recipe" : 
		loadingText.innerHTML = "딱맞는 레시피를 찾는 중입니다.";
		break;
	default : 
		loadingText.innerHTML = "로딩중";
	};
};
loadingText();
</script>
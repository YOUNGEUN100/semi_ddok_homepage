<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header id="header">
	<div class="wrapper">
		<h1 id="logo">
	        <a href="/main.do">똑똑</a>
	    </h1>
	    <nav id="gnbMenu" class="nav typeMenu">
	        <ul class="depth1">
	            <li class="menu01">
	                <a href="/todayEat.do">‘투데잇’ <small>Today-Eat</small></a>
	                <ul class="depth2">
	                    <li><a href="/todayEat/store.do">맛집메뉴 추천받기</a></li>
	                    <li><a href="/todayEat/recipe.do">레시피 추천받기</a></li>
	                </ul>
	            </li>
	            <li class="menu02">
	                <a href="/funding.do">소비N빵</a>
	                <ul class="depth2">
	                    <li><a href="/funding.do">랜선펀딩</a></li>
	                    <li><a href="/flea.do">랜선마켓</a></li>
	                </ul>
	            </li>
	            <li class="menu03">
	                <a href="/recipe.do">똑똑 Eating</a>
	                <ul class="depth2">
	                    <li><a href="/recipe.do">똑똑한 레시피</a></li>
	                    <li><a href="/market.do">똑똑한 마켓</a></li>
	                </ul>
	            </li>
	            <li class="menu04">
	                <a href="/policy.do">똑똑 Living</a>
	                <ul class="depth2">
	                    <li><a href="/policy.do">알쓸정책</a></li>
	                    <li><a href="/livingTip.do">생활백서</a></li>
	                    <li><a href="/livingMap.do">혼족여지도</a></li>
	                </ul>
	            </li>
	            <li class="menu05">
	                <a href="/community.do">커뮤니티</a>
	                <ul class="depth2">
	                    <li><a href="/community.do">커뮤니티</a></li>
	                    <li><a href="/qna.do">QnA</a></li>
	                </ul>
	            </li>
	        </ul>
	    </nav>
	    <ul id="gnbUser" class="nav typeUser">
	    	<template v-if="sessionId == ''">
		        <li><a href="/login.do" >로그인</a></li>
		        <li><a href="/join.do">회원가입</a></li>
			</template>
	        <template v-if="sessionId != ''">
		        <li class="helloText">{{sessionNick}}님, 안녕하세요😊<li>
		        <li><a href="/login.do" @click="fnLogout">로그아웃</a></li>
		        <li><a href="/myPage.do" >마이페이지</a></li>
	        </template>
	        <li><a href="/cart.do">장바구니</a></li>
	    </ul>
	</div>
</header>
<script type="text/javascript">
var app = new Vue({ 
    el: '#gnbUser',
    data: {
      list : []
      , info : {}
      , sessionId : "${sessionId}"
      , sessionStatus : "${sessionStatus}"
      , sessionNick : "${sessionNick}"
      , logFlg : false
     
    }   
    , methods: {
         fnMain : function(){
             var self = this;
             var nparmap = {id : self.sessionId };
             $.ajax({
                 url:"/main/session.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) { 
                	console.log(data);
                	lacation.href = "main.do";
 	               /* self.list = data.bbslist;
 	                self.logFlg =  true;*/
                 }
             });
    	 },
    	 fnChange :function(){
    		 var self = this;
    		 if(sesstionId == null){
    			 self.logFlg = false;
    		 }
    		 else{
    			 self.logFlg = true;
    		 }
         	 
    	 },
    	 fnLogout : function(){
             var self = this;
             self.logFlg = !self.logFlg;
             self.sessionId = "";
    	 },
    	 pageChange : function(url, param) {
     		var target = "_self";
     		if(param == undefined){
     		//	this.linkCall(url);
     			return;
     		}
     		var form = document.createElement("form"); 
     		form.name = "dataform";
     		form.action = url;
     		form.method = "post";
     		form.target = target;
     		for(var name in param){
 				var item = name;
 				var val = "";
 				if(param[name] instanceof Object){
 					val = JSON.stringify(param[name]);
 				} else {
 					val = param[name];
 				}
 				var input = document.createElement("input");
 	    		input.type = "hidden";
 	    		input.name = item;
 	    		input.value = val;
 	    		form.insertBefore(input, null);
 			}
     		document.body.appendChild(form);
     		form.submit();
     		document.body.removeChild(form);
     	}
     	
    	 
  	}   
    , created: function () {
    	
	}
});
</script>
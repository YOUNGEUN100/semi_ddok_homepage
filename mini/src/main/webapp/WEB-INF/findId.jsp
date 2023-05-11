<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	 .findArea{ 
        width: 600px; margin: -10px auto;
        background-color: #fff;}

    .findArea .idBox{
        box-shadow: -2px 0 5px 0 #ccc; padding: 15px;   
        border-top-left-radius: 10px; display: inline-block; width: 49.1%;
        border-bottom-left-radius: 10px; font-size: 1.2em; 
        font-weight: bold; text-align: center; margin-left: 5px;
        background-color: #fff; color: black;}
    .findArea .idBox::hover{background-color: ;}
    .findArea .pwBox{
        box-shadow: 2px 0 5px 0 #ccc; padding: 15px;
        border-top-right-radius: 10px; display: inline-block; width: 49.8%;
        border-bottom-right-radius: 10px; font-size: 1.2em; 
        font-weight: bold; text-align: center; margin-left: 1px;
        background-color: #fff; color: black;}

    .findArea .markEssential::before{content: '*'; color: #5EA152;}
    .findArea .inputBox  .markEssential{font-size: 0.9em; padding-left: 5px;}
    .findArea .inputBox{
        margin-top: 55px; box-shadow: 0 0 5px #ccc; border-radius: 20px;
        padding: 50px 95px; font-weight: bold; font-size: 1.1em;
        } 
    .findArea .inputBox input{
        border: 0; border-bottom: 1px solid black;
        margin: 12px 5px; padding-left: 10px;
        margin-bottom: 30px; font-size: 0.88em;
    	}
    .findArea .inputBox .calender{ width: 30px; height: 30px;}
    .findArea .inputBox .w100{width: 100%;}
    .findArea .inputBox .w90{width: 90%;}
    .findArea .inputBox select{
        margin-top: 7px; font-size: 0.9em; padding: 8px; 
        margin-left: 8px; margin-bottom: 10px;}
    .findArea .inputBox input::placeholder{font-size: 1.05em;}
    input[type="date"]::placeholder{
		color: #888; font-family:'Pretendard-bold'; font-weight: lighter; font-size: 0.95em;
		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Medium.woff') format('woff');}
	input[type="date"]::-webkit-calendar-picker-indicator {
		  color: rgba(0, 0, 0, 0); /*숨긴다*/
		  opacity: 1;
		  display: block;
		  background: url("images/calender_final.png") no-repeat; /*대체할 아이콘*/
		  width: 20px;
		  height: 20px;
		  border-width: thin; margin-right: 5px; margin-bottom:5px; margin-left: 10px;}

    .findArea .inputBox .findIdBtn{
        margin-top: 20px; background-color: #5EA152; color: #fff;
        padding: 12px; border: 0; border-radius: 10px; width: 78%; margin-left: 50px;
        font-weight: bold; font-size: 1.1em; margin-bottom: 15px;
    	}
    
     .findArea .reultBox{
        margin-top: 55px; box-shadow: 0 0 5px #ccc; border-radius: 20px;
        padding: 50px 95px; font-weight: bold; font-size: 1.1em;
        } 
      .findArea .reultBox .guideBox{
          text-align: center; font-size: 1.1em; margin-bottom: 40px;
          margin-top: -10px;
          }
      .findArea .reultBox .titleId{
          display: inline-block; width: 50%; text-align: end; 
          font-size: 0.9em; padding-right: 30px;
          }
      .findArea .reultBox .findId{
        display: inline-block; width: 50%; text-align: start; 
        font-size: 0.9em; color: #5EA152;
        }

      .findArea .reultBox .findLoginBtn{
        margin-top: 40px; background-color: #5EA152; color: #fff;
        padding: 12px; border: 0; border-radius: 10px; width: 78%; margin-left: 50px;
        font-weight: bold; font-size: 1.1em; margin-bottom: 5px; text-align: center; 
    	} 
    
      .findArea .reultBox .guideNullBox{
          text-align: center; font-size: 1.1em;
          margin-top: 10px;
          }
      .findArea .reultBox .findJoinBtn{
        margin-top: 40px; background-color: #5EA152; color: #fff;
        padding: 12px; border: 0; border-radius: 10px; width: 78%; margin-left: 50px;
        font-weight: bold; font-size: 1.1em; margin-bottom: 5px; text-align: center; 
    	} 
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<!-- wrap START -->
    	<div id="app" class="findArea" >
	        <a href="/findId.do" class="idBox">아이디 찾기 </a><a href="/findPw.do" class="pwBox">비밀번호 찾기</a>
	        <div class="inputBox" v-if="!findBtn">
	            <div class="markEssential" >이름</div>
	            <input type="text" v-model="name" placeholder="이름을 입력해주세요" class="w100">
	            <div class="markEssential">전화번호</div>
	            <input type="tel" v-model="hp" placeholder="가입 시 입력했던 휴대폰번호('-'제외 11자리 입력)" class="w100">
	            <div class="markEssential">생년월일</div>
	            <input type="date" v-model="birth" class="date w100"> 
	            <button class="findIdBtn" @click="fnFindId">아이디 찾기</button>
	        </div>
	        	<template v-else>
				<div class="reultBox" v-if="findResult">
		            <div class="guideBox">고객님의 아이디는 아래와 같습니다.</div>
		            <div class="titleId">아이디</div><div class="findId">{{id}}</div>
		            <a class="findLoginBtn" href="/login.do">로그인 하기</a>
	        	</div>
	        	
	        	<div class="reultBox" v-else>
		            <div class="guideNullBox">
		                <div>입력하신 내용과 일치한</div>
		                <div>고객님의 가입정보가 없습니다.</div>
		            </div>
		            <a class="findJoinBtn" href="/join.do">회원가입 하기</a>
	        	</div>
        		</template>
    	</div>
    	
    	<!-- wrap END -->

	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    		name :"",
    		hp : "",
    		birth: "",
    		id:"",
    		findBtn : false,
    		findResult : true
    }
    , methods : {
		   	 fnFindId : function(data){
		 		var self = this;
		 		var nparmap ={name : self.name, hp : self.hp, birth:self.birth};
		 		$.ajax({
		            url:"/user/findId.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {  
		            	if(data.cnt > 0){
		            		console.log(data);
		            		self.findBtn = true;
		            		self.findResult = true;
		            		self.id = data.id.userId;
		            	}
		            	else{
		            		self.findBtn = true;
		            		self.findResult = false;
		            	}
		            	
		            }
	        }); 
	 	}
    }	
    , created: function () {
    
	}
});
</script>

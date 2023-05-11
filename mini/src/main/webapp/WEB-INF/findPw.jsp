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
    .findArea .inputBox .w100{width: 100%;}
    .findArea .inputBox select{
        margin-top: 7px; font-size: 0.9em; padding: 8px; 
        margin-left: 8px; margin-bottom: 10px;}
    .findArea .inputBox input::placeholder{font-size: 1.05em;}

    .findArea .inputBox .findIdBtn{
        margin-top: 20px; background-color: #5EA152; color: #fff;
        padding: 12px; border: 0; border-radius: 10px; width: 78%; margin-left: 50px;
        font-weight: bold; font-size: 1.1em; margin-bottom: 15px;
    	}
    .findArea .resultBox{
         margin-top: 55px; box-shadow: 0 0 5px #ccc; border-radius: 20px;
         padding: 50px 95px; font-weight: bold; font-size: 1.1em;
         }
    .findArea .markEssential::before{content: '*'; color: #5EA152;}
    .findArea .resultBox  .markEssential{font-size: 0.9em; padding-left: 5px;}
    .findArea .resultBox{
        margin-top: 55px; box-shadow: 0 0 5px #ccc; border-radius: 20px;
        padding: 50px 95px; font-weight: bold; font-size: 1.1em;
        } 
    .findArea .resultBox .guideChangeBox{
        font-size: 1.1em; text-align: center;
        margin-top: -10px; margin-bottom: 15px;
        }
   .findArea .resultBox .pw{
       display : inline-block; margin-right:5px
       }
    .findArea .resultBox .pwck{
    display : inline-block; margin-right:5px
    }
       
    .findArea .resultBox input{
        border: 0; border-bottom: 1px solid black;
        margin: 13px 5px; padding-left: 10px;
        margin-bottom: 30px; font-size: 0.88em;
    	}
   	.findArea .resultBox .ableId{
	      	font-size: 0.7em; color: #5EA152;
	      }
    .findArea .resultBox .disableId{
	       font-size: 0.7em; color: red;
	      }
    .findArea .resultBox .w100{width: 100%;}

    .findArea .resultBox .findPwBtn{
	     margin-top: 20px; background-color: #5EA152; color: #fff;
	     padding: 12px; border: 0; border-radius: 10px; width: 78%; margin-left: 50px;
	     font-weight: bold; font-size: 1.1em; margin-bottom: 15px;
	    }
    .findArea .resultBox .w100{width: 100%;}
    .findArea .resultBox .titleId {
	      display: inline-block; width: 50%; text-align: end; 
	      font-size: 0.9em; padding-right: 40px; margin-top: 25px;
	      }
    .findArea .resultBox .titlePw {
	    display: inline-block; width: 50%; text-align: end; 
	    font-size: 0.9em; padding-right: 30px;
	    }
    .findArea .resultBox .findId{
        display: inline-block; width: 50%; text-align: start; 
        font-size: 0.9em; color: #5EA152;
        }

    .findArea .resultBox .loginBtn{
        margin-top: 40px; background-color: #5EA152; color: #fff;
        padding: 12px; border: 0; border-radius: 10px; width: 78%; margin-left: 50px;
        font-size: 1.1em; margin-bottom: 5px; text-align: center; font-weight: 550;
        }
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<!-- wrap START -->
    	<div id="app" class="findArea">
        <a href="/findId.do" class="idBox">아이디 찾기</a><a href="/findPw.do" class="pwBox">비밀번호 찾기</a>
        <div class="inputBox" v-if="!findPw">
            <div class="markEssential">아이디</div>
            <input type="text" v-model="id" placeholder="아이디 입력(영문, 숫자포함 6~20자)" class="w100">
            <div class="markEssential">이름</div>
            <input type="text" v-model="name" placeholder="이름을 입력해 주세요" class="w100">
            <div class="markEssential">비밀번호 질문</div>
            <select class="w100" v-model="pwQ">
                <option>질문 선택</option>
                <option>자신의 인생 좌우명은?</option>
                <option>가장 기억에 남는 선생님 성함은?</option>
                <option>추억하고 싶은 날짜가 있다면?</option>
                <option>유년시절 가장 생각나는 친구의 이름은?</option>
                <option>인상깊게 읽은 책 이름은?</option>
                <option>자신이 두번째로 존경하는 인물은?</option>
                <option>다시 태어나면 되고 싶은 것은?</option>
            </select>
            <input type="text" v-model="pwA" placeholder="선택한 질문에 대한 답변" class="w100">
            <button class="findIdBtn" @click="fnFindPw()">비밀번호 찾기</button>
        </div>
        	<template v-else>
	         	<div class="resultBox" v-if="!changePw">
		            <div class="markEssential pw">새로운 비밀번호</div><div v-if="pw == ''"></div>
		            <template v-else-if="pw != '' && pw.length >= 20">  
                    	<span class="captionCheck disableId">20자 이내의 비밀번호를 입력해주세요</span>
                    </template>
		            <input type="password" v-model="pw" class="w100" placeholder="비밀번호 입력(영문,숫자,특수문자 포함 8-20자)" maxlength="20">
		            <div class="markEssential pwck">새로운 비밀번호 확인</div><div v-if="pw == ''"></div>
		            <template v-else-if="pw != '' && pwCheck">
		            	<span class="ableId" v-if="pw == pwck">비밀번호가 일치합니다.</span>
                    	<span class="disableId" v-else>비밀번호가 일치하지않습니다.</span>
		            </template>
		            <input type="password" v-model="pwck"class="w100" placeholder="비밀번호 재입력" maxlength="20">
		            <button class="findPwBtn" @click="fnUpdatePw">비밀번호 변경하기</button>
		        </div>
		        
		        <div class="resultBox" v-else>
		            <div class="guideChangeBox">
		                <div>고객님의 비밀번호가</div>
		                <div>아래와 같이 변경되었습니다.</div>
		            </div>
		            <div class="titleId">아이디</div><div class="findId">{{id}}</div>
		            <div class="titlePw">비밀번호</div><div class="findId">{{pw}}</div>
		            <a href="javascript:;" class="loginBtn">로그인 하기</a>
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
    		info : {},
    		id :"",
    		name : "",
    		pwQ: "질문 선택",
    		pwA:"",
    		pw: "",
    		pwck:"",
    		findPw : false,
    		changePw : false,
    		pwCheck : false
    		
    		
    }
    , methods : {
		   	 fnFindPw : function(data){
		 		var self = this;
		 		var nparmap ={id : self.id, name : self.name, pwQ:self.pwQ, pwA : self.pwA};
		 		$.ajax({
		            url:"/user/findPw.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {  
		            	console.log(data);
		            	self.findPw = true;
		            }
	        }); 
	 	},
	 	
	 	fnUpdatePw : function(){
    		var self = this;
	      	var nparmap = self.pw;
	      	nparmap.pw = self.pw;
	        $.ajax({
	            url:"/pwUpdate.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	self.changePw = true;
					
	            }
	        }); 
    	},
    	
    	fnPwCheck : function(){
    		var self = this;
    		self.pwCheck = true;
    	}
    }	
    , created: function () {
    
	}
});
</script>

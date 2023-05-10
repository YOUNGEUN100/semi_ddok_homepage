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
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<!-- wrap START -->
    	<div id="app" class="findArea">
	        <a href="/findId.do" class="idBox">아이디 찾기 </a><a href="/findPw.do" class="pwBox">비밀번호 찾기</a>
	        <div class="inputBox">
	            <div class="markEssential" >이름</div>
	            <input type="text" v-model="name" placeholder="이름을 입력해주세요" class="w100">
	            <div class="markEssential">전화번호</div>
	            <input type="tel" v-model="hp" placeholder="가입 시 입력했던 휴대폰번호('-'제외 11자리 입력)" class="w100">
	            <div class="markEssential">생년월일</div>
	            <input type="date" v-model="birth" class="date w100"> 
	            <button class="findIdBtn" @click="fnFindId">아이디 찾기</button>
	        </div>
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
    		birth: ""
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
		            	console.log(data);
		            	location.href="/findId/result.do"
		            }
	        }); 
	 	}
    }	
    , created: function () {
    
	}
});
</script>
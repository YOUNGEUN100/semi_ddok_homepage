<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
     .joinArea{
	      background-color: #fff;
	      width: 480px; margin: 0 auto;
	      border-radius: 20px;
	      box-shadow: 0 0 10px #dddddd;
	      padding: 30px 80px; 
	     }

     .joinArea .captionEssential {
	       font-size: 13px; 
	       display: flex; 
	       flex-wrap: nowrap; 
	       justify-content: end;
	       margin-bottom: 10px;
	      }

  	 	
     .joinArea .joinBox .disableId{
	       font-size: 0.8em; color: red;
	      }
     .joinArea .joinBox template{display: inline-block;}
     .joinArea .joinBox .ableId{
	      	font-size: 0.8em; color: #5EA152;
	      }
     .joinArea .joinBox .captionBox .id{font-weight: bold; font-size: 0.95em; display : inline-block;}
     .joinArea .joinBox .captionBox .pw{font-weight: bold; font-size: 0.95em; display : inline-block;}
     .joinArea .joinBox .captionBox .pwck{font-weight: bold; font-size: 0.95em; display : inline-block;}
     .joinArea .joinBox .nick{font-weight: bold; font-size: 0.95em; display : inline-block;}
     .joinArea .joinBox input{
	       border: 0; border-bottom: 1px solid black;
	       padding: 10px; margin-bottom: 20px; border-radius: 0%; 
	      }
     
     .joinArea .joinBox input[type=date]{border: 0; border-bottom: 1px solid black;
     		 margin-bottom: 20px; }
     .joinArea .joinBox .duplicationBtn{
	       border-radius: 8px; border: 0.7px solid black;
	       background-color: #fff; padding: 5px 13px; 
	       font-weight: bold; font-size: 0.75em;}
     .joinArea .joinBox p{
	       font-weight: bold; font-size: 0.9em;
	      }
     .joinArea .joinBox .hint{border: 1px solid #ccc; width: 100%;
          border-radius: 5px; padding: 5px; padding-left: 10px; 
          font-weight: bold; margin-top: 5px; margin-bottom: 10px;}
     .joinArea .joinBox .mail{border: 1px solid #ccc;  
          border-radius: 5px; padding: 8px; font-weight: bold; 
          width: 45%; margin-left: 6px; padding-left: 10px;}
     .joinArea .joinBox .zipCode{margin-bottom:5px;}
     .joinArea .joinBox .addr{margin-bottom:5px;}
     .joinArea .joinBox .zipcodeBtn{
          border-radius: 5px; border: 0.7px solid black;
          background-color: #fff; padding: 8px 30px; 
          font-weight: bold; font-size: 0.7em;}
     .captionEssential::before{content:'* '; color:#5EA152;}
     .markEssential::before {content:'* '; color:#5EA152;}
     .joinArea .joinBox .markEssential{margin-right: 5px;}
     .joinArea .joinBox .accountFind{font-size: 0.8em; color: #5EA152;}
     .joinArea .joinBox .w100{width: 100%;}
     .joinArea .joinBox .w90{width: 85%; margin-right: 15px; }
     .joinArea .joinBox .w80{width: 72%; margin-right: 8px;}
     .joinArea .joinBox .w50{width: 45%; margin-right: 7px;}
     .joinArea .joinBox .w60{width: 55%; margin-right: 10px;}

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
		  border-width: thin; margin-right:-10px; margin-bottom:-10px; margin-left:10px;}
     .joinArea .joinBtn{
         background-color: #5EA152; color:#fff; 
         border-radius: 8px; padding: 10px; border: 0; font-weight: bold; 
         width: 76%; margin-left: 30px;}
     
     .joinArea .joinBox input::placeholder{
     	font-size:0.85em;
     	}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
	
		<div id="app" class="joinArea">
		
            <span class="captionEssential">표시는 필수입력</span>
            
            <div class="joinBox" >
            
                <div class="captionBox">
                
                    <div class="markEssential id">아이디</div><div v-if="info.id == ''"></div>
	                    <template v-else-if="info.id != '' && info.id.length >= 20"> <!-- 20자 초과시 -->
	                    	<span class="disableId" >20자를 초과하였습니다.</span> 
	                    </template>
	                   
	                    <template v-else-if="info.id != '' && idCk " ><!--중복체크-->
	                      <span class="ableId" v-if="idFlg && aaa">사용가능한 아이디입니다</span>
	                      <span class="disableId" v-if="!aaa">영문과 숫자의 조합만 가능합니다</span>
	                      <span class="disableId" v-if="!idFlg">이미 사용중인 아이디입니다</span> 
	                    </template>
	                    
	                    
	                    <div v-else></div>

                    <input type="text" v-model="info.id" id="id" maxlength="20" class="w80" placeholder="아이디 입력(영문,숫자 포함 6~20자)"><button class="duplicationBtn" @click="fnCheck">중복체크</button>
                </div> 
                
                <div class="captionBox">

                    <div class="markEssential pw">비밀번호</div> <div  v-if="info.pw == ''"></div>
               		<template v-else> 
	                	<span class="disableId" v-if="!pwValid">비밀번호 형식을 맞춰주세요</span>
	                	<span class="ableId" v-else>올바른 형식의 비밀번호입니다</span>
                	</template>
                    
<!--                     <template v-else-if="info.pw != '' && !pwValid"> -->
<!--                     	<span class="ableId" v-if="pwValid">올바른 형식의 비밀번호입니다</span> -->
<!--                     	<span class="disableId">올바른 형식의 비밀번호가 아닙니다</span> -->
<!--                     </template> -->
                    
                    <input type="password" id="password" v-model="info.pw" class="w100" maxlength="20" placeholder="비밀번호 입력(영문,숫자,특수문자 포함 8~20자)" @keyup="fnPwCheck">
                </div>
                
                <div class="captionBox">
                    <div class="markEssential pwck">비밀번호 확인</div> <div v-if="info.pw == ''"></div>
                    
                    <template v-else>
                    	<span class="disableId"  v-if="info.pw != info.pwck">비밀번호가 일치하지않습니다.</span>
                    	<span class="ableId" v-else>비밀번호가 일치합니다.</span>
                	</template>	
                </div>
                
                <input type="password" class="w100"  placeholder="비밀번호 재입력" v-model="info.pwck">
                
                
                <p class="markEssential">이름</p>
                <input type="text" class="w100" placeholder="이름을 입력해 주세요" v-model="info.name">
                
                
                <div class="markEssential nick">닉네임</div><div  v-if="info.nick == ''"></div>
                
                <template v-else-if="info.nick != '' && nickCk">
                	<span class="ableId" v-if="nickFlg">사용 가능한 닉네임입니다.</span>
                	<span class="disableId" v-else>이미 사용중인 닉네임입니다.</span>
                </template>
                
                <div  v-else></div>
                
                <input type="text" class="w80" placeholder="활동할 닉네임을 입력해 주세요" v-model="info.nick"><button class="duplicationBtn" @click="fnNickCheck">중복 체크</button>
                
                
                <p class="markEssential">전화번호</p>
                <input type="tel" id="tel" @keypress="fnNumber" class="w100"  maxlength="14" placeholder="휴대폰 번호를 입력('-'제외 11자리 입력)" v-model="info.hp">
                
                
                <p>이메일주소</p>
                <input type="email" class="w50" placeholder="이메일 주소" v-model="info.email">@ 
                <select class="mail" v-model="info.domain">
                    <div>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option>kakao.com</option>
					    <option>hanmail.net</option>
					    <option>hotmail.com</option>
					    <option>korea.com</option>
					    <option>nate.com</option>
                    </div>
                </select> 
                
                
                <p class="markEssential daumMap">주소</p>
                <input type="number" v-model="info.zipCode" class="w60 zipCode" placeholder="우편번호" @click="fnSearchAddr" readonly="readonly"><button class="zipcodeBtn" @click="fnSearchAddr">우편번호 찾기</button>
                <input type="text" v-model="info.addr" class="w100 addr" placeholder="주소" >
                <input type="text" v-model="info.addr2" class="w100 addr2" placeholder="상세주소 입력" >
                
                
                <div>
                    <span class="markEssential">생년월일</span><span class="accountFind">※계정찾기에 활용됩니다</span>
                    <input type="date" name="birth" v-model="info.birth" class="date w100">
                </div>
                
                
                <div>
                    <span class="markEssential">비밀번호 질문</span><span class="accountFind">※계정찾기에 활용됩니다</span>
                    <select class="hint" v-model="info.pwQ">
                        <option >질문선택</option>
                        <option>자신의 인생 좌우명은?</option>
                        <option>가장 기억에 남는 선생님 성함은?</option>
                        <option>추억하고 싶은 날짜가 있다면?</option>
                        <option>유년시절 가장 생각나는 친구의 이름은?</option>
                        <option>인상깊게 읽은 책 이름은?</option>
                        <option>자신이 두번째로 존경하는 인물은?</option>
                        <option>다시 태어나면 되고 싶은 것은?</option>
                    </select>
                    
                    <input type="text" v-model="info.pwA" class="w100" placeholder="선택한 질문에 대한 답변 입력">
                </div>
                
                
                <p>자취경력</p>
                <input type="text" class="w90" v-model="info.livingYear" placeholder="자취경력 햇수 입력"> 년차
           	</div>
           	
	            <div class="btnBox">
	                <button class="joinBtn" @click="fnJoin">가입하기</button>
	            </div>
        </div>
	
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
	} 
	
	
	
var app = new Vue({ 
    el: '#app',
    data: {
    	info : {
    		id : ""
   	    	, pw : ""
   	    	, pwck : ""
   	    	, name : ""
   	    	, nick : ""
   	    	, hp : ""
   	    	, email : ""
   	    	, domain :"naver.com"
   	    	, addr : ""
   	    	, zipCode :""
   	    	, addr :""
   	    	, addr2 :""
   	    	, birth :""
   	    	, livingYear :""
   	    	, pwQ : "질문선택"
   	    	, pwA : ""
   	    	
    	},
    	  idFlg : true
    	, roadFullAddr : ""
    	, idCk : false
    	, nickFlg : true
    	, nickCk : false
    	, sessionId : "${sessionId}"
    	, idValid : false
    	, pwValid : false
   		, pwFlg : false
   		, aaa : true
   		

    }
   
    
    , methods : {
    	//회원가입
    	fnJoin : function(){
    		var self = this;
    		if(self.info.id == ""){
    			alert("아이디를 입력해주세요");
    			return;
    		}
    		if(!self.idFlg){
    			alert("아이디 중복체크를 해주세요")
    			return;
    		}
    		if(self.info.pw == ""){
    			alert("비밀번호를 입력해주세요");
    			return;
    		}
    		if(self.info.pw != self.info.pwck){
    			alert("비밀번호가 일치하지 않습니다.");
    			return;
    		}
    		if(!self.pwValid){
    			alert("비밀번호형식을 다시 확인해주세요");
    			return;
    		}
    		if(self.info.name == ""){
    			alert("이름을 입력해주세요");
    			return;
    		}
    		if(self.info.nick == ""){
    			alert("닉네임을 입력해주세요");
    			return;
    		}
    		if(!self.nickFlg){
    			alert("닉네임 중복체크를 해주세요.")
    			return;
    		}
    		if(self.info.hp == ""){
    			alert("핸드폰 번호를 입력해주세요");
    			return;
    		}
    		if(self.info.addr == ""){
    			alert("주소를 입력해주세요");
    			return;
    		}
    		if(self.info.addr2 == ""){
    			alert("상세주소를 입력해주세요");
    			return;
    		}
    		if(self.info.birth == ""){
    			alert("생일을 입력해주세요");
    			return;
    		}
    		if(self.info.pwQ == ""){
    			alert("비밀번호 질문을 선택해주세요");
    			return;
    		}
    		if(self.info.pwA == ""){
    			alert("비밀번호 힌트를 입력해주세요");
    			return;
    		}
    		
	      	var nparmap = self.info;
	      	self.info.email = self.info.email + "@" + self.info.domain;
	        $.ajax({
	            url:"/join.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
	           	 	alert("회원가입이 완료되었습니다.");
	           	 	location.href="/login.do";
	            }
	        }); 
    		
   	 }
   	 //아이디 중복체크
   	 	, fnCheck : function(){
	   	 	var self = this;
	   	 	var str = /^[a-zA-Z0-9]*$/;
	   	 	if(!str.test(self.info.id)){
	   	 		self.aaa= false;
	   	 		console.log(self.aaa);
	   	 	} else {
	   	 		self.aaa= true;
	   	 		console.log(self.aaa);
	   	 	};
	   	 	var nparmap = {id : self.info.id};
	        $.ajax({
	            url:"/user/check.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	if(data.cnt > 0){
	            		self.idFlg = false;
	            		self.idCk = true;	
	            	}
	            	else{
	            		self.idCk = true;
	            		self.idFlg = true;
	            	}
		        }
	        }); 
   	 	
   	 	   },
   	 	   
   	 	   fnPwCheck : function() {
   	 		   var self = this;
   	 		   var str = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
   	 		   if(!str.test(self.info.pw)){
   	 			   self.pwValid = false;
   	 			   console.log(self.pwValid);
   	 		   } else {
   	 			   self.pwValid = true;
   	 			console.log(self.pwValid);
   	 		   }
   	 	   },
   	 	//닉네임 중복체크
		   	 fnNickCheck : function(){
		 		var self = this;
		 		var nparmap ={nick : self.info.nick};
		 		$.ajax({
		            url:"/user/nickCheck.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {  
		            	console.log(data);
		            	if(data.cnt > 0){
		            		console.log(data.cnt);
		            		self.nickFlg = false;
		            		self.nickCk = true;
		            	}
		            	else{
		            		self.nickCk = true;
		            		self.nickFlg = true;
		            	}
			        }
		        }); 
		 	},
		
	 	//주소
		 fnSearchAddr : function(){
	 		var self = this;
	 		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	 		window.open("addr.do", "test", option);
	 	 },
	 	 fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.roadFullAddr = roadFullAddr;
    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
    		self.info.zipCode = zipNo;
    		self.info.addr = roadAddrPart1;
    		self.info.addr2 = addrDetail;
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	 },
    	 fnNumber : function(){
    		 var self = this;
    		 self.info.hp = self.info.hp.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '%1');
    	 }
    	 

		
    	
    	
    		
    }   
    , created: function () {
    
	}
});
</script>
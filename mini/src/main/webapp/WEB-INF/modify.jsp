<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	.editArea{
        background-color: #fff;
        width: 480px; margin: 0 auto;
        border-radius: 20px;
        box-shadow: 0 0 10px #dddddd;
        padding: 40px 80px; 
       }

     .editArea .captionEssential {
      font-size: 13px; 
      display: flex; 
      flex-wrap: nowrap; 
      justify-content: end;
      margin-bottom: 10px;
     }

     .editArea .editBox .captionCheck{
      font-size: 0.8em; color: red;
     }
     .editArea .editBox .captionBox span:first-child{font-weight: bold; font-size: 0.9em;}
     .editArea .editBox input{
      border: 0; border-bottom: 1px solid black; 
      padding: 7px; margin-bottom: 20px; border-radius:0;
     }
     .editArea .editBox input::placeholder{font-size:0.85em;}
     .editArea .editBox .duplicationBtn{
      border-radius: 8px; border: 0.7px solid black;
      background-color: #fff; padding: 5px 13px; 
      font-weight: bold; font-size: 0.8em;}
     .editArea .editBox p{
      font-weight: bold; font-size: 0.9em;
     }
     .editArea .editBox .disableId{
	       font-size: 0.8em; color: red;
	      }
     .editArea .editBox template{display: inline-block;}
     .editArea .editBox .ableId{
	      	font-size: 0.8em; color: #5EA152;
	      }
     .editArea .editBox .captionBox .pw{font-weight: bold; font-size: 0.95em; display : inline-block;}
     .editArea .editBox .captionBox .pwck{font-weight: bold; font-size: 0.95em; display : inline-block;}
     .editArea .editBox .hint{border: 1px solid #ccc; width: 100%;
          border-radius: 5px; padding: 5px; padding-left: 10px; 
          font-weight: bold; margin-top: 5px; margin-bottom: 10px;}
      .editArea .editBox .mail{border: 1px solid #ccc;  
          border-radius: 5px; padding: 8px; font-weight: bold; 
          width: 45%; margin-left: 6px; padding-left: 10px;}
      .editArea .editBox .zipCode{margin-bottom:5px;}
      .editArea .editBox .addr{margin-bottom:5px;}
      .editArea .editBox .zipcodeBtn{
          border-radius: 5px; border: 0.7px solid black;
          background-color: #fff; padding: 8px 30px; 
          font-weight: bold; font-size: 0.7em;}
      .editArea .editBox .gender{margin-bottom: 10px; }
      .editArea .editBox .genderValue{margin-right: 10px; }
      .editArea .editBox .genderBox{margin-right: 50px; font-size: 0.9em; font-weight: bold;}
      .captionEssential::before{content:'* '; color:#5EA152;}
      .markEssential::before {content:'* '; color:#5EA152;}
      .editArea .editBox .markEssential{margin-right: 5px;}
      .editArea .editBox .accountFind{font-size: 0.8em; color: #5EA152;}
      .editArea .editBox .w100{width: 100%;}
      .editArea .editBox .w90{width: 85%; margin-right: 15px;}
      .editArea .editBox .w80{width: 233px; margin-right: 7px;}
      .editArea .editBox .w50{width: 45%; margin-right: 7px;}
      .editArea .editBox .w60{width: 55%; margin-right: 10px;}
      .editArea .editBox .unchangeable{padding: 8px; border-bottom:1px solid black; margin-bottom:20px; color:#888; font-size:0.9em;}
      .editArea .editBox .nickChange{cursor: pointer;}
      
      input[type="date"]::placeholder{
		color: #888; font-family:'Pretendard-bold'; font-weight: lighter; font-size: 0.9em;
		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Medium.woff') format('woff');}
      input[type="date"]::-webkit-calendar-picker-indicator {
		  color: rgba(0, 0, 0, 0); /*숨긴다*/
		  opacity: 1;
		  display: block;
		  background: url("images/calender_final.png") no-repeat; /*대체할 아이콘*/
		  width: 20px;
		  height: 20px;
		  border-width: thin; margin-right:-10px; margin-bottom:-10px; margin-left:10px;}
      .editArea .joinBtn{
           background-color: #5EA152; color:#fff; 
           border-radius: 8px; padding: 10px; border: 0; font-weight: bold; 
           width: 76%; margin-left: 30px;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="app" class="editArea">
        <div class="editBox">
            <div class="captionBox">
                <span class="markEssential">아이디</span>
                <div class="unchangeable">{{user.userId}} <small>(아이디는 변경불가)</small></div>
            </div> 
           
            <div class="captionBox">
                <div class="markEssential pw">비밀번호</div> <div v-if="info.pw == ''"></div>
                <template v-else> 
                	<span class="captionCheck" v-if="info.pw.length >= 20">20자 이내의 비밀번호를 입력해주세요</span>
                	<span v-else></span>
                </template>
                
                <input type="password" class="w100" placeholder="변경할 비밀번호 입력(영문,숫자,특수문자 포함 8~20자)" v-model="info.pw" maxlength="20">
            </div>
           
            <div class="captionBox">
                <div class="markEssential pwck">비밀번호 확인</div> <div v-if="info.pwck == ''"></div>
	                <template v-else>
	                	<span class="ableId" v-if="info.pw == info.pwck">비밀번호가 일치합니다</span>
	                	<span class="disableId" v-else>비밀번호가 일치하지않습니다.</span>
	            	</template>
            </div>
            <input type="password" class="w100" placeholder="비밀번호 재입력" v-model="info.pwck">
           
            <p class="markEssential">이름</p>
            <div class="unchangeable">{{user.name}}<small>(변경은 고객센터로 문의해주세요)</small></div>
           
            <p class="markEssential">닉네임</p>
            <div class="unchangeable nickChange" v-if="nickChange" @click="fnChage">{{user.nick}}<small> (변경하려면 클릭)</small></div>
            <div v-else>
            	<input type="text" class="w100" placeholder="변경할 닉네임을 입력해 주세요" v-model="info.nick">
            </div>
           
            <p class="markEssential">전화번호</p>
            <input type="tel" class="w100" placeholder="변경할 휴대폰 번호를 입력('-'제외 11자리 입력)" v-model="info.hp">
            
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
            
            <p class="markEssential">주소</p>
            <input type="text" class="w60 zipCode" @click="fnSearchAddr" placeholder="우편번호" v-model="info.zipCode" readonly="readonly"><button class="zipcodeBtn" @click="fnSearchAddr">우편번호 찾기</button>
            <input type="text" class="w100 addr" placeholder="주소" v-model="info.addr">
            <input type="text" class="w100 addr2" placeholder="상세주소 입력" v-model="info.addr2">
            
            <p class="gender" >성별</p>
            <label for="M" class="genderBox"><input type="radio" id="M" name="gender" class="genderValue" v-model="info.gender" value="M">남성</label>
            <label for="F" class="genderBox"><input type="radio" id="F" name="gender" class="genderValue" v-model="info.gender" value="F">여성</label>
            
            <div>
                <p class="markEssential">생년월일</p>
                <div class="unchangeable">{{user.birth}} <small>(변경은 고객센터로 문의해주세요)</small></div>
            </div>
            
            <p>자취경력</p>
            <input type="text" class="w90" placeholder="자취경력 햇수 입력" v-model="info.livingYear"> 년차
            
        </div>
        
        <div class="btnBox">
            <button class="joinBtn" @click="fnEditUser">변경하기</button>
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
    	user : [],
    	info:{
    		id:"",
    		pw:"",
    		pwck:"",
    		nick:"",
    		hp:"",
    		email:"",
    		domain:"naver.com",
    		zipCode:"",
    		addr:"",
    		addr2:"",
    		gender:"",
    		livingYear:""
    	},
    	
    	sessionId : "${sessionId}",
    	sessionPw : "${sessionPw}",
    	nickChange: true
    	
    }
    , methods : {
    	//기존 정보 보여주기
    	fnUserList : function(){
            var self = this;
            var nparmap = {id : self.sessionId, pw: self.sessionPw};
            $.ajax({
                url:"/modify/view.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	if(self.sessionId == ''){
                		alert("로그인을 해주세요");
                		location.href = "/login.do";
                		return;
                	} else{
                	console.log(self.sessionId);
                	self.user = data.user;
                	console.log(data.user);
                	}

                }
            });

        },
        //입력한 정보로 업데이트
        fnEditUser : function() {
            var self = this;
            self.info.id = self.sessionId;
            self.info.pw = self.sessionPw;
            var nparmap = self.info;
            	$.ajax({
    	            url:"/user/modify.dox",
    	            dataType:"json",	
    	            type : "POST", 
    	            data : nparmap,
    	            success : function(data) { 
    	            	console.log(data)
    	            }
    	        }); 
	        
        },
        
        
    	
        fnChage : function(){
        	var self = this;
        	self.nickChange = !self.nickChange;
        }
        ,	
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
     	}  	 
	}	
    , created: function () {
    	var self = this;
    	self.fnUserList();
	}
});
</script>

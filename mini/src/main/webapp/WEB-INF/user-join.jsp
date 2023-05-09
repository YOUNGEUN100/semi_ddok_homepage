<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="js/jquery.js"></script>
    <script src="js/vue.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>똑똑 : "메뉴명을 입력해 주세요."</title>
    <style>
        /* style START */
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
       .joinArea .joinBox .ableId{
       	font-size: 0.8em; color: #5EA152;
       }
       .joinArea .joinBox .captionBox span:first-child{font-weight: bold; font-size: 0.9em;}
       .joinArea .joinBox input{
        border: 0; border-bottom: 1px solid black; 
        padding: 10px; margin-bottom: 20px; 
       }
       .joinArea .joinBox .duplicationBtn{
        border-radius: 8px; border: 0.7px solid black;
        background-color: #fff; padding: 5px 13px; 
        font-weight: bold; font-size: 0.8em;}
       .joinArea .joinBox p{
        font-weight: bold; font-size: 0.9em;
       }
       .joinArea .joinBox .hint{border: 1px solid #ccc; width: 100%;
            border-radius: 5px; padding: 5px; padding-left: 10px; 
            font-weight: bold; margin-top: 5px; margin-bottom: 10px;}
        .joinArea .joinBox .mail{border: 1px solid #ccc;  
            border-radius: 5px; padding: 8px; font-weight: bold; 
            width: 45%; margin-left: 6px; padding-left: 10px;}
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
       .joinArea .joinBox .w90{width: 85%; margin-right: 15px;}
       .joinArea .joinBox .w80{width: 233px; margin-right: 7px;}
       .joinArea .joinBox .w50{width: 45%; margin-right: 7px;}
       .joinArea .joinBox .w60{width: 55%; margin-right: 10px;}
       .joinArea .joinBox .calender{ width: 30px; height: 30px;}
       .joinArea .joinBtn{
            background-color: #5EA152; color:#fff; 
            border-radius: 8px; padding: 10px; border: 0; font-weight: bold; 
            width: 76%; margin-left: 30px;}
        
        /* style END */
    </style>
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <div id="subVisual">&lt;subVisual&gt;</div>
    <!-- wrap START -->
        <div id="app" class="joinArea">
            <span class="captionEssential">표시는 필수입력</span>
            <div class="joinBox" >
                <div class="captionBox">
                    <div class="markEssential">아이디</div>  
                    <template v-if="info.id != ''">
	                  <span class="ableId" v-if="idFlag">사용할 수 있는 아이디입니다</span>
	                  <span class="disableId" v-else>사용할 수 없는 아이디입니다</span>
	                 </template>
                    <input type="text" v-model="info.id"class="w80" placeholder="아이디 입력(영문,숫자 포함 6~20자)"><button class="duplicationBtn" @click="fnChange">중복검사</button>
                </div> 
                <div class="captionBox">
                    <span class="markEssential">비밀번호</span>  <span class="captionCheck">20자 이내의 비밀번호를 입력해주세요</span>
                    <input type="password" v-model="info.pw" class="w100" placeholder="비밀번호 입력(영문,숫자,특수문자 포함 8~20자)">
                </div>
                <div class="captionBox">
                    <span class="markEssential">비밀번호 확인</span> <span class="captionCheck">비밀번호가 일치하지않습니다.</span>
                </div>
                <input type="password" class="w100" placeholder="비밀번호 재입력" v-model="pwck">
                <p class="markEssential">이름</p>
                <input type="text" class="w100" placeholder="이름을 입력해 주세요" v-model="info.name">
                <p class="markEssential">닉네임</p>
                <input type="text" class="w100" placeholder="활동할 닉네임을 입력해 주세요" v-model="info.nick">
                <p class="markEssential">전화번호</p>
                <input type="tel" class="w100" placeholder="휴대폰 번호를 입력('-'제외 11자리 입력)" v-model="info.hp">
                <p>이메일주소</p>
                <input type="email" class="w50" placeholder="이메일 주소" v-model="info.email">@ 
                <select class="mail" v-model="info.email">
                    <div>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option>kakao.com</option>
					    <option>hanmail.net</option>
					    <option>hotmail.com</option>
					    <option>korea.com</option>
					    <option>nate.com</option>
					    <option>yahoo.com</option>
                    </div>
                </select> 
                <p class="markEssential daumMap">주소</p>
                <input type="number" v-model="info.zipCode" class="w60 zipCode" placeholder="우편번호" id="sample6_postcode"><button class="zipcodeBtn" @click="sample6_execDaumPostcode()">우편번호 찾기</button>
                <input type="text" v-model="info.addr" class="w100 addr" placeholder="주소" id="sample6_address">
                <input type="text" v-model="info.addr2" class="w100 addr2" placeholder="상세주소 입력"  id="sample6_detailAddress">
                <div>
                    <span class="markEssential">생년월일</span><span class="accountFind">※계정찾기에 활용됩니다</span>
                    <input type="text" class="w90" placeholder="생년월일" v-model="info.birth"><img src="images/calender_final.png" class="calender">
                </div>
                <div>
                    <span class="markEssential">비밀번호 질문</span><span class="accountFind">※계정찾기에 활용됩니다</span>
                    <select class="hint" >
                        <option>질문선택</option>
                        <option>자신의 인생 좌우명은?</option>
                        <option>가장 기억에 남는 선생님 성함은?</option>
                        <option>추억하고 싶은 날짜가 있다면?</option>
                        <option>유년시절 가장 생각나는 친구의 이름은?</option>
                        <option>인상깊게 읽은 책 이름은?</option>
                        <option>자신이 두번째로 존경하는 인물은?</option>
                        <option>다시 태어나면 되고 싶은 것은?</option>
                    </select>
                    <input type="text" v-model="info.pwHint" class="w100" placeholder="선택한 질문에 대한 답변 입력">
                </div>
                <p>자취경력</p>
                <input type="text" class="w90" v-model="info.livingYear" placeholder="자취경력 햇수 입력"> 년차
           	</div>
	            <div class="btnBox">
	                <button class="joinBtn" @click="fnJoin">가입하기</button>
	            </div>
        </div>
    <!-- wrap END -->
    <footer id="footer">&lt;footer&gt;</footer>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
	el: '#app',
	data: {
		info : {
			joinId : "",
			pwd1 : "",
			pwd2 : "",
			name : "",
			nick : "",
			hp : "",
			email : "",
			zipCode:"",
			addr:"",
			addr2:"",
			birth:"",
			pwHint:"",
			livingYear:""
		}
		, idFlag : true
		, nickFlag : true
    },
	  methods: {
		  fnJoin : function(){
	    		var self = this;
	    		if(self.info.id == ""){
	    			alert("아이디를 입력해주세요");
	    			return;
	    		}
	    		if(!self.loginFlg){
	    			alert("아이디 중복체크를 해주세요.");
	    			return;
	    		}
	    		if(self.info.pw != self.info.pwck){
	    			alert("비밀번호가 일치하지않아요");
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
	    			alert("생년월일울 입력해주세요");
	    			return;
	    		}
	    		if(self.info.pwHint == ""){
	    			alert("비밀번호 힌트를 입력해주세요");
	    			return;
	    		}
	    		
	            var nparmap = self.info;
	            $.ajax({
	                url:"/join.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	alert("회원가입이 완료되었습니다.");
	                	location.href="/login.do";
	                }
	            }); 
	    		
	    	}
		    
		    , fnChange : function(){
		    	var self = this;
		    	var nparmap = {id : self.info.id};
	            $.ajax({
	                url:"/user/check.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	if(data.cnt > 0){
	                		self.idFlag = false;
	                	} else {
	                		self.idFlag = true;
	                	}
	                }
	            }); 
		    }
	    
	});
</script> 
<style>
    /* setting * don't touch */
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    @font-face {
        font-family:'Pretendard-Medium';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Medium.woff') format('woff');
        font-weight:500;
        font-style:normal;
    }
    @font-face {
        font-family:'Pretendard-SemiBold';
        src:url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff') format('woff');
        font-weight:700;
        font-style:normal;
    }
    @font-face {
        font-family:'Pretendard-Bold';
        src:url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Bold.woff') format('woff');
        font-weight:800;
        font-style:normal;
    }
    * {margin:0; padding:0; box-sizing:border-box;}
    html, body {font-family:'Pretendard-Regular'; font-size:16px; line-height:1.5;}
    a {color:inherit; text-decoration:none;}
    input {outline:0; border-radius:0; border-width:1px; padding:5px;}
    select {outline:0; border-radius:0; border-width:1px; padding:4px;}
    img {width:100%; max-width:100%; display:inline-block;}
    ol, ul ,li {list-style:none;}
    
    b, strong {font-family:'Pretendard-Bold';}
    :root {
        --main-colorGreen: #bdee71;
        --main-colorOrange: #fe6458;
        --base-colorDeepGray: #ccc;
        --base-colorLightGray: #f7f7f7;
    }
    ::-webkit-scrollbar {width:10px;}
    ::-webkit-scrollbar-track {background-color:transparent;}
    ::-webkit-scrollbar-thumb {background-color:var(--base-colorDeepGray); border:2px solid #fff; border-radius:5px;}
    ::-webkit-scrollbar-button {width:0; height:0;}
    
    #header, #footer, #subVisual {width:100%; height:100px; background:#eee; display:flex; justify-content:center; align-items:center;}
    #subVisual {height:300px; border-top:1px dotted #777; margin-bottom:60px;}
    #footer {margin-top:150px;}
    #wrapper {max-width:1240px; min-height:calc(100vh - 710px); margin:0 auto; padding:0 20px;}
</style>
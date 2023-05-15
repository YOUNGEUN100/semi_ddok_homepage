<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	.editArea{
        background-color: #fff;
        width: 480px; margin: 0 auto;
        border-radius: 20px;
        box-shadow: 0 0 10px #dddddd;
        padding: 30px 80px; 
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
      padding: 10px; margin-bottom: 20px; 
     }
     .editArea .editBox .duplicationBtn{
      border-radius: 8px; border: 0.7px solid black;
      background-color: #fff; padding: 5px 13px; 
      font-weight: bold; font-size: 0.8em;}
     .editArea .editBox p{
      font-weight: bold; font-size: 0.9em;
     }
     .editArea .editBox .hint{border: 1px solid #ccc; width: 100%;
          border-radius: 5px; padding: 5px; padding-left: 10px; 
          font-weight: bold; margin-top: 5px; margin-bottom: 10px;}
      .editArea .editBox .mail{border: 1px solid #ccc;  
          border-radius: 5px; padding: 8px; font-weight: bold; 
          width: 45%; margin-left: 6px; padding-left: 10px;}
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
        <div class="editBox" >
            <div class="captionBox">
                <span class="markEssential">아이디</span>
                <input type="text" class="w100" placeholder="아이디는 변경이 불가합니다" v-model="info.id" disabled>
            </div> 
            <div class="captionBox">
                <span class="markEssential">비밀번호</span>  <span class="captionCheck">20자 이내의 비밀번호를 입력해주세요</span>
                <input type="password" class="w100" placeholder="변경할 비밀번호 입력(영문,숫자,특수문자 포함 8~20자)" v-model="info.pw">
            </div>
            <div class="captionBox">
                <span class="markEssential">비밀번호 확인</span> <span class="captionCheck">비밀번호가 일치하지않습니다.</span>
            </div>
            <input type="password" class="w100" placeholder="비밀번호 재입력" v-model="info.pwck">
            <p class="markEssential">이름</p>
            <input type="text" class="w100" placeholder="이름을 변경하려면 고객센터로 문의해 주세요" v-model="info.name" disabled>
            <p class="markEssential">닉네임</p>
            <input type="text" class="w100" placeholder="변경할 닉네임을 입력해 주세요" v-model="info.nick">
            <p class="markEssential">전화번호</p>
            <input type="tel" class="w100" placeholder="변경할 휴대폰 번호를 입력('-'제외 11자리 입력)" v-model="info.phone">
            <p>이메일주소</p>
            <input type="email" class="w50" placeholder="이메일 주소" >@ 
            <select class="mail">
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
            <input type="number" class="w60 addr" placeholder="우편번호"><button class="zipcodeBtn">우편번호 찾기</button>
            <input type="text" class="w100 addr" placeholder="주소" v-model="info.addr">
            <input type="text" class="w100 " placeholder="상세주소 입력" v-model="info.addr2">
            <p class="gender">성별</p>
            <label for="M" class="genderBox"><input type="radio" id="M" name="gender" class="genderValue">남성</label>
            <label for="F" class="genderBox"><input type="radio" id="F" name="gender" class="genderValue">여성</label>
            <div>
                <p class="markEssential">생년월일</p>
                <input type="date" class="w100" placeholder="생년월일" v-model="info.birth">
            </div>
            <p>자취경력</p>
            <input type="text" class="w90" placeholder="자취경력 햇수 입력" v-model="info.id"> 년차
        </div>
        <div class="btnBox">
            <button class="joinBtn">변경하기</button>
        </div>
    </div>
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
 // 자바 스크립트 입력 
</script>

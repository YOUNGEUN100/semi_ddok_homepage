<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

       .joinArea .joinBox .captionCheck{
        font-size: 0.8em; color: red;
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
                    <span class="markEssential">아이디</span>  <span class="captionCheck">사용할 수 없는 아이디입니다</span>
                    <input type="text" class="w80" placeholder="아이디 입력(영문,숫자 포함 6~20자)"><button class="duplicationBtn">중복검사</button>
                </div> 
                <div class="captionBox">
                    <span class="markEssential">비밀번호</span>  <span class="captionCheck">20자 이내의 비밀번호를 입력해주세요</span>
                    <input type="password" class="w100" placeholder="비밀번호 입력(영문,숫자,특수문자 포함 8~20자)">
                </div>
                <div class="captionBox">
                    <span class="markEssential">비밀번호 확인</span> <span class="captionCheck">비밀번호가 일치하지않습니다.</span>
                </div>
                <input type="password" class="w100" placeholder="비밀번호 재입력" >
                <p class="markEssential">이름</p>
                <input type="text" class="w100" placeholder="이름을 입력해 주세요" >
                <p class="markEssential">닉네임</p>
                <input type="text" class="w100" placeholder="활동할 닉네임을 입력해 주세요" >
                <p class="markEssential">전화번호</p>
                <input type="tel" class="w100" placeholder="휴대폰 번호를 입력('-'제외 11자리 입력)" >
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
					    <option>yahoo.com</option>
                    </div>
                </select> 
                <p class="markEssential">주소</p>
                <input type="number" class="w60 zipCode" placeholder="우편번호" id="sample6_postcode"><button class="zipcodeBtn" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                <input type="text" class="w100 addr" placeholder="주소" id="sample6_address">
                <input type="text" class="w100 addr2" placeholder="상세주소 입력"  id="sample6_detailAddress">
                <div>
                    <span class="markEssential">생년월일</span><span class="accountFind">※계정찾기에 활용됩니다</span>
                    <input type="text" class="w90" placeholder="생년월일" ><img src="images/calender_final.png" class="calender">
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
                    <input type="text" class="w100" placeholder="선택한 질문에 대한 답변 입력" >
                </div>
                <p>자취경력</p>
                <input type="text" class="w90" placeholder="자취경력 햇수 입력" > 년차
           	</div>
	            <div class="btnBox">
	                <button class="joinBtn">가입하기</button>
	            </div>
        </div>
    <!-- wrap END -->
    <footer id="footer">&lt;footer&gt;</footer>
</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	 /*   new daum.Postcode({
	        oncomplete: function(data) {
	            //data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
	            
	        }
	    });*/
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
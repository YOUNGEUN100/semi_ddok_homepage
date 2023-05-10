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
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<!-- wrap START -->
    	<div class="findArea">
        <a href="/findId.do" class="idBox">아이디 찾기</a><a href="/findPw.do" class="pwBox">비밀번호 찾기</a>
        <div class="inputBox">
            <div class="markEssential">아이디</div>
            <input type="text" placeholder="아이디 입력(영문, 숫자포함 6~20자)" class="w100">
            <div class="markEssential">이름</div>
            <input type="text" placeholder="이름을 입력해 주세요" class="w100">
            <div class="markEssential">비밀번호 질문</div>
            <select class="w100">
                <option>질문 선택</option>
                <option>자신의 인생 좌우명은?</option>
                <option>가장 기억에 남는 선생님 성함은?</option>
                <option>추억하고 싶은 날짜가 있다면?</option>
                <option>유년시절 가장 생각나는 친구의 이름은?</option>
                <option>인상깊게 읽은 책 이름은?</option>
                <option>자신이 두번째로 존경하는 인물은?</option>
                <option>다시 태어나면 되고 싶은 것은?</option>
            </select>
            <input type="text" placeholder="선택한 질문에 대한 답변" class="w100">
            <button class="findIdBtn">비밀번호 찾기</button>
        </div>


    </div>
    	
    	<!-- wrap END -->

	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	
</script>

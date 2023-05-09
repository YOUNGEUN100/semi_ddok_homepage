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
       .loginArea{
            width: 400px; margin: 0 auto;
            box-shadow: 0 0 10px #e6e5e5; border-radius: 10px;
            padding: 70px;
       }

       .loginArea .loginBox{
        display: flex; flex-direction: column; justify-items: center; 
        align-items: center; 
       }
       .loginArea .loginBox input{
        border: none; border-bottom: 1px solid black;
        width: 100%; padding: 5px; margin-bottom: 20px; 
        padding-left: 10px;
       } 
       .loginArea .loginBox input:last-child{
        margin-bottom: 40px;
       }
       .loginArea .loginBox input::placeholder{color: black; font-weight: bold; font-size: 0.9em;}

       
       .loginArea .btnBox .loginBtn{
        background-color: #5EA152; border: none; color: #fff;
        border-radius: 10px; padding: 10px; width: 100%;
        font-weight: bold; font-size: 1em;
        margin-bottom: 30px;
       }

       .loginArea .linkBox{
        font-size: 0.8em; display: flex; flex-direction: row;
        flex-wrap: nowrap; justify-content: space-between;
       }


      
        /* style END */
    </style>
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <!-- wrap START -->
    <div class="loginArea">

        <div class="loginBox">
            <input type="text" placeholder="아이디">
            <input type="text" placeholder="비밀번호">
        </div> 

        <div class="btnBox">
            <button class="loginBtn">로그인</button>
        </div>
        <div class="linkBox">
            <a href="javascript:;">혹시 똑똑이 처음이신가요?</a>
            <a href="javascript:;">아이디/비밀번호 찾기</a>
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
    	id : ""
    	, pwd : ""
    	, user : {}
    }   
    , methods: {
    	
   	 }
      
    , created: function () {
    	
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
    * {margin:0; padding:0; box-sizing:border-box;}
    html, body {font-family:'Pretendard-Regular'; font-size:15px; line-height:1.5;}
    a {color:inherit; text-decoration:none;}
    input {outline:0; border-radius:0; border-width:1px; padding:5px;}
    select {outline:0; border-radius:0; border-width:1px; padding:4px;}
    img {width:100%; max-width:100%; display:inline-block;}
    ol, ul ,li {list-style:none;}
    
    #header, #footer {width:100%; height:100px; background:#eee; display:flex; justify-content:center; align-items:center;}
    #header {margin-bottom:70px;}
    #footer {margin-top:150px;}
    #wrapper {max-width:1200px; min-height:calc(100vh - 420px); margin:0 auto;}
</style>
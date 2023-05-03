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
        .log-box{
            margin: 200px auto;
            width: 400px;
            background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
        }
        h2{
            margin-top: 15px;
        }
        .div1{
            margin: auto;
            width: 250px;
            background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
        }
        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
	        }
        .in {
            margin-bottom: 10px;
        }

        #btn {
            background-color: #FCB577;
            margin-bottom: 30px; padding: 5px;
            color: black;
            border-radius: 5px; border: none;
        }

        a {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 12px;
        }
        /* style END */
    </style>
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <!-- wrap START -->
    <div id="wrapper">

        <div id="app" class="log-box">
            <h2>로그인</h2>
                <div class="div1">
                    <input type="text" class="in" placeholder="아이디" v-model="id"></input>
                </div>
                <div class="div1">
                    <input type="password" class="in" placeholder="비밀번호" v-model="pwd"></input>
                </div>
                <div class="div1">
                    <button id="btn" @click="fnLogin()">로그인</button>
                    <button id="btn" >회원가입</button>
                </div>
                <a href="find.do">비밀번호를 잊어버리셨나요?</a>
            </div> .

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
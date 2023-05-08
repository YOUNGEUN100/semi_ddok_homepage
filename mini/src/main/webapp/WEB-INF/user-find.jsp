<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�ȶ� : "�޴����� �Է��� �ּ���."</title>
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
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <div id="subVisual">&lt;subVisual&gt;</div>
    <!-- wrap START -->
    <div class="findArea">
        <div class="idBox">���̵� ã�� </div><div class="pwBox">��й�ȣ ã��</div>
        <div class="inputBox">
            <div class="markEssential">�̸�</div>
            <input type="text" placeholder="�̸��� �Է����ּ���" class="w100">
            <div class="markEssential">��ȭ��ȣ</div>
            <input type="tel" placeholder="���� �� �Է��ߴ� �޴�����ȣ('-'���� 11�ڸ� �Է�)" class="w100">
            <div class="markEssential">�������</div>
            <input type="number" placeholder="�������" class="w90"> 
            <button class="findIdBtn">���̵� ã��</button>
        </div>
    </div>
     <!-- wrap END -->
     <footer id="footer">&lt;footer&gt;</footer>
</body>
</html>
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
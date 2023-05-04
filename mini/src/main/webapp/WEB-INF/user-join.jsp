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
            <span class="captionEssential">ǥ�ô� �ʼ��Է�</span>
            <div class="joinBox" >
                <div class="captionBox">
                    <span class="markEssential">���̵�</span>  <span class="captionCheck">����� �� ���� ���̵��Դϴ�</span>
                    <input type="text" class="w80" placeholder="���̵� �Է�(����,���� ���� 6~20��)" v-model="info.id"><button class="duplicationBtn">�ߺ��˻�</button>
                </div> 
                <div class="captionBox">
                    <span class="markEssential">��й�ȣ</span>  <span class="captionCheck">20�� �̳��� ��й�ȣ�� �Է����ּ���</span>
                    <input type="password" class="w100" placeholder="��й�ȣ �Է�(����,����,Ư������ ���� 8~20��)" v-model="info.pw">
                </div>
                <div class="captionBox">
                    <span class="markEssential">��й�ȣ Ȯ��</span> <span class="captionCheck">��й�ȣ�� ��ġ�����ʽ��ϴ�.</span>
                </div>
                <input type="password" class="w100" placeholder="��й�ȣ ���Է�" v-model="info.pwck">
                <p class="markEssential">�̸�</p>
                <input type="text" class="w100" placeholder="�̸��� �Է��� �ּ���" v-model="info.name">
                <p class="markEssential">�г���</p>
                <input type="text" class="w100" placeholder="Ȱ���� �г����� �Է��� �ּ���" v-model="info.nick">
                <p class="markEssential">��ȭ��ȣ</p>
                <input type="tel" class="w100" placeholder="�޴��� ��ȣ�� �Է�('-'���� 11�ڸ� �Է�)" v-model="info.phone">
                <p>�̸����ּ�</p>
                <input type="email" class="w50" placeholder="�̸��� �ּ�" >@ 
                <select class="mail">
                    <div>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option>kakao.com</option>
                    </div>
                </select> 
                <p class="markEssential">�ּ�</p>
                <input type="number" class="w60 addr" placeholder="�����ȣ"><button class="zipcodeBtn">�����ȣ ã��</button>
                <input type="text" class="w100 addr" placeholder="�ּ�" v-model="info.addr">
                <input type="text" class="w100 " placeholder="���ּ� �Է�" v-model="info.addr2">
                <div>
                    <span class="markEssential">�������</span><span class="accountFind">�ذ���ã�⿡ Ȱ��˴ϴ�</span>
                    <input type="text" class="w90" placeholder="�������" v-model="info.birth"><img src="images/calender_final.png" class="calender">
                </div>
                <div>
                    <span class="markEssential">��й�ȣ ����</span><span class="accountFind">�ذ���ã�⿡ Ȱ��˴ϴ�</span>
                    <select class="hint" v-model="info.hint">
                        <option>��������</option>
                        <option>�ڽ��� �λ� �¿����?</option>
                        <option>���� ��￡ ���� ������ ������?</option>
                        <option>�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
                        <option>������� ���� �������� ģ���� �̸���?</option>
                        <option>�λ��� ���� å �̸���?</option>
                        <option>�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
                        <option>�ٽ� �¾�� �ǰ� ���� ����?</option>
                    </select>
                    <input type="text" class="w100" placeholder="������ ������ ���� �亯 �Է�" v-model="info.id">
                </div>
                <p>������</p>
                <input type="text" class="w90" placeholder="������ �޼� �Է�" v-model="info.id"> ����
           	</div>
	            <div class="btnBox">
	                <button class="joinBtn">�����ϱ�</button>
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
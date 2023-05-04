<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랜선펀딩1</title>
    <script src="https://kit.fontawesome.com/0012da89f1.js" crossorigin="anonymous"></script>
    <style>
        /* style START */
        /* * {
            border: 1px dotted rgb(223, 60, 141);
        } */

        .container {
            width: 1200px;            
            position: relative;
            margin: auto;

        }

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .box2 {
            width: 1200px;
            height: 1000px;
            margin-top: 80px;
            background-color: #ebebeb;
            max-height: 700px;
            overflow: hidden;
        }

        .fund_img1 {
            width: 500px;
            height: 500px;
            float: left;
            background-color: #ebebeb;
        }

        .fund_content {            
            width: 650px;
            height: 400px;
            margin-right: 0px;
            padding: 40px 30px;
            border: none;
            border-radius: 20px;
            box-sizing: border-box;
            float: right;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .fund_summary {
            margin-top: 30px;
            font-size: 15px;
        }

        .fund_cnt {
            display: inline-block;
            margin-top: 30px;
            font-size: 15px;
        }

        .fund_progress {
            width: 589px;
            height: 20px;
        }

        .price_box {
            margin-top: 15px;
            font-size: 20px;
        }

        .fund_price {
            font-size: 30px;
            font-weight: bold;
            color: #5ea152;
        }

        .apply_button {
            width: 540px;
            height: 80px;
            margin-top: 20px;
            margin-left: 49px;
            border-radius: 15px;
            background-color: #5ea152;
            border: none;
            font-size: 20px;
            color: white;
            font-weight: bold;
        }

        .share_button {
            width: 85px;
            height: 80px;
            margin-top: 20px;
            margin-left: 26px;
            border-radius: 15px;
            float: right;
            background-color: white;
            border: none;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            color : #5ea152;
        }

        .show_button {
            width: 1200px;
            height: 60px;
            margin-top: 20px;
            border-radius: 15px;
            background-color: white;
            border: 1px solid #5ea152;

        }

        #button_box1 {
            display: block;
        }

        #button_box2 {
            display: none;
        }
        

        /* style END */
    </style>
</head>

<body>
    <header id="header">&lt;header&gt;</header>
    <div id="subVisual">&lt;subVisual&gt;</div>
    <!-- wrap START -->
    <div id="wrapper">

        <div class="container">

            <div class="box1">
                <div class="fund_img1">product Image</div>

                <div class="fund_content">
                    <h1 class="fund_name">크리넥스 3겹 데코 앤 소프트 수딩플러스 화장지 27m 팩, 24롤</h1>
                    <p class="fund_summary">코튼과 알로에베라 로션으로 피부에 더 편안하고 부드러운 마무리의 도톰한 3겹 제품</p>
                    <span class="fund_cnt">100명 중 67명</span>
                    <span class="fund_cnt" style="float: right;">10일 남음</span>
                    <p></p>
                    <progress value="67" max="100" class="fund_progress"></progress>
                    <div class="price_box">
                        <span>공구가</span>
                        <span class="fund_price">19,900원</span>
                    </div>
                </div>

                <div>
                    <button class="apply_button">신청하기</button>
                    <button class="share_button"><i class="fa-solid fa-share-nodes fa-2xl"></i></button>
                </div>
            </div>

            <div class="box2" id="detail_box">
                <img src="//thumbnail7.coupangcdn.com/thumbnails/remote/q89/image/retail/images/5192348201152163-c0481b59-ca5b-41df-a8b1-2f803e7e30cf.jpg">
            </div>

            <div id="button_box1">
                <button onclick="show()" class="show_button">펼쳐보기</button>
            </div>

            <div id="button_box2">
                <button onclick="fold()" class="show_button">접기</button>
            </div>



        </div>

    </div>

    </div>
    <!-- wrap END -->
    <footer id="footer">&lt;footer&gt;</footer>
</body>

</html>
<script>

    function show() {
        document.getElementById('detail_box').style.overflow = 'visible';
        document.getElementById('button_box1').style.display = 'none';
        document.getElementById('button_box2').style.display = 'block';
    }

    function fold() {
        document.getElementById('detail_box').style.overflow = 'hidden';
        document.getElementById('button_box1').style.display = 'block';
        document.getElementById('button_box2').style.display = 'none';
    }

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
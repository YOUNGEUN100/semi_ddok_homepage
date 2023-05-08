<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>똑똑 : "똑똑한 레시피"</title>
    <script src="https://kit.fontawesome.com/3182501c90.js" crossorigin="anonymous"></script>
    <style>
         /* style START */
        body {
            background: url("/images/sub_dept3-1_smart_Eating_view") no-repeat;
        }
        .recipe-img {
            border-radius: 5px;
            width : 58%;
            height: 500px;
            margin-right: 30px;
        }
        .big-box {
            width: 42%;
            margin-bottom: 60px;
        }
        .recipe-info {
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 35px;
            padding: 20px 20px;
            margin-bottom: 30px;

            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 420px;
        }
        .recipe-info div {
            margin-right: 10px;
        }
        .recipe-save {
            display: flex;
            justify-content: space-between;
        }
        .recipe-info-box {
            display:flex;
            margin: 50px 0px;
            width: 100%;
        }
        @media screen and (max-width: 512px) {
            .recipe-info-box {
            display: block;
            margin: 50px 0px;
            width: 100%;
            }
            .recipe-img {
            width : 100%;
            height: auto;
            }
            .big-box {
            width: 100%;
            height: auto;
            margin-bottom: 60px;
            }
        }
       .re-icon {
            width:50px;
            text-align: center;
       }
       .recipe-simple-info {
             display: flex;
             justify-content: center;
             margin-top: 60px;
       }
       .box2 {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            width: 110px;
            margin: 0 10px;
       }
       .box2 div {
            font-size: large;
       }
       .recipe-name {
        margin-left: 40px;
        margin-bottom: 30px;
       }
       .recipe-name > div:last-child {
            margin-top: 5px;
          font-size:x-large;
       }
       .recipe-save-button {
            width: 68%;
            height: 55px;
            padding : 10px;
            font-size: large;
            border-radius: 15px;
            color:white;
            background-color: green;
            border-color: green;
       }
       .icon-print {
            width: 55px;
            height: 55px;
            background-color: black;
            border-radius: 10px;
            text-align: center;
            padding:15px 0px;
       }
       .icon-share {
            width: 55px;
            height: 55px;
            background-color: whitesmoke;
            border: 1px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 5px 0px #ece9e9;
            border-radius: 10px;
            text-align: center;
            padding:15px 0px;
       }
       .color-white {
            color: whitesmoke;
       }
       .ingre-name {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: large;
            margin-bottom: 20px;
        }
        .ingredient {
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 35px;
            padding: 20px 40px;
            margin-bottom: 30px;
            width: 100%;
        }
        .ingredient .ingre-info {
            margin-left: 50px;
        }
        .recipe-index {
            display: flex;
            margin-bottom: 30px;
        }
        .img-index {
            width: 60%;
        }
        .text-index {
            width : 40%;
            margin-left: 20px;
            margin-bottom: 20px;
            font-size: large;
            display: flex;
            flex-direction: column;
            justify-content: end;
        }
        @media screen and (max-width: 512px) {
            .recipe-index {
            display: block;
            }
            .img-index {
                width: 100%;
            }
            .text-index {
                width: 100%;
            }
        }

       
        /* style END */
    </style>
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <div id="subVisual">
        &lt;subVisual&gt;
        <div>
            <div>똑똑한 레시피</div>
            <div>머리는 똑똑하게, 배는 빵빵하게</div>
        </div>
    </div>
    <!-- wrap START -->
    <div id="wrapper">
        <div class="recipe-info-box">
            <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-10-22_1018447081[13].jpg">
            <div class="big-box">
                <div class="recipe-info">
                    <div class="recipe-name">
                        <div>#1인분 #냉장고털이 #빵</div>
                        <div><strong>채식 버거</strong></div>
                    </div>
                    <hr>
                    <div class="recipe-simple-info">
                        <div class="box2">
                            <img class="re-icon" src="images/icon_recipe01.png">
                            <div>조리도구</div>
                            <div>냄비/후라이팬</div>
                        </div>
                        <div class="box2">
                            <img class="re-icon" src="images/icon_recipe02.png">
                            <div>조리시간</div>
                            <div>20분 이내</div>
                        </div>
                        <div class="box2">
                            <img class="re-icon" src="images/icon_recipe03.png">
                            <div>난이도</div>
                            <div>쉬움</div>
                        </div>
                    </div>
                </div>
                <div class="recipe-save">
                    <button class="recipe-save-button">레시피 저장하기</button>
                    <div class="icon-print"><i class="color-white fa-solid fa-print fa-xl"></i></div>
                    <div class="icon-share"><i class="fa-solid fa-share-nodes fa-beat fa-xl"></i></div>
                </div>
            </div>
        </div>
        
        <div class="ingredient">
             <div class="ingre-name">
                <img class="re-icon" src="images/icon_recipe04.png">
                <span>레시피 재료</span>
            </div>
            <div class="ingre-info">햄버거빵, 표고버섯, 빵가루, 튀김가루, 소금, 후추, 마요네즈, 케챱, 콩기름</div>
        </div>

        <div class="ingredient">
            <div class="ingre-name">
                <img class="re-icon" src="images/icon_recipe05.png">
                <div>만드는 방법</div>
            </div>
                
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_1.jpg">
                <div class="text-index">
                    <div><strong>Step 1</strong></div>
                    <div>두부는 곱게 으깨고 물기를 뺀다</div>
                </div>
            </div>
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_2.jpg">
                <div class="text-index">
                    <div><strong>Step 2</strong></div>
                    <div>표고버섯은 밑동을 제거하고 스트링치즈는 작게 찢는다.</div>
                </div>
            </div>
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_3.jpg">
                <div class="text-index">
                    <div><strong>Step 3</strong></div>
                    <div>양파와 토마토는 편 썬다.</div>
                </div>
            </div>
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_4.jpg">
                <div class="text-index">
                    <div><strong>Step 4</strong></div>
                    <div>물기 뺀 두부에 소금과 후추로 간을 한다.
                        *두부의 수분을 최대한 많이 제거해야 패티를 만들기가 쉽다.</div>
                </div>
            </div>
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_5.jpg">
                <div class="text-index">
                    <div><strong>Step 5</strong></div>
                    <div>표고버섯 사이에 스트링치즈를 넣고 두부로 감싸 두부패티를 만든다.</div>
                </div>
            </div>
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_6.jpg">
                <div class="text-index">
                    <div><strong>Step 6</strong></div>
                    <div>두부패티를 튀김가루, 계란, 빵가루 순으로 묻혀 180도 기름에 4분간 튀긴다.</div>
                </div>
            </div>
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_7.jpg">
                <div class="text-index">
                    <div><strong>Step 7</strong></div>
                    <div>햄버거 빵은 후라이팬에 굽고 소이마요와 케챂을 한 면씩 바른다.</div>
                </div>
            </div>
            <div class="recipe-index">
                <img class="img-index" src="https://ottogi.okitchen.co.kr/pds/editor/117_8.jpg">
                <div class="text-index">
                    <div><strong>Step 8</strong></div>
                    <div>빵 위에 양상추, 튀긴 패티, 양파, 토마토 순으로 쌓아 완성한다.</div>
                </div>
            </div>
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
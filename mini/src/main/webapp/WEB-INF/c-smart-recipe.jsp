<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/3182501c90.js" crossorigin="anonymous"></script>
    <title>똑똑한 레시피</title>
    <style>
        /* style START */
        body {
            /* background: url("/images/work_img.jpg") no-repeat; */
        }
        #wrapper {
            text-align: center;
        }
        .category-img {
            width:100px;
            height: 100px;
            border-radius: 50%;
            background: rgba(232, 227, 227, 0.959);
            /* margin-bottom: 20px; */
        }
        .r-category {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
        }
        .box1 {
            text-align: center;
            margin: 0 25px;
        }

        @media screen and (max-width: 512px) {
            .box1 {
            text-align: center;
            margin: 0px 18px;
           }
           .box1 > div:last-child {
            margin: 0;
           }
        }

        .r-search {
            margin-top: 150px;
            margin-bottom: 70px;
        }
        .r-input {
            width: 40%;
            border : none;
            border-bottom: 1px solid black;
            padding-left: 30px;
            font-size: 18px;
            text-align: left;
            
        }

        @media screen and (max-width: 512px) {
            .r-input {
            width: 90%;
            padding-left: 0px;
            }
            .category-img {
            width: 30px;
            height: 30px;
            background-color: white;
            }
        }
            
        
        .c-icon {
            position:relative;
            bottom: 60px;
            
        }
        .search-icon {
            position: relative;
            right:30px;
        }
        .detail-category {
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 10px;
            padding: 20px 30px;
            margin-bottom: 70px;
        }
        .box2 {
            display: flex;
            padding: 20px;
        }
        .box2 div {
            margin-right: 50px;
            font-size: 20px;
        }
        .box2 a {
            margin-right: 20px;
            font-size: 20px;
        }

        @media screen and (max-width: 512px) {
            .box2 {
            display: block;
            }
            .box2 div {
            margin-right: 0;
            font-size: 20px;
            }
            .box2 a {
                display: flex;
                flex-direction: column;
                margin-right: 0px;
            }
        }
        .recipe-img {
            width:380px;
            height: 280px;
            margin-bottom: 10px;
        }
        .search-result-s {
            display: flex;
            justify-content:space-between;
            margin-bottom: 5px;
        }
        .search-result-s > div:first-child {
            font-size: 20px;
        }
        .search-result-s > div:last-child {
            font-size: 15px;
            position: relative;
            right:40px;
        }
        
        .search-result-d {
            display: flex;
        }

        @media screen and (max-width: 512px) {
            .search-result-d {
            display: block;
            }
            .item {
            margin-bottom: 30px;
            }
            .recipe-img {
            height: auto;
        }
        }
        .search-result-d div {
            margin-right: 15px;
        }
        .r-text {
            font-size: 20px;
            font-weight: bold;
        }
        .item {
            text-align: left;
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

        <div class="r-search">
            <input type="text" placeholder="원하는 재료나 레시피를 다양하게 검색해 보세요!" class="r-input">
            <i class="search-icon fa-solid fa-magnifying-glass fa-lg"></i>
        </div>
        <div class="r-category">
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-utensils fa-2xl"></i>
                <div>전체</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-bowl-food fa-2xl"></i>
                <div>목적</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-fish-fins fa-2xl"></i>
                <div>방법</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-egg fa-2xl"></i>
                <div>재료</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-kitchen-set fa-2xl"></i>
                <div>도구</div>
            </div>
        </div>
        <div class="detail-category">
            <div class="box2">
                <div><b>목적별</b></div>
                <a href="#">냉장고털이</a>
                <a href="#">해장</a>
                <a href="#">간식</a>
                <a href="#">야식</a>
                <a href="#">다이어트</a>
            </div>
            <hr>
            <div class="box2">
                <div><b>방법별</b></div>
                <a href="#">구이/부침</a>
                <a href="#">국탕찌개</a>
                <a href="#">볶음/조림</a>
                <a href="#">무침/비빔</a>
                <a href="#">기타</a>
            </div>
            <hr>
            <div class="box2">
                <div><b>도구별</b></div>
                <a href="#">냄비/후라이팬</a>
                <a href="#">전자레인지</a>
                <a href="#">에어프라이어/오븐</a>
                <a href="#">기타</a>
            </div>
        </div>
        <div>
            <div class="search-result-s">
                <div><b>검색결과 : "고기"</b></div>
                <div>총 3개의 레시피</div>
            </div>
            <div class="search-result-d">
                <div class="item">
                    <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-25_427865954[12].jpg">
                    <div>#덮밥요리 #햄 #마요네스</div>
                    <div class="r-text">햄마요덮밥</div>
                </div>
                <div class="item">
                    <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-25_427863666.jpg">
                    <div>#멕시코 #또띠아 #닭가슴살</div>
                    <div class="r-text">치킨 카레 타코</div>
                </div>
                <div class="item">
                    <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-24_427854552[10].jpg">
                    <div>#셰프의팁 #즉석국 #캠핑</div>
                    <div class="r-text">차돌박이 된장찌개</div>
                </div>
            </div>
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
    	fnRecipeList : function() {
    		var self = this;
    		var nparmap = "";
    		$.ajax ({
    			url:"/recipe/list.dox",
    			dataType : "json",
    			type : "POST",
    			data : nparmap,
    			success : function(data) {
    				
    			}
    		})
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	  /* style START */
        body {
            /* background: url("/images/work_img.jpg") no-repeat; */
        }
        #wrapper {
            text-align: center;
        }
        .category-circle {
            width:100px;
            height: 100px;
            border-radius: 50%;
            background: rgba(232, 227, 227, 0.959);
            /* margin-bottom: 20px; */
        }
        .category-circle:hover {
            background: #bdee71;
        }
        .r-category {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
        }
        .box1 {
            text-align: center;
            margin: 0 25px;
            cursor: pointer;
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
            cursor: pointer;
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
        .box2 a:hover {
            background-color: #bdee71;
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
            cursor: pointer;
        }
        .add_btn {
            float: left;
            margin-top: -220px;
            border: none;
            width: 100px;
            height: 40px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            font-size: 20px;
        }
        .re-view-cnt {
            display: inline-block;
            position: relative;
            left:285px;
            top:270px;
            padding: 3px 10px;
            color:white;
            background-color: rgba(16, 15, 15, 0.612);
            border-radius: 10px;
        }
       
        /* style END */
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <!-- wrap START -->
    <div id="wrapper">
         <button class="add_btn">등록</button>
        <div class="r-search">
            <input type="text" placeholder="원하는 재료나 레시피를 다양하게 검색해 보세요!" class="r-input">
            <i class="search-icon fa-solid fa-magnifying-glass fa-lg"></i>
        </div>
        <div class="r-category">
            <div class="box1" id="all-btn">
                <div class="category-circle"></div>
                <i class="c-icon fa-solid fa-utensils fa-2xl"></i>
                <div>전체</div>
            </div>
            <div class="box1" id="purpose-btn">
                <div class="category-circle"></div>
                <i  class="c-icon fa-solid fa-bowl-food fa-2xl"></i>
                <div>목적</div>
            </div>
            <div class="box1" id="howto-btn">
                <div class="category-circle"></div>
                <i class="c-icon fa-solid fa-fish-fins fa-2xl"></i>
                <div>방법</div>
            </div>
            <!-- <div class="box1">
                <div id="all-btn" class="category-img"></div>
                <i class="c-icon fa-solid fa-egg fa-2xl"></i>
                <div>재료</div>
            </div> -->
            <div class="box1" id="tool-btn">
                <div  class="category-circle"></div>
                <i class="c-icon fa-solid fa-kitchen-set fa-2xl"></i>
                <div>도구</div>
            </div>
        </div>
        <div class="detail-category">
            <div id="purpose" class="box2">
                <div><b>목적별</b></div>
                <a href="#">냉장고털이</a>
                <a href="#">해장</a>
                <a href="#">간식</a>
                <a href="#">야식</a>
                <a href="#">다이어트</a>
            </div>
            <hr class="line">
            <div id="howto" class="box2">
                <div><b>방법별</b></div>
                <a href="#">구이/부침</a>
                <a href="#">국탕찌개</a>
                <a href="#">볶음/조림</a>
                <a href="#">무침/비빔</a>
                <a href="#">기타</a>
            </div>
            <hr class="line">
            <div id="tool" class="box2">
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
                    <div>
                        <div class="re-view-cnt">
                            <i class="fa-solid fa-eye fa-lg"></i>
                            <span>365</span>
                        </div>
                        <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-25_427865954[12].jpg">
                    </div>
                    <div>#덮밥요리 #햄 #마요네스</div>
                    <div class="r-text">햄마요덮밥</div>
                </div>
                <div class="item">
                    <div>
                        <div class="re-view-cnt">
                            <i class="fa-solid fa-eye fa-lg"></i>
                            <span>365</span>
                        </div>
                        <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-25_427863666.jpg">
                    </div>
                    <div >#멕시코 #또띠아 #닭가슴살</div>
                    <div class="r-text">치킨 카레 타코</div>
                </div>
                <div class="item">
                    <div>
                        <div class="re-view-cnt">
                            <i class="fa-solid fa-eye fa-lg"></i>
                            <span>365</span>
                        </div>
                        <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-24_427854552[10].jpg">
                    </div>
                    <div>#셰프의팁 #즉석국 #캠핑</div>
                    <div class="r-text">차돌박이 된장찌개</div>
                </div>
            </div>
        </div>

    </div>
    <!-- wrap END -->
		
	
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	$(function () {
	    $("#all-btn").on("click", function() {
	        $("#purpose").show();
	        $("#howto").show();
	        $("#tool").show();
	        $(".line").show();
	    })
	})
	$(function () {
	    $("#purpose-btn").on("click", function() {
	        $("#purpose").show();
	        $("#howto").hide();
	        $("#tool").hide();
	        $(".line").hide();
	    })
	})
	$(function () {
	    $("#howto-btn").on("click", function() {
	        $("#purpose").hide();
	        $("#howto").show();
	        $("#tool").hide();
	        $(".line").hide();
	    })
	})
	$(function () {
	    $("#tool-btn").on("click", function() {
	        $("#purpose").hide();
	        $("#howto").hide();
	        $("#tool").show();
	        $(".line").hide();
	    })
	})
</script>

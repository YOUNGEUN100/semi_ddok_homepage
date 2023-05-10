<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	    /* style START */
      
        .btn {
            cursor: pointer;
        }
        .recipe-thumb-img {
            border-radius: 5px;
            width : 58%;
            margin-right: 30px;
        }
        .recipe-thumb-img > img {
            height: 500px;
            border-radius: 10px;
        }
        .re-view-cnt {
            position: relative;
            top:60px;
            left:20px;
            padding: 3px 10px;
            display: inline-block;
            color:white;
            font-size: x-large;
            background-color: rgba(16, 15, 15, 0.612);
            border-radius: 10px;
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
            margin-top: 40px;
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
            margin: 20px 0px 50px 0px;
            width: 100%;
            height: auto;
        }
        @media screen and (max-width: 512px) {
            .recipe-info-box {
            display: block;
            margin: 50px 0px;
            width: 100%;
            }
            .recipe-thumb-img {
                width: 100%;
                height: auto;
            }
            .recipe-thumb-img > img {
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
        .recipe-img {
            border-radius: 10px;
            width:600px;
            height: 400px;
            margin-bottom: 10px;
        }
        .search-result-s {
            display: flex;
            justify-content:space-between;
            margin-bottom: 5px;
        }
        .search-result-d {
            display: flex;
        }
        .search-result-s > div:first-child {
            font-size: 20px;
        }
        .search-result-s > div:last-child {
            font-size: 15px;
            position: relative;
            right:40px;
        }
        .r-text {
            font-size: 20px;
            font-weight: bold;
        }
        .item {
            text-align: left;
        }
        .market-item {
            margin-top: 100px;
        }

       
        /* style END */
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	 <!-- wrap START -->
    <div class="wrapper">
        <div class="recipe-info-box">
            <div class="recipe-thumb-img">
                <div class="re-view-cnt">
                    <i class="fa-solid fa-eye fa-lg"></i>
                    <span>365</span>
                </div>
                <img  src="https://ottogi.okitchen.co.kr/pds/upfile/2020-10-22_1018447081[13].jpg">
            </div>
           
            <div class="big-box">
                <div class="recipe-info">
                    <div class="recipe-name">
                        <div>#1인분 #냉장고털이 #빵</div>
                        <div><strong>채식 버거</strong></div>
                    </div>
                    <hr>
                    <div class="recipe-simple-info">
                        <div class="box2">
                            <img class="re-icon" src="/images/icon_recipe01.png">
                            <div>조리도구</div>
                            <div>냄비/후라이팬</div>
                        </div>
                        <div class="box2">
                            <img class="re-icon" src="/images/icon_recipe02.png">
                            <div>조리시간</div>
                            <div>20분 이내</div>
                        </div>
                        <div class="box2">
                            <img class="re-icon" src="/images/icon_recipe03.png">
                            <div>난이도</div>
                            <div>쉬움</div>
                        </div>
                    </div>
                </div>
                <div class="recipe-save">
                    <button class="btn recipe-save-button">레시피 저장하기</button>
                    <div class="btn icon-print"><i class="color-white fa-solid fa-print fa-xl"></i></div>
                    <div class="btn icon-share"><i class="fa-solid fa-share-nodes fa-beat fa-xl"></i></div>
                </div>
            </div>
        </div>
        
        <!-- 레시피 만드는 방법 시작 -->
        <div class="ingredient">
             <div class="ingre-name">
                <img class="re-icon" src="/images/icon_recipe04.png">
                <span>레시피 재료</span>
            </div>
            <div class="ingre-info">햄버거빵, 표고버섯, 빵가루, 튀김가루, 소금, 후추, 마요네즈, 케챱, 콩기름</div>
        </div>

        <div class="ingredient">
            <div class="ingre-name">
                <img class="re-icon" src="/images/icon_recipe05.png">
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
       <!-- 레시피 만드는 방법 끝 -->

       <div class="market-item">
        <div class="search-result-s">
            <div><b>레시피 관련 상품</b></div>
            <div>2개의 상품</div>
        </div>
        <div class="search-result-d">
            <div class="item">
                <img class="recipe-img" src="data:image/jpeg;base64,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">
                <div class="r-text">하인즈 스위트 칠리 소스</div>
                <div class="r-text">2,910원 (100g당 939원)</div>
                <div class="r-text">★ 4.2</div>


            </div>
            <div class="item">
                <img class="recipe-img" src="https://contents.lotteon.com/itemimage/_v070836/LM/88/05/99/96/01/01/4_/00/1/LM8805999601014_001_1.jpg">
                <div class="r-text">복음자리 45도 과일잼 딸기</div>
                <div class="r-text">8,900원 (100g당 1,271원)</div>
                <div class="r-text">★ 4.5</div>
            </div>
        </div>
    </div>



        

    </div>
    <!-- wrap END -->
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

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
            color: #5ea152;
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


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

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
                        <img
                            src="//thumbnail7.coupangcdn.com/thumbnails/remote/q89/image/retail/images/5192348201152163-c0481b59-ca5b-41df-a8b1-2f803e7e30cf.jpg">
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
    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">
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
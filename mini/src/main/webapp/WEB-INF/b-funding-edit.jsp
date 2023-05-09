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
            padding: 24px;
        }

        h1 {
            text-align: center;
        }

        .input_form {
            border: 1px solid #999999;
            border-radius: 10px;
            width: 1100px;
            margin: 50px auto;
            padding: 26px;
            border-radius: 15px;
            border: none;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .input_form div {
            margin-top: 16px;
        }

        .input_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }

        .input_box span {
            display: inline-block;
            width: 15%;
            font-size: 18px;
        }

        .input_box input {
            border: 1px solid #999999;
            border-radius: 10px;
            height: 40px;
        }

        .title,
        .summary {
            width: 80%;
        }

        .file_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }

        .content_box,
        .file_box p {
            font-size: 18px;
        }

        .content {
            width: 100%;
            border: 1px solid #999999;
            border-radius: 10px;
        }

        .btn_box button {
            border: none;
            width: 100px;
            height: 40px;
            margin-left: 16px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">
                <div class="container">

                    <div>
                        <h1>랜선펀딩 등록</h1>
                    </div>

                    <div class="input_form">

                        <div class="input_box">

                            <div class="title_box">
                                <span>제목</span> <input class="title" type="text">
                            </div>

                            <div class="summmary_box">
                                <span>요약설명</span> <input class="summary" type="text">
                            </div>

                            <div class="goal_box">
                                <span>펀딩목표수</span> <input class="goal" type="number" min="0">
                            </div>

                            <div class="open_date_box">
                                <span>펀딩시작일</span> <input class="open_date" type="date">
                            </div>

                            <div class="end_date_box">
                                <span>펀딩종료일</span> <input class="end_date" type="date">
                            </div>

                            <div class="price_box">
                                <span>가격</span> <input class="price" type="number" min="0">
                            </div>

                        </div>

                        <div class="file_box">

                            <div class="thumb_box">
                                <p>썸네일 이미지</p>
                                <form action="">
                                    <input type="file">
                                    <input type="submit">
                                </form>
                            </div>

                            <div class="detail_box">
                                <p>상세설명 이미지</p>
                                <form action="">
                                    <input type="file">
                                    <input type="submit">
                                </form>
                            </div>

                        </div>



                        <div class="content_box">
                            <p>내용</p> <textarea class="content" rows="15"></textarea>
                        </div>

                        <div class="btn_box">
                            <button>등록</button>
                            <button>수정</button>
                            <button>삭제</button>
                        </div>



                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">
	// 여기에 [script] 입력하세요
    </script>
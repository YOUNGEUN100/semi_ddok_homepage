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
            height: 100%;
            position: relative;
            margin: auto;
        }

        .board_title {
            text-align: center;
        }

        .board_wrap {
            border-radius: 15px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            width: 1200px;
            box-sizing: border-box;
            padding: 24px 24px;
            margin-top: 30px;
        }

        .title_box {
            border: 1px solid #999999;
            border-radius: 10px;
            height: 80px;
            padding: 16px;
        }

        .title_box h1 {
            display: inline-block;
        }

        .title_box span {
            display: inline-block;
            float: right;
            margin-top: 10px;
            margin-left: 36px;
            font-size: 25px;
        }

        .content_box {
            border: 1px solid #999999;
            border-radius: 10px;
            margin-top: 30px;
            height: 700px;
            padding: 16px;
            font-size: 20px;
            position: relative;
        }

        .content_box button {
            position: absolute;
            bottom: 10px;
            left: 50%;
            border: none;
            width: 150px;
            height: 60px;
            border-radius: 20px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        .comment_header {
            border: 1px solid #999999;
            border-radius: 10px;
            margin-top: 30px;
            height: 80px;
            padding: 16px;
        }

        .comment_box {
            border: 1px solid #999999;
            border-radius: 10px;
            margin-top: 30px;
            height: 300px;
            padding: 16px;
        }

        .comment_list {
            margin-top: 8px;
            border-bottom: 1px solid #999999;
        }

        .commenter {
            font-size: 20px;
        }

        .commenter span {
            margin-right: 15px;
        }

        .comment_content {
            font-size: 15px;
        }

        .btn_box {
            border: 1px dotted black;
            margin-top: 30px;
            height: 100px;
            padding: 16px;
        }

        .btn_box button {
            border: none;
            width: 150px;
            height: 60px;
            margin-left: 20px;
            border-radius: 20px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
            float: right;
        }



        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

                <div class="container">
                    <div class="board_title">
                        <h1>중고판매/중고나눔</h1>
                    </div>
                    <div class="board_wrap">

                        <div class="title_box">
                            <h1>[나눔중/판매중]</h1>
                            <h1>랜선마켓 글제목글제목글제목</h1>
                            <span>2023. 05. 04</span>
                            <span><i class="fa-solid fa-eye fa-lg"></i> 101</span>
                        </div>

                        <div class="content_box">
                            랜선마켓 글내용글내용
                            <button>나눔완료</button>
                        </div>

                        <div class="comment_header">
                            <h1>댓글</h1>
                        </div>

                        <div class="comment_box">
                            <div class="comment_list">
                                <div class="commenter">
                                    <span>작성자</span>
                                    <span>작성일자</span>
                                </div>
                                <div class="comment_content">
                                    <span>댓글내용댓글내용댓글내용댓글내용</span>
                                </div>
                            </div>
                            <div class="comment_list">
                                <div class="commenter">
                                    <span>작성자</span>
                                    <span>작성일자</span>
                                </div>
                                <div class="comment_content">
                                    <span>댓글내용댓글내용댓글내용댓글내용</span>
                                </div>
                            </div>

                        </div>

                        <div class="btn_box">
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

        var app = new Vue({
            el: '#app',
            data: {
                info: {},
                boardNo: "${map.boardNo}",
                sessionId: "${sessionId}"

            },
            methods: {
                fnGetFlea: function () {
                    var self = this;
                    var nparmap = {
                    	boardNo: self.boardNo
                    };
                    $.ajax({
                        url: "/flea/view.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.info = data.info;
                            console.log(data.info);

                        }
                    });
                }            	
            	
             	
            }
                ,
                created: function () {
                    var self = this;
                    self.fnGetFlea();
                }
            });
    </script>
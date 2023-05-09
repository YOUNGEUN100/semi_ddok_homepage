<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랜선마켓글</title>
    <script src="https://kit.fontawesome.com/0012da89f1.js" crossorigin="anonymous"></script>
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
            border-bottom : 1px solid #999999;
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
</head>

<body>
    <header id="header">&lt;header&gt;</header>
    <div id="subVisual">&lt;subVisual&gt;</div>
    <!-- wrap START -->
    <div id="wrapper">

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
    <!-- wrap END -->
    <footer id="footer">&lt;footer&gt;</footer>
</body>

</html>
<script>

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
        font-family: 'Pretendard-Medium';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Medium.woff') format('woff');
        font-weight: 500;
        font-style: normal;
    }

    @font-face {
        font-family: 'Pretendard-SemiBold';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff') format('woff');
        font-weight: 700;
        font-style: normal;
    }

    @font-face {
        font-family: 'Pretendard-Bold';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Bold.woff') format('woff');
        font-weight: 800;
        font-style: normal;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    html,
    body {
        font-family: 'Pretendard-Regular';
        font-size: 16px;
        line-height: 1.5;
    }

    a {
        color: inherit;
        text-decoration: none;
    }

    input {
        outline: 0;
        border-radius: 0;
        border-width: 1px;
        padding: 5px;
    }

    select {
        outline: 0;
        border-radius: 0;
        border-width: 1px;
        padding: 4px;
    }

    img {
        width: 100%;
        max-width: 100%;
        display: inline-block;
    }

    ol,
    ul,
    li {
        list-style: none;
    }

    b,
    strong {
        font-family: 'Pretendard-Bold';
    }

    :root {
        --main-colorGreen: #bdee71;
        --main-colorOrange: #fe6458;
        --base-colorDeepGray: #ccc;
        --base-colorLightGray: #f7f7f7;
    }

    ::-webkit-scrollbar {
        width: 10px;
    }

    ::-webkit-scrollbar-track {
        background-color: transparent;
    }

    ::-webkit-scrollbar-thumb {
        background-color: var(--base-colorDeepGray);
        border: 2px solid #fff;
        border-radius: 5px;
    }

    ::-webkit-scrollbar-button {
        width: 0;
        height: 0;
    }

    #header,
    #footer,
    #subVisual {
        width: 100%;
        height: 100px;
        background: #eee;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #subVisual {
        height: 300px;
        border-top: 1px dotted #777;
        margin-bottom: 60px;
    }

    #footer {
        margin-top: 150px;
    }

    #wrapper {
        max-width: 1240px;
        min-height: calc(100vh - 710px);
        margin: 0 auto;
        padding: 0 20px;
    }
</style>
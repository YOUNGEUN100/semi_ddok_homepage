<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>랜선펀딩0</title>
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
                padding : 16px;
            }

            .input_box span {
                display: inline-block;
                width: 15%;
                font-size: 18px;
            }            

            .title {
                width: 80%;
                border: 1px solid #999999;
                border-radius: 10px;
                height: 40px;
            }

            .file_box {
                border: 1px solid #999999;
                border-radius: 10px;
                padding : 16px;
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
    </head>

    <body>
        <header id="header">&lt;header&gt;</header>
        <div id="subVisual">&lt;subVisual&gt;</div>
        <!-- wrap START -->
        <div class="container">

            <div>
                <h1>랜선마켓 등록</h1>
            </div>

            <div class="input_form">

                <div class="category">

                    <select>
                        <option>거래</option>
                        <option>나눔</option>
                    </select>

                </div>

                <div class="input_box">

                    <div class="title_box">
                        <span>제목</span> <input class="title" type="text">
                    </div>

                </div>

                <div class="file_box">

                    <div class="detail_box">
                        <p>첨부파일</p>
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
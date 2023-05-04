<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
            height: 100%;
            position: relative;
            margin: auto;

        }

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .fund_title h1 {
            display: inline-block;
        }

        select {
            width: 80px;            
            float: right;
            background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99761B495C84AA8716') no-repeat 95% 50%;
            padding: .8em .5em;
            border: none;
            border-radius: 0px;
            appearance: none;
        }

        .box2 {
            width: 1200px;
            margin: auto;
            margin-top: 70px;
        }

        .fund_category {
            width: 1200px;
            text-align: center;
        }

        .category_btn {
            font-size: 20px;
            font-weight: bold;
            margin: 16px;
            width: 110px;
            height: 50px;
            border: none;
            border-radius: 50px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            background-color: white;
        }

        .open_list {
            border: none;
            box-sizing: border-box;
            padding: 26px;
            width: 1200px;
            height: 350px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .planned_list {
            border: none;
            box-sizing: border-box;
            padding: 26px;
            width: 1200px;
            height: 350px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .fund_img {
            background-color: #ebebeb;
            border-radius: 50%;
            width: 300px;
            height: 300px;
            float: left;
        }

        .fund_content {
            margin-top: 40px;
            margin-left: 50px;
            float: left;
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
            width: 735px;
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

        .open_detail {
            text-align: center;
            margin-top: 60px;
        }

        .open_detail button {
            border: none;
            width: 200px;
            height: 60px;
            border-radius: 20px;
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
    <div id="wrapper">

        <div class="container">
            <div class="fund_category">
                <button class="category_btn">진행중</button>
                <button class="category_btn">오픈예정</button>
            </div>

            <div class="box1">

                <div class="fund_title">
                    <h1>현재 진행중인 랜선펀딩</h1>
                    <select>
                        <option>최신순</option>
                        <option>가격순</option>
                    </select>
                </div>

                <div class="open_list_box">
                    <ul>
                        <li>
                            <div class="open_list">
                                <div class="fund_img"></div>
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
                            </div>
                        </li>
                        <li>
                            <div class="open_list">
                                <div class="fund_img"></div>
                            </div>
                        </li>
                        <li class="open_detail">
                            <button>더보기</button>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="box2">

                <div class="fund_title">
                    <h1>오픈 예정 펀딩</h1>
                    <select>
                        <option>첫번째 선택항목</option>
                        <option>두번째 선택항목</option>
                        <option>세번째 선택항목</option>
                    </select>
                </div>

                <div class="planned_list_box">
                    <ul>
                        <li>
                            <div class="planned_list">
                                <div></div>
                            </div>
                        </li>
                        <li>
                            <div class="planned_list"></div>
                        </li>
                        <li class="open_detail">
                            <button>더보기</button>
                        </li>
                    </ul>
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

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    html,
    body {
        font-family: 'Pretendard-Regular';
        font-size: 15px;
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
        margin-bottom: 70px;
    }

    #footer {
        margin-top: 150px;
    }

    #wrapper {
        max-width: 1200px;
        min-height: calc(100vh - 500px);
        margin: 0 auto;
    }
</style>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랜선마켓목록</title>
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

        table,
        td {
        	border: 1px dotted black;
            border-collapse: collapse;
            padding: 16px;
            table-layout: fixed;
        }

        #sale_flg {
            width: 100px;
        }

        #address {
            width: 150px;
        }

        #title {
            width: 530px;
        }

        #id {
            width: 150px;
        }

        #date {
            width: 150px;
        }

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .board_title h1 {
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

        .market_category {
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

        .purchase_list {
            border: none;
            box-sizing: border-box;
            padding: 40px 60px;
            width: 1200px;
            height: 420px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .split_list {
            border: none;
            box-sizing: border-box;
            padding: 40px 60px;
            width: 1200px;
            height: 420px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
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
            <div class="market_category">
                <button class="category_btn">중고판매</button>
                <button class="category_btn">중고나눔</button>
            </div>

            <div class="box1">

                <div class="board_title">
                    <h1>거래할 분을 찾고 있어요!</h1>
                    <select>
                        <option>최신순</option>
                        <option>조회수</option>
                    </select>
                </div>

                <div class="purchase_list">
                    <table>
                        <tr v-for="(item, index) in list">
                            <td id="sale_flg">{{item.finishYn}}</td>
                            <td id="address">{{item.addr}}</td>
                            <td id="title">{{item.title}}</td>
                            <td id="id">item.userId</td>
                            <td id="date">{{item.cdatetime}}</td>
                        </tr>                        
                    </table>
                </div>

                <div class="open_detail">
                    <button>더보기</button>
                </div>

            </div>

            <div class="box2">

                <div class="board_title">
                    <h1>나눔할 분을 찾고 있어요!</h1>
                    <select>
                        <option>최신순</option>
                        <option>조회수</option>
                    </select>
                </div>

                <div class="split_list">
                    <table>
                        <tr>
                            <td id="sale_flg">판매중</td>
                            <td id="address">서울특별시 구로구</td>
                            <td id="title">ddddddddddddddddddddddddddddd다</td>
                            <td id="id">아이디</td>
                            <td id="date">2023-05-01</td>
                        </tr>
                        <tr>
                            <td id="sale_flg">판매중</td>
                            <td id="address">서울특별시 구로구</td>
                            <td id="title">ddddddddddddddddddd팝니다</td>
                            <td id="id">아이디</td>
                            <td id="date">2023-05-01</td>
                        </tr>
                        <tr>
                            <td id="sale_flg">판매중</td>
                            <td id="address">서울특별시 구로구</td>
                            <td id="title">ddddddddddddddddddd팝니다</td>
                            <td id="id">아이디</td>
                            <td id="date">2023-05-01</td>
                        </tr>
                        <tr>
                            <td id="sale_flg">판매중</td>
                            <td id="address">서울특별시 구로구</td>
                            <td id="title">ddddddddddddddddddd팝니다</td>
                            <td id="id">아이디</td>
                            <td id="date">2023-05-01</td>
                        </tr>
                        <tr>
                            <td id="sale_flg">판매중</td>
                            <td id="address">서울특별시 구로구</td>
                            <td id="title">ddddddddddddddddddd팝니다</td>
                            <td id="id">아이디</td>
                            <td id="date">2023-05-01</td>
                        </tr>
                        <tr>
                            <td id="sale_flg">판매중</td>
                            <td id="address">서울특별시 구로구</td>
                            <td id="title">ddddddddddddddddddd팝니다</td>
                            <td id="id">아이디</td>
                            <td id="date">2023-05-01</td>
                        </tr>
                    </table>
                </div>

                <div class="open_detail">
                    <button>더보기</button>
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
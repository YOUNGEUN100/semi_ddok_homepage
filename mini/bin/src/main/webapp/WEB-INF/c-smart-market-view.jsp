<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="/HTML_20230427/js/jquery-3.6.4.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>똑똑 : "메뉴명을 입력해 주세요."</title>
    
    <style>
        /* style START */
    /* setting * don't touch */
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * {margin:0; padding:0; box-sizing:border-box;}
        html, body {font-family:'Pretendard-Regular'; font-size:15px; line-height:1.5;}
        a {color:inherit; text-decoration:none;}
        input {outline:0; border-radius:0; border-width:1px; padding:5px;}
        select {outline:0; border-radius:0; border-width:1px; padding:4px;}
        img {width:100%; max-width:100%; display:inline-block;}
        ol, ul ,li {list-style:none;}
        
        #header, #footer, #subVisual {width:100%; height:100px; background:#eee; display:flex; justify-content:center; align-items:center;}
        #subVisual {height:300px; border-top:1px dotted #777; margin-bottom:70px;}
        #footer {margin-top:150px;}
        #wrapper {max-width:1200px; min-height:calc(100vh - 500px); margin:0 auto;}



        #wrapper{
            
            width: 1200px;
            height: 2600px;
            border: 1px solid #ccc;
            /*background-image: url(./images/smart_market_view.jpg);*/
            background-position: center;
            opacity: 1;
            
        }

        .smart_img{
            margin-top: 65px;
            width: 500px;
            height: 524px;
            float: left;
        }
        #smart_img{
            width: 500px;
            height: 524px;
        }
        .smart_txt{
            float: left;
            margin-top: 42px;
            width: 695px;
            height: 524px;
        }

        .smart_empth1{
            height: 70px;
        }

        .smart_title{
            height: 150px;  
            margin-left: 73px;
            background-color: rgb(245, 240, 240);
        }
        .font_title{
            font-size: 35px;
            font-weight: bold;
        }
        .star{
            width: 20px;
        }
        .star_position{
            margin-top: 10px;
        }
        .font_grade{
            font-size: 18px;
        }
        .font_script{
            font-size: 18px;
            margin-top: 25px;            
        }
        .smart_empth2{
            height: 55px;
        }
        .smart_price{
            height: 35px;
            margin-left: 73px;
            background-color: #eee;
        }
        .font_price1{
            font-weight: bold;
            font-size: 20px;
        }
        .font_price2{
            font-weight: bold;
            font-size: 25px;
            color: rgb(117, 158, 57);
        }

        .font_price3{
            font-weight: bold;
            font-size: 20px;
            
        }
        .smart_empth3{
            height: 27px;
        }
        .smart_cnt{
            height: 40px;
            margin-left: 73px;
            margin-top: 5px;
            background-color: #eee;
        }
        .font_cnt{
            font-size: 20px;
            font-weight: bold;
        }
        .input_cnt{
            width: 90px;
            height: 35px;
            padding-left: 130px;
        }
        .font_cnt2{
            font-size: 20px;
            padding-left: 20px;
        }
        
        .smart_empth4{
            height: 70px;            
        }
        .smart_button{
            height: 70px;
            margin-left: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: aliceblue;
        }
        .btn_buy{
            
            margin-top: 10px;
            width: 280px;
            height: 60px;
            background-color: green;
            color: white;
            font-size: 23px;
            font-weight: bold;
            border-radius: 15px;
        }

        .btn_cart{
            margin-left: 20px;
            margin-top: 10px;
            width: 280px;
            height: 60px;
            background-color: gray;
            color: white;
            font-size: 23px;
            font-weight: bold;
            border-radius: 15px;
            
        }
        .share{
            width: 40px;
            height: 40px;
            margin-left: 20px;
            vertical-align:auto;
            
            
        }

        .product_review_title{
            margin-top: 80px;
            height: 62px;
            width: 100%;
            float: left;
            display: flex;
            justify-content: space-around;
            align-items: center;
            border: 1px solid red;
        }

        .product_review_title .btn_product_script{
            font-size: 20px;
            font-weight: bold;
            background-color: #ccc;
            width: 100px;
            
            
        }
        .product_review_title .btn_review_script{
            font-size: 20px;
            font-weight: bold;
            background-color: #ccc;
            width: 100px;
        }

        .product_script{
            border: 1px solid blue;
            margin-top: 28px;
            height: 900px;
            width: 100%;
            float: left;
        }
        
        .btn_all_view{
            margin-top: 10px;
            float: left;
            width: 100%;
            height: 70px;
        }
        #btn_all_view{
            width:100%;
            height: 70px;
            border-radius: 10px;
            font-size: 30px;
            color: white;
            background-color: #777;
        }
        .product_script_detail{
            float: left;
            display: none;
        }

        #btn_all_hidden{
            width:100%;
            height: 70px;
            border-radius: 10px;
            font-size: 30px;
            color: white;
            background-color: #777;
            display: none;
        }
        .smart_empth5{
            height: 50px;
            width: 100%;            
            float: left;
        }

        table, td, th {
          border:1px solid #ccc;
          border-collapse: collapse;
          background: #eee;
        }
        td, th {
          padding:10px 20px;
        }
        td{
          width:1200px;
        }
        tr{
            height: 130px;
        }

        .table1{
            padding-top: 20px;
            
        }

        /* style END */
    </style>    
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <div id="subVisual">&lt;subVisual&gt;</div>
    <!-- wrap START -->
    <div id="wrapper" >

        이곳에 내용을 입력해 주세요.
        <div id="app">

        <div class="smart_img"><img id="smart_img" src="images/food1.jpg"></div>
        <div class="smart_txt">
            <div class="smart_empth1"></div>
            <div class="smart_title">
                <span class="font_title">국내산감자(햇), 500g</span>
                <div class="star_position">
                    <img class="star" src="images/star.png">
                    <span class="font_grade"> 4.5</span>
                </div>
                <div class="font_script">믿을수 있는 국내산지에서 정성껏 기르고 재배한 국내산 감자</div>
            </div>
            <div class="smart_empth2"></div>
            <div class="smart_price">
                <span class="font_price1">판매가</span>
                <span class="font_price2">3,750원</span>
                <span class="font_price3">(100g당 750원)</span>
            </div>   
            <div class="smart_empth3"></div>
            <div class="smart_cnt">
                <span class="font_cnt">개수 </span><input class="input_cnt" type="number" min="0" max="10">
                <span class="font_cnt2"> 현재 3개남았어요!</span>
            </div>
            <div class="smart_empth4"></div>
            <div class="smart_button">
                <button class="btn_buy">구매하기</button>
                <button class="btn_cart">장바구니담기</button>
                <img class="share" src="images/share.png">
            </div>
        </div>
        
        <div class="product_review_title">
            <div class="btn_product_script"><a href="#product_discript">상품설명</a></div>
            <div class="btn_review_script">후기<a name="product_review"></a></div>
        </div>
        <div class="product_script">adfasd</div>
        <div class="btn_all_view"><button id="btn_all_view">펼쳐보기</button></div>
        <div class="product_script_detail" id="product_script_detail">
            <pre>
                그런데 말입니다. 상세 설명이 표시된 뒤에도 [상세 설명 보기] 링크가 [상세 설명 닫기]로 바뀌지 않았습니다. 
                [상세 내용 닫기] 링크를 사용하기 위해 소스를 수정해 보겠습니다.  
                #detail 요소가 현재 화면에 표시된 상태인지 아니면 감춰진 상태인지를 저장할 새로운 병수 isOpen을 선언 합니다. 
                그리고 변숫값은 '보기' 이거나 '닫기', 두 가지 값만 존재하므로 논리형으로 만들면 되겠습니다. 
                기본적으로 #detail 요소는 닫기 상태이므로 초깃값을 false로 지정하겠습니다.
            </pre>
        </div>
        <div class="btn_all_hidden"><button id="btn_all_hidden">접어보기</button></div>


        <div class="product_review_title" style="border: 1px solid red;">
            <div class="btn_product_script"><a name="product_discript">상품설명</a></div>
            <div class="btn_review_script"><a href="#product_review">후기</a></div>
        </div>
        <div class="smart_empth5"></div>
        <div class="table1">
            <table> 
                <tr v-for="(item, index) in list" >
                    <td>{{item.date}}</td>
                    <td>{{item.product}}</td>
                    <td>{{item.star}}</td>
                    <td>{{item.user}}</td>                    
                </tr>
            </table>
        </div>
    </div>

        
        
        

        
        
        
    </div>
    <!-- wrap END -->
    <footer id="footer">&lt;footer&gt;</footer>
</body>
</html>
<style>
    /* setting * don't touch */
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * {margin:0; padding:0; box-sizing:border-box;}
    html, body {font-family:'Pretendard-Regular'; font-size:15px; line-height:1.5;}
    #header, #footer, #subVisual {width:100%; height:100px; background:#eee; display:flex; justify-content:center; align-items:center;}
    #subVisual {height:300px; border-top:1px dotted #777; margin-bottom:70px;}
    #footer {margin-top:150px;}
    #wrapper_smart {max-width:1200px; min-height:calc(100vh - 500px); margin:0 auto;}
</style>

<script>
    var app = new Vue({ 
    el: '#app',
    data: {
        list : [
            {date:"2023-05-04", product: "국내산 감자", star : "4.5", user : "구로구완도콩"},
            {date:"2023-05-03", product: "국내산 애호박", star : "4.0", user : "강남구완도콩"},
            {date:"2023-05-02", product: "국내산 가지", star : "3.5", user : "노원구완도콩"},
            {date:"2023-05-01", product: "국내산 호두", star : "3.5", user : "영등포구완도콩"},
            {date:"2023-05-06", product: "국내산 무", star : "5.0", user : "서초구완도콩"},
        ]
        
    }, 
});

    let isOpen = false;
    
    let view  = document.querySelector("#btn_all_view");    
    view.addEventListener("click", function(){
        if(isOpen ==false){
            document.querySelector("#product_script_detail").style.display="block";
            document.querySelector("#btn_all_hidden").style.display = "block";
            document.querySelector("#btn_all_view").style.display="none";
            isOpen = true;
        }
    });

    let hidden  = document.querySelector("#btn_all_hidden");
    hidden.addEventListener("click", function(){
        if(isOpen ==true){
            document.querySelector("#product_script_detail").style.display = "none";
            document.querySelector("#btn_all_hidden").style.display = "none";
            document.querySelector("#btn_all_view").style.display="block";
            isOpen = false; 
        }
    });





</script>
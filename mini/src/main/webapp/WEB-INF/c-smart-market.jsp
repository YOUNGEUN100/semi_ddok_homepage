<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>똑똑 : "똑똑한 레시피"</title>
    <style>
        /* style START */
        body {
            background: url("/images/sub_dept3-1_smart_Eating_view") no-repeat;
        }

        .recipe-img {
            border-radius: 5px;
            width : 58%;
            height: 500px;
            margin-right: 30px;
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
            margin: 50px 0px;
            width: 100%;
        }

        @media screen and (max-width: 512px) {
            .recipe-info-box {
            display: block;
            margin: 50px 0px;
            width: 100%;
            }
            .recipe-img {
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
            height: 1500px;
            border: 1px solid #ccc;
            background-image: url(./images/smart_market.jpg);
            
            background-position: center;
            opacity: 1;
            
        }


        .smart_market{
            display: flex;
        }

        .circle{
            
            margin: 5px;
            background-color: #beb6b6;
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }
        .box{
            
            margin: 5px;
            border: 1px solid red;
            background-color: #beb6b6;
            width: 210px;
            height: 220px;
        }
        
        /*정렬*/
        #box1{
            margin-top: 50px;
            align-items: flex-start;
            justify-content: space-evenly;
        }

        #box2{
            align-items: flex-start;
            justify-content: space-evenly;
            gap: 10px;

        }

        #box3{
            margin-top: 10px;
            align-items: flex-start;
            justify-content: space-evenly;
            gap: 10px;

        }

        #box4{
            display: flex;
            margin-top: 10px;
            align-items: flex-start;
            justify-content: space-evenly;            
            gap: 10px;
        }
        .box4{
            margin: 2px;
            border: 1px solid blue;
            background-color: #beb6b6;
            width: 210px;
            height: 100px;
        }

        .gap1{
            border: 1px;
            width: 100px;
            height: 30px;
            background-color: orange;
            text-align: center;
        }
        .recommend{
            margin-top: 80px;
            font-size: 23px;
            font-weight: bold;
            background-color: #777;
        }
        .product_list{
            display: flex;
            position: relative;/*상위 기준으로 상대적 위치를 갖는다.*/

        }
        .product_vege{
            margin-top: 50px;
            font-size: 23px;
            font-weight: bold;
            background-color: #777;
            width: 80%;
            
        }
        .product_vege_cnt{
            border: 2px solid green;
            width: 10%;
            
            padding-right: 5px;
            background-color: #ccc;
            position: absolute; /*브라우저를 기준으로 고정*/
            right: 2px;
            bottom: 1px;
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
        <div class="smart_market" id="box1">
            <div ><img src="images/food1.jpg" class="circle"></div>
            <div ><img src="images/food2.jpg" class="circle"></div>
            <div ><img src="images/food3.jpg" class="circle"></div>
            <div ><img src="images/food4.jpg" class="circle"></div>
            <div ><img src="images/food5.jpg" class="circle"></div>
            <div ><img src="images/food6.jpg" class="circle"></div>
            <div ><img src="images/food7.jpg" class="circle"></div>
            <div ><img src="images/food8.jpg" class="circle"></div>
            <div ><img src="images/food9.jpg" class="circle"></div>
        </div>
        <div class="smart_market" id="box2">
            <div class="gap1"><p>채소</p></div>
            <div class="gap1"><p>과일</p></div>
            <div class="gap1"><p>정육</p></div>
            <div class="gap1"><p>수산물</p></div>
            <div class="gap1"><p>유제품</p></div>
            <div class="gap1"><p>생수음료</p></div>
            <div class="gap1"><p>소스</p></div>
            <div class="gap1"><p>가공식품</p></div>
            <div class="gap1"><p>간편식품</p></div>
        </div>
        <div class="recommend"><P>추천상품</P></div>
        <div class="smart_market" id="box3">
            <div ><img src="images/food1.jpg" class="box"></div>
            <div ><img src="images/food2.jpg" class="box"></div>
            <div ><img src="images/food3.jpg" class="box"></div>
            <div ><img src="images/food4.jpg" class="box"></div>
            <div ><img src="images/food5.jpg" class="box"></div>            
        </div>
        <div  id="box4">
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4"> 
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
        </div>

        <div class="product_list">
            <div class="product_vege">
                <P>상품목록 : 채소</P>
            </div>
            <div class="product_vege_cnt"><P id="pro_cnt">총 10개 상품</P></div>
        </div>
        <div class="smart_market" id="box3">
            <div ><img src="images/food1.jpg" class="box"></div>
            <div ><img src="images/food2.jpg" class="box"></div>
            <div ><img src="images/food3.jpg" class="box"></div>
            <div ><img src="images/food4.jpg" class="box"></div>
            <div ><img src="images/food5.jpg" class="box"></div>            
        </div>
        <div  id="box4">
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
        </div>
        
        <div class="smart_market" id="box3">
            <div ><img src="images/food1.jpg" class="box"></div>
            <div ><img src="images/food2.jpg" class="box"></div>
            <div ><img src="images/food3.jpg" class="box"></div>
            <div ><img src="images/food4.jpg" class="box"></div>
            <div ><img src="images/food5.jpg" class="box"></div>            
        </div>
        <div  id="box4">
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>현재1개남았어요!</p>
                <p>서울우유1급우유, 2300ml</p>
                <p>6,230원 (100ml 230원)</p>
                <p>별 4.5</p>
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
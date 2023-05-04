<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�ȶ� : "�޴����� �Է��� �ּ���."</title>
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
        
        /*����*/
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
            position: relative;/*���� �������� ����� ��ġ�� ���´�.*/

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
            position: absolute; /*�������� �������� ����*/
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

        �̰��� ������ �Է��� �ּ���.
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
            <div class="gap1"><p>ä��</p></div>
            <div class="gap1"><p>����</p></div>
            <div class="gap1"><p>����</p></div>
            <div class="gap1"><p>���깰</p></div>
            <div class="gap1"><p>����ǰ</p></div>
            <div class="gap1"><p>��������</p></div>
            <div class="gap1"><p>�ҽ�</p></div>
            <div class="gap1"><p>������ǰ</p></div>
            <div class="gap1"><p>�����ǰ</p></div>
        </div>
        <div class="recommend"><P>��õ��ǰ</P></div>
        <div class="smart_market" id="box3">
            <div ><img src="images/food1.jpg" class="box"></div>
            <div ><img src="images/food2.jpg" class="box"></div>
            <div ><img src="images/food3.jpg" class="box"></div>
            <div ><img src="images/food4.jpg" class="box"></div>
            <div ><img src="images/food5.jpg" class="box"></div>            
        </div>
        <div  id="box4">
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4"> 
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
        </div>

        <div class="product_list">
            <div class="product_vege">
                <P>��ǰ��� : ä��</P>
            </div>
            <div class="product_vege_cnt"><P id="pro_cnt">�� 10�� ��ǰ</P></div>
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
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
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
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
            </div>
            <div class="gap2 box4">
                <p>����1�����Ҿ��!</p>
                <p>�������1�޿���, 2300ml</p>
                <p>6,230�� (100ml 230��)</p>
                <p>�� 4.5</p>
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
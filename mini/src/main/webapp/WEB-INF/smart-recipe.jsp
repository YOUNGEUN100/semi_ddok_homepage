<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/3182501c90.js" crossorigin="anonymous"></script>
    <title>�ȶ��� ������</title>
    <style>
        /* style START */
     	 body {
            /* background: url("/images/work_img.jpg") no-repeat; */
        }
        #wrapper {
            text-align: center;
        }
        .category-img {
            width:100px;
            height: 100px;
            border-radius: 50%;
            background: rgba(232, 227, 227, 0.959);
            /* margin-bottom: 20px; */
        }
        .r-category {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
        }
        .box1 {
            text-align: center;
            margin: 0 25px;
        }
        .r-search {
            margin-top: 150px;
            margin-bottom: 70px;
        }
        .r-input {
            width: 500px;
            border : none;
            border-bottom: 1px solid black;
            padding-left: 30px;
            font-size: 18px;
            text-align: left;
            
        }
        .c-icon {
            position:relative;
            bottom: 60px;
            
        }
        .search-icon {
            position: relative;
            right:30px;
        }
        .detail-category {
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 10px;
            padding: 20px 30px;
            margin-bottom: 70px;
            /* background-color: aquamarine; */
        }
        .box2 {
            display: flex;
            padding: 20px;
        }
        .box2 div {
            margin-right: 50px;
            font-size: 20px;
        }
        .box2 a {
            margin-right: 20px;
            font-size: 20px;
        }
        .recipe-img {
            width:380px;
            height: 280px;
            background: rgba(200, 196, 196, 0.9);
            margin-bottom: 10px;
        }
        .search-result-s {
            display: flex;
            justify-content:space-between;
            margin-bottom: 5px;
        }
        .search-result-s > div:first-child {
            font-size: 20px;
        }
        .search-result-s > div:last-child {
            font-size: 15px;
            position: relative;
            right:40px;
        }
        
        .search-result-d {
            display: flex;
        }
        .search-result-d div {
            margin-right: 15px;
        }
        .r-text {
            font-size: 20px;
            font-weight: bold;
        }
        .item {
            text-align: left;
        }
        /* style END */
    </style>
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <!-- wrap START -->
    <div id="wrapper">
<div class="r-search">
            <input type="text" placeholder="���ϴ� ��ᳪ �����Ǹ� �پ��ϰ� �˻��� ������!" class="r-input">
            <i class="search-icon fa-solid fa-magnifying-glass fa-lg"></i>
        </div>
        <div class="r-category">
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-utensils fa-2xl"></i>
                <div>��ü</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-bowl-food fa-2xl"></i>
                <div>������</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-fish-fins fa-2xl"></i>
                <div>�����</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-egg fa-2xl"></i>
                <div>��Ằ</div>
            </div>
            <div class="box1">
                <div class="category-img"></div>
                <i class="c-icon fa-solid fa-kitchen-set fa-2xl"></i>
                <div>������</div>
            </div>
        </div>
        <div class="detail-category">
            <div class="box2">
                <div><b>������</b></div>
                <a href="#">1�κ�</a>
                <a href="#">���������</a>
                <a href="#">����</a>
                <a href="#">����/�߽�</a>
                <a href="#">���̾�Ʈ</a>
            </div>
            <hr>
            <div class="box2">
                <div><b>�����</b></div>
                <a href="#">����/��ħ</a>
                <a href="#">�����</a>
                <a href="#">����/����</a>
                <a href="#">��ħ/���</a>
                <a href="#">��Ÿ</a>
            </div>
            <hr>
            <div class="box2">
                <div><b>������</b></div>
                <a href="#">����/�Ķ�����</a>
                <a href="#">���ڷ�����</a>
                <a href="#">���������̾�/����</a>
                <a href="#">��Ÿ</a>
            </div>
        </div>
        <div>
            <div class="search-result-s">
                <div><b>�˻���� : "���"</b></div>
                <div>�� 3���� ������</div>
            </div>
            <div class="search-result-d">
                <div class="item">
                    <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-25_427865954[12].jpg">
                    <div>#����丮 #�� #����׽�</div>
                    <div class="r-text">�ܸ��䵤��</div>
                </div>
                <div class="item">
                    <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-25_427863666.jpg">
                    <div>#�߽��� #�Ƕ�� #�߰�����</div>
                    <div class="r-text">ġŲ ī�� Ÿ��</div>
                </div>
                <div class="item">
                    <img class="recipe-img" src="https://ottogi.okitchen.co.kr/pds/upfile/2020-08-24_427854552[10].jpg">
                    <div>#�������� #�Ｎ�� #ķ��</div>
                    <div class="r-text">�������� �����</div>
                </div>
            </div>
        </div>
    .

    </div>
    <!-- wrap END -->
    <footer id="footer">&lt;footer&gt;</footer>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    	, user : {}
    }   
    , methods: {
    	fnRecipeList : function() {
    		var self = this;
    		var nparmap = "";
    		$.ajax ({
    			url:"/recipe/list.dox",
    			dataType : "json",
    			type : "POST",
    			data : nparmap,
    			success : function(data) {
    				
    			}
    		})
    	}
    
    	
   	 }
       
    , created: function () {
    	
	}
});
</script>
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
    a {color:inherit; text-decoration:none;}
    input {outline:0; border-radius:0; border-width:1px; padding:5px;}
    select {outline:0; border-radius:0; border-width:1px; padding:4px;}
    img {width:100%; max-width:100%; display:inline-block;}
    ol, ul ,li {list-style:none;}
    
    #header, #footer {width:100%; height:100px; background:#eee; display:flex; justify-content:center; align-items:center;}
    #header {margin-bottom:70px;}
    #footer {margin-top:150px;}
    #wrapper {max-width:1200px; min-height:calc(100vh - 420px); margin:0 auto;}
</style>
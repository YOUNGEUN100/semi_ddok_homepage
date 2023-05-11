<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<style>
<!-- 페이징 추가 2-->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    ul {
        text-align: center;
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
	.style_inline{
		display: inline;
	}
	.mypage{
		
	}
	
	
	
	
	 #wrapper{
            
            width: 1200px;
            height: 2600px;
            border: 1px solid #ccc;
            /*background-image: url(./images/smart_market_view.jpg);*/
            background-position: center;
            opacity: 1;
            clear:both;
            
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
            padding-left: 130px;
            font-size: 30px;                        
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
            
         
        }

        .product_review_title .btn_product_script_top{
            font-size: 20px;
            font-weight: bold;
            width: 50%;
            height: 100%;
            text-align: center;
            line-height : 55px;
            border-top: 1px solid #ccc;
            
        }
        .product_review_title .btn_review_script_top{
            font-size: 20px;
            font-weight: bold;
            background-color: #ccc;
            width : 50%;
            height: 100%;
            text-align: center;
            line-height : 55px;
            background-color: #ccc;
        }

        .product_review_title .btn_product_script_bottom{
            font-size: 20px;
            font-weight: bold;
            background-color: #ccc;
            width : 50%;
            height: 100%;
            text-align: center;
            line-height : 55px;
            background-color: #ccc;
        }        
        
        .product_review_title .btn_review_script_bottom{
            font-size: 20px;
            font-weight: bold;
            width: 50%;
            height: 100%;
            text-align: center;
            line-height : 55px;
            border-top: 1px solid #ccc;
        }

        .product_script{
            
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
            height: 5px;
            width: 100%;            
            float: left;
        }
        .smart_empth6{
            height: 50px;
            width: 100%;            
            float: left;
        }

        table, td, th {
          
          border-collapse: collapse;
          background: #eee;
          border : 1px solid #ccc;
          
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
        	float: left;
            padding-top: 20px;            
                        
        }
        
        .img_rec{        	
	        position: absolute;
	        clip: rect( 0px, 780px, 900px, 0px );
        }

        /* style END */ 
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
        <!-- wrap START -->
    <div id="wrapper" >
        <div id="app">
        <div class="smart_img"><img id="smart_img" src="/images/food1.jpg"></div>
        <div class="smart_txt">
            <div class="smart_empth1"></div>
            <div class="smart_title">
                <span class="font_title">{{info.productName}}</span>
                <div class="star_position">
                    <img class="star" src="/images/star.png">
                    <span class="font_grade">{{(info.satisfactionGrade + info.repurchaseGrade + info.deliveryGrade)/3 |  numberFormat(1)}}</span>
                </div>
                <div class="font_script">{{info.title}}</div>
            </div>
            <div class="smart_empth2"></div>
            <div class="smart_price">
                <span class="font_price1">판매가</span>
                <span class="font_price2">{{info.productPrice | numberFormat()}}원 </span>
                <span class="font_price3">(100{{info.productVolume}}당 {{info.productPrice*100 / info.productWeight*info.productEa | numberFormat()}}원)</span>
            </div>   
            <div class="smart_empth3"></div>
            <div class="smart_cnt">
                <span class="font_cnt">개수 </span><input class="input_cnt" type="number" min="1" max="3">
                <span class="font_cnt2"> 현재 {{info.productStock}}개남았어요!</span>
            </div>
            <div class="smart_empth4"></div>
            <div class="smart_button">
                <button class="btn_buy">구매하기</button>
                <button class="btn_cart">장바구니담기</button>
                <a href="javascript:clip2();"><img class="share" src="/images/share.png" ></a>
            </div>
        </div>
        
        <div class="product_review_title">
            <div class="btn_product_script_top"><a id="product_discript_move" href="#product_discript">상품설명</a></div>
            <div class="btn_review_script_top">후기<a name="product_review"></a></div>
        </div>
        <!--  div class="product_script"><img src="/images/1_VER.jpg" class="img_rec" style="width:780px;"></div-->
        <div class="product_script" v-for="(item, index) in imglist">
        	<img  :src="item.imgPath" class="img_rec" style="width:780px;">
        	{{item.imgPath}}
        </div>
        
        <div class="btn_all_view"><button id="btn_all_view">펼쳐보기</button></div>
        <div class="product_script_detail" id="product_script_detail">            
        </div>
        <div class="btn_all_hidden"><button id="btn_all_hidden">접어보기</button></div>


        <div class="product_review_title" >
            <div class="btn_product_script_bottom"><a name="product_discript">상품설명</a></div>
            <div class="btn_review_script_bottom"><a href="#product_review">후기</a></div>
        </div>
        
        <div class="table1" >
            <table class="table2"> 
                <tr v-for="(item, index) in list" >
                    <td>{{item.rId}} </td>
                    <td>{{item.productName}}</td>
                    <td>
	                    <img class="star" src="/images/star.png">
	                    <span class="font_grade">{{(item.satisfactionGrade + item.repurchaseGrade + item.deliveryGrade)/3 |  numberFormat(1)}}</span>
	                    <br>상품만족도 <img class="star" src="/images/star.png"> {{item.satisfactionGrade}} 
	                    <br>상품만족도 <img class="star" src="/images/star.png"> {{item.repurchaseGrade}}
	                    <br>상품만족도 <img class="star" src="/images/star.png"> {{item.deliveryGrade}}
                    </td>
                    <td>{{item.nick}}</td>                    
                </tr>                
            </table>
            
            <!-- 페이징 추가 3-->
				<template>
				  <paginate
				    :page-count="pageCount"
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch"
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
				</template>
				
				
        </div>
        
    </div>

    </div>
    <!-- wrap END -->
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
<!-- 페이징 추가 4-->
Vue.component('paginate', VuejsPaginate)


    var app = new Vue({ 
        el: '#app',
        data: {
        list : [] 
        , info : {}
        , imglist : {}
        , reviewlist : {}
        , productNo : "${map.productNo}"
        , productName : ""
        
        	<!-- 페이징 추가 5-->
		, selectPage: 1
		, pageCount: 1
		, cnt : 0
            
        }
    
    	,filters: {
            numberFormat: (value, numFix) => {
                value = parseFloat(value);
                if (!value) return '0';
                return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
            },
        }   
        , methods: {
            
            fnGetList : function(){
                var self = this;
                var nparmap = {productNo : self.productNo};
                
                
                //상품정보
                $.ajax({
                    url:"/smartmarket-view.dox",
                    dataType:"json",
                    type : "POST",
                    data : nparmap,
                    success : function(data) {
                        //console.log(data.imgList.list);
                        //console.log(data.reviewList.list);
                        self.info = data.info;
                        self.imglist = data.imgList.list;
                        //self.reviewlist = data.reviewList.list;
                        
                    }
                });
                
                
                <!-- 페이징 추가 6-->
    			var startNum = ((self.selectPage-1) * 5);
        		var lastNum = (self.selectPage * 5)
        		var nparmap = {keyword : self.keyword
        						, kind : self.selectItem
        						, startNum : startNum
        						, lastNum : lastNum
        						, productNo : self.productNo};
        		
        		console.log(nparmap);
                
        		$.ajax({
                    url:"/reviewlist.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	console.log(data);
    	                self.list = data.list;
    	                self.cnt = data.cnt;
    	                self.pageCount = Math.ceil(self.cnt / 5);
                    }
                });

            }
        
        
        
	      
        
	        <!-- 페이징 추가 7-->
			, fnSearch : function(pageNum){
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 5);
				var lastNum = (pageNum * 5) + 1;
				var nparmap = {startNum : startNum, lastNum : lastNum, productNo : self.productNo};
				
				console.log(nparmap);
				
				$.ajax({
					url : "/reviewlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						
						self.list = data.list;
						self.cnt = data.cnt;
						self.pageCount = Math.ceil(self.cnt / 5);
					}
				});
			}
        
            
        }   
        , created: function () {
            var self = this;
            self.fnGetList();
            
        }
    });



    const clip2 = async () => {
        navigator.clipboard.writeText(window.location.href);
        alert("URL 주소가 복사되었습니다.");
    }



    let isOpen = false;
    
    let view  = document.querySelector("#btn_all_view");    
    view.addEventListener("click", function(){
        if(isOpen ==false){
            //document.querySelector("#product_script_detail").style.display="block";
            document.querySelector(".img_rec").style.clip="auto";
            document.querySelector(".product_script").style.height="3570px";            
            
            document.querySelector("#btn_all_hidden").style.display = "block";
            document.querySelector("#btn_all_view").style.display="none";
            isOpen = true;
        }
    });

    let hidden  = document.querySelector("#btn_all_hidden");
    hidden.addEventListener("click", function(){
        if(isOpen ==true){
            //document.querySelector("#product_script_detail").style.display = "none";
            document.querySelector(".img_rec").style.clip="rect( 0px, 780px, 900px, 0px )";            
            document.querySelector(".product_script").style.height="900px";
            
            document.querySelector("#btn_all_hidden").style.display = "none";
            document.querySelector("#btn_all_view").style.display="block";
            
            
            document.querySelector("#product_discript_move").href="#product_discript"
            
            isOpen = false; 
        }
    });


   
</script>

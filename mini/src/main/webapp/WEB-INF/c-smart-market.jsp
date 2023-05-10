<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="js/jquery.js"></script>
    <script src="js/vue.js"></script>
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
            background-color: #ccc;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            box-shadow: 1px 1px 10px 2px gray;            
            /*그림자주기 1위치(좌우) 2.위치(상하) 3흐리기 4크기 5색깔*/
        }
        .box{
            
            margin: 5px;
            
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
            
            background-color: #f1eee8;
            width: 210px;
            height: 100px;
        }

        .gap1{
            border: 1px;
            width: 100px;
            height: 30px;
            text-align: center;
            font-size: 18px;
            
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
            width: 10%;
            
            padding-right: 5px;
            background-color: #ccc;
            position: absolute; /*브라우저를 기준으로 고정*/
            right: 2px;
            bottom: 1px;
        }
        
        
		.smart_market1{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));/*auto-fit, auto-fill*/
            /*grid-gap: 10px; /*그리드의 간격을 준다*/
            grid-gap: 1rem; /*그리드의 간격을 준다 / 1rem : 16px*/
        }
        .star{
            width: 20px;
        }
        
        /* style END */
    </style>    
</head>
<body>
    <header id="header">&lt;header&gt;</header>
    <div id="subVisual">&lt;subVisual&gt;</div>
    <!-- wrap START -->
    <div id="wrapper" >

		<div id="app">
	
	
	
	        <div class="smart_market" id="box1">
	            <div ><a href="javascript:;" id="veg"><img src="images/food1.jpg" class="circle" @click="fnGetList2('VEG')"></a></div>
	            <div ><a href="javascript:;" id="fur"><img src="images/food2.jpg" class="circle" ></a></div>
	            <div ><a href="javascript:;" id="mea"><img src="images/food3.jpg" class="circle" ></a></div>
	            <div ><a href="javascript:;" id="sea"><img src="images/food4.jpg" class="circle" ></a></div>
	            <div ><a href="javascript:;" id="dai"><img src="images/food5.jpg" class="circle" ></a></div>
	            <div ><a href="javascript:;" id="wat"><img src="images/food6.jpg" class="circle" ></a></div>
	            <div ><a href="javascript:;" id="sau"><img src="images/food7.jpg" class="circle" ></a></div>
	            <div ><a href="javascript:;" id="pro"><img src="images/food8.jpg" class="circle" ></a></div>
	            <div ><a href="javascript:;" id="sim"><img src="images/food9.jpg" class="circle" ></a></div>
	        </div>
	        <div class="smart_market" id="box2">
	            <div class="gap1"><p><a href="javascript:;" id="veg1">채소</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="fur1">과일</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="mea1">정육</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="sea1">수산물</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="dai1">유제품</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="wat1">생수/음료</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="sau1">소스</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="pro1">가공식품</a></p></div>
	            <div class="gap1"><p><a href="javascript:;" id="sim1">간편식품</a></p></div>
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
	            <div class="product_vege" >
	                <P>상품목록 : <span id="title_list">과일</span></P>
	                <input v-model="product_kind" name="product_kind" id="product_kind">
	            </div>
	            <div class="product_vege_cnt"><P id="pro_cnt">총 {{cnt}}개 상품</P></div>
	        </div>
	        
	        
	        <div class="smart_market1" id="box3" >
	            <div v-for="(item, index) in list">
	            	<img :src="item.imgPath" class="box">
		            <div class="gap2 box4">
		                <p>현재 {{item.productStock}}개 남았어요!</p>
		                <p>{{item.productName}}</p>
		                <p>{{item.productPrice | numberFormat()}}원 (100{{item.productVolume}}당 {{item.productPrice*100 / item.productWeight*item.productEa | numberFormat()}}원)</p>
		                <p><img class="star" src="images/star.png"> {{(item.satisfactionGrade + item.repurchaseGrade + item.deliveryGrade)/3 |  numberFormat(1)}} </p>
		            </div>
	            </div>
	                      
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
$(function(){
 
    $("#veg").click({param1: "veg"}, cool_function)
    $("#fur").click({param1: "fur"}, cool_function)
    $("#mea").click({param1: "mea"}, cool_function)
    $("#sea").click({param1: "sea"}, cool_function)
    $("#dai").click({param1: "dai"}, cool_function)
    $("#wat").click({param1: "wat"}, cool_function)
    $("#sau").click({param1: "sau"}, cool_function)
    $("#pro").click({param1: "pro"}, cool_function)
    $("#sim").click({param1: "sim"}, cool_function)
    
    $("#veg1").click({param1: "veg"}, cool_function)
    $("#fur1").click({param1: "fur"}, cool_function)
    $("#mea1").click({param1: "mea"}, cool_function)
    $("#sea1").click({param1: "sea"}, cool_function)
    $("#dai1").click({param1: "dai"}, cool_function)
    $("#wat1").click({param1: "wat"}, cool_function)
    $("#sau1").click({param1: "sau"}, cool_function)
    $("#pro1").click({param1: "pro"}, cool_function)
    $("#sim1").click({param1: "sim"}, cool_function)

	 
	 function cool_function(event){
		if(event.data.param1=='veg'){
			let str = document.getElementById("title_list")
	    	str.innerHTML = "채소"
	    	$('#product_kind').val('VEG')
	 	}
	    else if(event.data.param1=='fur'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "과일"
	    	$('#product_kind').val('FUR')
	 	}	    
	    else if(event.data.param1=='mea'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "정육"
	    	$('#product_kind').val('MEA')
	 	}
	    else if(event.data.param1=='sea'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "수산물"
	    	$('#product_kind').val('SEA')	    	
	 	}
	    else if(event.data.param1=='dai'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "유제품"
	    	$('#product_kind').val('DAI')
	 	}
	    else if(event.data.param1=='wat'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "생수/음료"
	    	$('#product_kind').val('WAT')
	 	}
	    else if(event.data.param1=='sau'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "소스"
	    	$('#product_kind').val('SAU')
	 	}
	    else if(event.data.param1=='pro'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "가공식품"
	    	$('#product_kind').val('PRO')
	 	}
	    else if(event.data.param1=='sim'){
	    	let str = document.getElementById("title_list")
	    	str.innerHTML = "간편식품"
	    	$('#product_kind').val('SIM')
	 	}
	 }

});



var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		product_kind : "${map.product_kind}",
		cnt : ""
    },
	filters: {
	    numberFormat: (value, numFix) => {
	        value = parseFloat(value);
	        if (!value) return '0';
	        return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
	    },
	}
    , methods: {
    	fnGetList : function(){
    		var self = this;
    		var nparmap = {product_kind : self.product_kind};    		

    		
    		
    		$.ajax({
                url:"/smartmarket-list.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	
                	console.log(data.list);
                	self.cnt = data.list.length;
                	self.list = data.list;
                	
                }
            });        		
    		
    	}
    
	    , fnGetList2 : function(item){
			var self = this;
			console.log(item);			
			self.pageChange("smart-market.do", {product_kind : item});
		}
    
	    , pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
			//	this.linkCall(url);
				return;
			}
			
			console.log(param);
			
			var form = document.createElement("form"); 
			form.name = "dataform";
			form.action = url;
			form.method = "post";
			form.target = target;
			for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
			document.body.appendChild(form);
			form.submit();
			document.body.removeChild(form);
			
		}
	    
	  	
    	
    	
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});


</script>
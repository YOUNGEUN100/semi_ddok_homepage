<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>

<!-- pageContent -- START -->

<!-- mainVisual -->
<section id="mainVisual" class="mainVisualSlider">
    <div class="slide page1 styleBlack" style="background:url('/images/mainVisual_img01.jpg') center center / cover no-repeat;">
        <div class="wrapper" style="align-items:flex-start;">
            <h2 class="slideTitle">똑똑한 마켓</h2>
            <p class="slideText">가장 소량씩, 가장 신선하게 <br>적은 양으로 부담없이 즐겨요</p>
            <a href="./market.do" class="sideLink">자세히 보기</a>
        </div>
    </div>
    <div class="slide page2 styleWhite" style="background:url('/images/mainVisual_img02.jpg') center center / cover no-repeat;">
        <div class="wrapper">
            <h2 class="slideTitle">투데잇 : Today-Eat</h2>
            <p class="slideText">오늘도 무엇을 <br>어떻게 먹을지 고민중이신가요?</p>
            <a href="./todayEat.do" class="sideLink">바로가기</a>
        </div>
    </div>
</section>

<!-- mainContent -->
<div id="app">
<section id="mainContent" class="nth1">
    <div class="wrapper">
        <h2 class="mctTitle">현재 진행중인 랜선펀딩</h2>
        <div class="mctArea type2">
            <a @click="fnViewFunding(item.fundingNo)" href="javaScript:;" class="mctThumb typeRow" v-for="(item, index) in fundingList">
				<div class="imgBox">
				    <img :src="item.imgPath" alt="펀딩이미지">
				</div>
				<div class="txtBox">
				    <h4 class="title">{{item.fundingName}}</h4>
				    <p class="text">{{item.fundingSummary}}</p>
				</div>
				<div class="txtBox graph">
				    <div class="count">
				        <div class="apply">{{item.fundingGoalCnt}}명 중 <span class="now">{{item.cnt}}명</span></div>
				        <div class="date" v-if="item.dDay > 0">{{item.dDay}}일 남음</div>
				        <div class="date" v-else style = "color:red;">금일 {{item.endTime}}시 종료</div>
				        <div class="graph"><progress :value="item.cnt" :max="item.fundingGoalCnt" class="fund_progress"></progress></div>
				    </div>
				    <div class="price">공구가 <span class="amount">{{item.fundingPrice2}}원</span></div>
				</div>
          	</a>          	            
        </div>
    </div>
</section>
<section id="mainContent" class="nth2">
    <div class="wrapper">
        <h2 class="mctTitle">똑똑한 마켓</h2>
        <ul class="mctTab">
            <li><a href="javaScript:;" class="active">신선식품</a></li>
            <li><a href="javaScript:;">냉장</a></li>
            <li><a href="javaScript:;">냉동</a></li>
            <li><a href="javaScript:;">가공식품</a></li>
        </ul>
        <div class="mctArea type5">
            <div class="mctThumb typeCol" v-for="(item2, index) in recommendList">
                <a href="javaScript:;" class="imgBox" @click="fnView(item2.productNo)">
                    <img :src="item2.imgPath" alt="">
              </a>
              <a href="javaScript:;" class="cartBtn"><i class="fa-solid fa-cart-plus" @click="fnView(item2.productNo)"></i></a>
              <a href="javaScript:;" class="txtBox" @click="fnView(item2.productNo)">
                  <p class="text">현재 {{item2.productStock}}개 남았어요!</p>
                  <h4 class="title">{{item2.productName}}</h4>
                  <div class="price"><span class="amount">{{item2.productPrice | numberFormat()}}원</span> (100{{item2.productVolume}}당 {{item2.productPrice*100 / item2.productWeight*item2.productEa | numberFormat()}}원)</div>
              </a>
          </div>
          
        </div>
    </div>
</section>
<section id="mainContent" class="nth3">
    <div class="wrapper">
        <h2 class="mctTitle">똑똑한 레시피</h2>
        <ul class="mctTab" style="display:none;">
            <li><a href="javaScript:;" class="active">한식</a></li>
            <li><a href="javaScript:;">양식</a></li>
            <li><a href="javaScript:;">분식</a></li>
            <li><a href="javaScript:;">디저트</a></li>
        </ul>
        <div class="mctArea type3">
		    <div class="mctThumb typeCol" v-for="(item, index) in recipeList" >		    	
		        <a href="javaScript:;" class="imgBox" @click="fnViewRecipe(item.recipeNo)">
		        	<img :src="item.imgPath" alt="레시피 이미지">
		        </a>
				<a href="javaScript:;" class="txtBox">
				    <p class="text">{{item.hashtag}}</p>
				    <h4 class="title">{{item.recipeName}}</h4>
				</a>
			</div>
		</div>
    </div>
</section>
<section id="mainContent" class="nth4">
    <div class="wrapper">
        <div class="mctInfo">
            <h2 class="mctTitle">생활백서</h2>
            <div class="mctText">
                <p>혼자여도 OK, <br>함께니까 OK –</p>
                <p>1인가구가 사회구성원으로서 <br>공존하며 살아가는 <br>생활 꿀팁 모아보기</p>
            </div>
        </div>
        <div class="mctArea mainContentSlider">
            <div class="mctThumb typeCol">
                  <img src="/images/news1.jpg" alt="카드1">
                <a href="javaScript:;" class="txtBox">
                	<p class="text">5월부터 시작</p>
                    <h4 class="title">이직 중도퇴사자 연말정산 방법</h4>
                </a>
            </div>
            <div class="mctThumb typeCol">
                <img src="/images/news2.jpg" alt="카드2">
                <a href="javaScript:;" class="txtBox">
                	<p class="text">각종 색바랜 옷</p>
                    <h4 class="title">완벽하게 되살리는 방법</h4>
                </a>
            </div>
            <div class="mctThumb typeCol">
                 <img src="/images/news3.jpg" alt="카드3">
                <a href="javaScript:;" class="txtBox">
                	<p class="text">전세 월세집 재계약할 때</p>
                    <h4 class="title">필수 체크리스트</h4>
                </a>
            </div>
            <div class="mctThumb typeCol">
                 <img src="/images/news4.jpg" alt="카드4">
                <a href="javaScript:;" class="txtBox">
                	<p class="text">2023년 연차 쓰기 좋은</p>
                    <h4 class="title">남은 연휴 총정리</h4>
                </a>
            </div>
        </div>
    </div>
</section>
<section id="mainContent" class="nth5">
    <div class="wrapper">
    	<div class="mctArea typeLeft">
	        	<h2 class="mctTitle">알쓸정책</h2>
	        	<button class="moreBtn" @click="fnMorePolicy()">더보기 <i class="fa-solid fa-circle-chevron-down fa-rotate-270"></i></button>
        	<ul class="mctList" v-for="(item, index) in polList">
        		<li><span class="cateBox"><span>#</span>{{item.category}}</span><h4 class="title"><a @click="fnViewPol(item.boardNo)" href="javaScript:;" target="_self">{{item.title}}</a></h4></li>
        	</ul>
    	</div>
    	<div class="mctArea typeRight">
    		<a class="mctBanner" href="javaScript:;" target="_self">
    		</a>
    	</div>
    </div>
</section>
</div>

<!-- pageContent -- END -->
<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">

var app = new Vue({ 
    el: '#app',
    data: {
    	fundingList : [],
   		recipeList : [],
		recommendList : [],
		polList : []

    }
	, filters: {
	    numberFormat: (value, numFix) => {
	        value = parseFloat(value);
	        if (!value) return '0';
	        return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
	    },
	}
    , methods : {
    	// 펀딩 리스트
    	fnGetFunding : function() {
    		var self = this;    		
	      	var nparmap = {};
	        $.ajax({
	            url:"/index/funding.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
					self.fundingList = data.list;
	            }
	        }); 
   	 	}
   	 	
    	, pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
			//	this.linkCall(url);
				return;
			}
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
    	
   	 	// 펀딩 상세보기
   	 	, fnViewFunding: function(fundingNo) {
                	var self = this;
                	self.pageChange("./funding/view/open.do", {fundingNo : fundingNo});
        }
	   	 
   	 	//똑똑한 마켓 구매하기
   	 	, fnView : function(productNo){
		    	var self = this;	    	
		    	self.pageChange("/market/view.do", {productNo : productNo});
			}
	   	// 똑똑한마켓 리스트
	   	 	, fnGetRecommend : function() {
				var self = this;    		
		      	var nparmap = {};
		      	//추천상품
	    		$.ajax({
	                url:"/smartmarket-recommend-list.dox",
	                dataType:"json",
	                type : "POST",
	                data : nparmap,
	                success : function(data) {
	                	self.recommendList = data.list;
	                }
	            }); 
			 }
   	
   		// 레시피 리스트
   	 	, fnGetRecipe : function() {
			var self = this;    		
	      	var nparmap = {};
	        $.ajax({
	            url:"/index/recipe.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	//console.log("레시피 데이터 : ");
	            	//console.log(data);
					self.recipeList = data.list;
	            }
	        }); 
		 }
		// 레시피 상세보기
	 	, fnViewRecipe: function(recipeNo) {
		  	var self = this;
		  	self.pageChange("./recipe/view.do", {recipeNo : recipeNo});
		}
		// 알쓸정책 바로가기
		, fnMorePolicy : function() {
    		location.href = "./policy.do";
		}
		
		// 정책 리스트
		, fnGetPol : function() {
    		var self = this;    		
	      	var nparmap = {};
	        $.ajax({
	            url:"/index/policy.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data.list);
					self.polList = data.list;
	            }
	        }); 
   	 	}
		
		// 정책 보기
		, fnViewPol : function(boardNo) {
			var self = this;
			self.pageChange("./policy/view.do", {boardNo : boardNo});
		}
    	
    		
    		
    }   
    , created: function () {
    	var self = this;
    	self.fnGetFunding();
    	self.fnGetRecipe();
    	self.fnGetRecommend();
    	self.fnGetPol();
	}
});
</script>
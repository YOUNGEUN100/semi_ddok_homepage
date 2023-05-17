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
            <div class="mctThumb typeCol">
                <a href="javaScript:;" class="imgBox">
                    <!-- <img src="" alt=""> -->
              </a>
              <a href="javaScript:;" class="cartBtn"><i class="fa-solid fa-cart-plus"></i></a>
              <a href="javaScript:;" class="txtBox">
                  <p class="text">현재 3개 남았어요!</p>
                  <h4 class="title">국내산 감자(햇)</h4>
                  <div class="price"><span class="amount">3,750원</span> (100g당 750원)</div>
              </a>
          </div>
          <div class="mctThumb typeCol">
              <a href="javaScript:;" class="imgBox">
                  <!-- <img src="" alt=""> -->
              </a>
              <a href="javaScript:;" class="cartBtn"><i class="fa-solid fa-cart-plus"></i></a>
              <a href="javaScript:;" class="txtBox">
                  <p class="text"></p>
                  <h4 class="title">돌 바나나, 1.2kg</h4>
                  <div class="price"><span class="amount">4,290원</span> (100g당 358원)</div>
              </a>
          </div>
          <div class="mctThumb typeCol">
              <a href="javaScript:;" class="imgBox">
                  <!-- <img src="" alt=""> -->
              </a>
              <a href="javaScript:;" class="cartBtn"><i class="fa-solid fa-cart-plus"></i></a>
              <a href="javaScript:;" class="txtBox">
                  <p class="text">현재 1개 남았어요!</p>
                  <h4 class="title">서울우유 1급A우유, 2300ml</h4>
                  <div class="price"><span class="amount">6,280원</span> (100ml당 273원)</div>
              </a>
          </div>
          <div class="mctThumb typeCol">
              <a href="javaScript:;" class="imgBox">
                  <!-- <img src="" alt=""> -->
              </a>
              <a href="javaScript:;" class="cartBtn"><i class="fa-solid fa-cart-plus"></i></a>
              <a href="javaScript:;" class="txtBox">
                  <p class="text"></p>
                  <h4 class="title">잇츠베러 마요, 245g</h4>
                  <div class="price"><span class="amount">5,500원</span> (100g당 2,245원)</div>
              </a>
          </div>
          <div class="mctThumb typeCol">
              <a href="javaScript:;" class="imgBox">
                  <!-- <img src="" alt=""> -->
                </a>
                <a href="javaScript:;" class="cartBtn"><i class="fa-solid fa-cart-plus"></i></a>
                <a href="javaScript:;" class="txtBox">
                    <p class="text"></p>
                    <h4 class="title">동서 포스트 콘푸라이트 시리얼, 530g</h4>
                    <div class="price"><span class="amount">3,880원</span> (100g당 732원)</div>
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
        	<ul class="mctList">
        		<li><span class="cateBox">#생활</span><h4 class="title"><a href="javaScript:;" target="_self">1인가구에 '스마트초인종·가정용CCTV' 안심장비 지원</a></h4></li>
        		<li><span class="cateBox">#생활</span><h4 class="title"><a href="javaScript:;" target="_self">고립·은둔청년 찾아 사회복귀 돕는다! 원스톱 지원</a></h4></li>
        		<li><span class="cateBox">#문화</span><h4 class="title"><a href="javaScript:;" target="_self">'문화가 흐르는 예술마당' 개막…린, 원슈타인 공연 열린다</a></h4></li>
        		<li><span class="cateBox">#경제</span><h4 class="title"><a href="javaScript:;" target="_self">글로벌기업·국제기구 84곳에서 '청년인턴 직무캠프' 운영</a></h4></li>
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
   		recipeList : []	

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
    	
    		
    		
    }   
    , created: function () {
    	var self = this;
    	self.fnGetFunding();
    	self.fnGetRecipe();
	}
});
</script>
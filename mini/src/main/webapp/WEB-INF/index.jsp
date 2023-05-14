<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>

<!-- pageContent -- START -->

<!-- mainVisual -->
<section id="mainVisual" class="mainVisualSlider">
    <div class="slide page1">
        <div class="wrapper">
            <h2 class="slideTitle">slide1 Title</h2>
            <p class="slideText">slide1 Text</p>
            <a href="javaScript:;" class="sideLink">more view</a>
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
        <ul class="mctTab">
            <li><a href="javaScript:;" class="active">한식</a></li>
            <li><a href="javaScript:;">양식</a></li>
            <li><a href="javaScript:;">분식</a></li>
            <li><a href="javaScript:;">디저트</a></li>
        </ul>
        <div class="mctArea type3">
            <div class="mctThumb typeCol">
                <a href="javaScript:;" class="imgBox">
                    <!-- <img src="" alt=""> -->
              </a>
              <a href="javaScript:;" class="txtBox">
                  <p class="text">#요리초보 #요린이 #봄나물 #제철나물 #나물요리</p>
                  <h4 class="title">봄 된장 비빔밥</h4>
              </a>
          </div>
          <div class="mctThumb typeCol">
              <a href="javaScript:;" class="imgBox">
                  <!-- <img src="" alt=""> -->
              </a>
              <a href="javaScript:;" class="txtBox">
                  <p class="text">#라면 #돈까스 #분식 #분식집</p>
                  <h4 class="title">돈까스 김치나베 라면</h4>
              </a>
          </div>
          <div class="mctThumb typeCol">
              <a href="javaScript:;" class="imgBox">
                  <!-- <img src="" alt=""> -->
                </a>
                <a href="javaScript:;" class="txtBox">
                    <p class="text">#국수 #열무김치 #비빔장 #새콤달콤 #한그릇</p>
                    <h4 class="title">열무비빔국수</h4>
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
                <a href="javaScript:;" class="imgBox">
                    <img src="" alt="">
                </a>
                <a href="javaScript:;" class="txtBox">
                	<p class="text">요리를 하려는데 계량 기구가 없다면?</p>
                    <h4 class="title">한 눈으로 살펴보는 간단한 계량팁</h4>
                </a>
            </div>
            <div class="mctThumb typeCol">
                <a href="javaScript:;" class="imgBox">
                    <img src="" alt="">
                </a>
                <a href="javaScript:;" class="txtBox">
                	<p class="text">작정하고 출시했다는</p>
                    <h4 class="title">다*소 피크닉 신상템 모음집</h4>
                </a>
            </div>
            <div class="mctThumb typeCol">
                <a href="javaScript:;" class="imgBox">
                    <img src="" alt="">
                </a>
                <a href="javaScript:;" class="txtBox">
                	<p class="text">경제·재테크 꿀팁!</p>
                    <h4 class="title">운동하고 5만원도 받는 1석2조 제도</h4>
                </a>
            </div>
            <div class="mctThumb typeCol">
                <a href="javaScript:;" class="imgBox">
                    <img src="" alt="">
                </a>
                <a href="javaScript:;" class="txtBox">
                	<p class="text">(추가) 경제·재테크 꿀팁!</p>
                    <h4 class="title">운동하고 5만원도 받는 1석2조 제도</h4>
                </a>
            </div>
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
    	fundingList : []
   	    	

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
   	 
    	
    		
    		
    }   
    , created: function () {
    	var self = this;
    	self.fnGetFunding();
	}
});
</script>
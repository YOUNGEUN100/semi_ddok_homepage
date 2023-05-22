<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth1_todayEat.css">

<!-- pageContent -- START -->
<div id="pageContent" class="todayEat">
	<div class="wrapper">
		<%-- <jsp:include page="/layout/includeLoading.jsp"></jsp:include> --%>
		<div id="result" class="resultContainer">
			<div class="resultMenu">
	 			<h3 class="resultMenuTitle">
					<span v-if="menuFlg">{{message}}</span> 오늘 ‘<span id="menuName">{{info.recipeName}}</span>’ 어때요?
				</h3>
				<div class="imgBox">
                	<img class="img" :src="info.imgPathT">
				</div>
				<button class="replayBtn" @click="fnReplay()"><i class="fa-solid fa-arrow-rotate-left"></i> 다시 추천받기</button>
			</div>
			<div class="resultMore">
				<div class="recipeArea">
					<h4 class="areaTitle"><span>{{info.recipeName}}</span>, 이렇게만 하면 맛보장</h4>
					<div class="recipeBox styleBoxRound styleBoxShadow styleHoverShadow" @click="fnRecipeView(info.recipeNo)">
						<img class="img" :src="info.imgPathR">
						<div class="info">
							<p class="hashtag">{{info.hashtag}}</p>
						    <h4 class="title"><i class="fa-solid fa-utensils"></i> {{info.recipeName}}</h4>
						</div>
					</div>
				</div>
				<div class="marketArea">
					<h4 class="areaTitle"><b>부족한 재료</b>는 바로 주문!</h4>
					<div class="marketBox">
		            <div class="thumb styleHoverShadow typeThumb" v-for="(item, index) in productList" @click="fnView(item.productNo)">
		            	<div class="imgBox styleBoxRound"><img :src="item.imgPath" alt=""></div>
						<div class="txtBox">
						    <p class="text">현재 {{item.productStock}}개 남았어요!</p>
						    <h4 class="title">{{item.productName}}</h4>
						    <div class="price"><span class="amount">{{item.productPrice | numberFormat()}}원</span> (100{{item.productVolume}}당 {{item.productPrice*100 / item.productWeight*item.productEa | numberFormat()}}원)</div>
						</div>
					</div>
          		</div>
          	</div>
        </div>
    </div>
</section>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
var result = new Vue({ 
	el: '#result',
	data: {
		list : [], 
		info : {},
		menuFlg : false,
		message : "",
		param : {
			r_purpose : "${hmap.r_purpose}",
			howto : "${hmap.howto}",
			ingredient : ${hmap.ingredient},
			tool : "${hmap.tool}"
		},
		ingList : [],
		productList : [],
		code : ""
	}
	, filters: {
	    numberFormat: (value, numFix) => {
	        value = parseFloat(value);
	        if (!value) return '0';
	        return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
	    },
	}
	, methods: {
		// 전체 메뉴 랜덤하게 가져오기
		fnGetRecipe : function() {
            var self = this;
            var nparmap = {};
            
            $.ajax({
                url:"/todayEat/recipe/resultR.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                    self.info = data.menu;
                    self.code = data.menu.code;
                    self.info.imgPathT = "../" + data.menu.imgPathT;
                    self.info.imgPathR = "../" + data.menu.imgPathR;
                    console.log(self.info);
                    console.log(data.menu.code);
                  // console.log("menu 데이터는" + data.menu);
                  //  console.log(data.menu);
                    self.message = "검색결과가 없어요. 대신";
                    self.menuFlg = true;
                    //재료 자르기
                    var ingArray = self.info.cookIngre.split(',');
					// 김, 밥 필터
					var filtered = ingArray.filter((element) => element != '밥');
					self.ingList = filtered.filter((element) => element != '물');
                    console.log("split 결과 = " + ingArray);
                    console.log("필터결과1 = " + filtered);
                    console.log("필터결과2 = " + self.ingList);
                    console.log("제외할 코드 = " + self.code);
					self.fnGetProduct();
                  
                }
            }); 
		},
		
		fnGetRecipeResult : function() {
            var self = this;
            var nparmap = self.param;
            
            nparmap.ingredient = JSON.stringify(self.param.ingredient);
            $.ajax({
                url:"/todayEat/recipe/result.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                    self.info = data.info;
                    if (!self.info) {
                    	self.fnGetRecipe(); 
                    }
                    else{
                    	self.code = data.info.code;
	                    console.log(self.info);
	                    self.info.imgPathT = "../" + data.info.imgPathT;
	                    self.info.imgPathR = "../" + data.info.imgPathR;
	                    
	                    //재료 자르기
	                    var ingArray = self.info.cookIngre.split(',');
						// 김, 밥 필터
						var filtered = ingArray.filter((element) => element != '밥');
						self.ingList = filtered.filter((element) => element != '물');
	                    console.log("split 결과 = " + ingArray);
	                    console.log("필터결과1 = " + filtered);
	                    console.log("필터결과2 = " + self.ingList);
	                    console.log("제외할 코드 = " + self.code);
						self.fnGetProduct();
                    }
                    
					
                }
            }); 
		}
		// 구매유도 리스트
		, fnGetProduct : function() {
			var self = this;	
 			var nparmap = {ingList : JSON.stringify(self.ingList), code : self.code};
			
			$.ajax({
                url:"/todayEat/recipe/product.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                    self.productList = data.list;
                    console.log(data);
					
                }
            });
		}
   	 	//똑똑한 마켓 구매하기
   	 	, fnView : function(productNo){
		    	var self = this;	    	
		    	self.pageChange("/market/view.do", {productNo : productNo});
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
		, fnRecipeView : function(recipeNo){
			var self = this;
			self.pageChange("/recipe/view.do", {recipeNo : recipeNo});
		}
		, fnMarketProdView : function() {
			var self = this;
		}
		, fnReplay : function() {
    		location.href = "/todayEat/recipe.do";
		}
	} 
	, created: function () {
		var self = this;
		self.fnGetRecipeResult();
		
	}
}); 
</script>
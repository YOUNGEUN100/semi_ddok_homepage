<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
.styleBoxRound {border-radius:1.5em; overflow:hidden;}
.styleBoxShadow {box-shadow:0 0 10px 0 rgba(0,0,0,0.1);}
.styleHoverShadow {transition:all 0.2s ease-out;}
.styleHoverShadow:hover {box-shadow:0 2px 20px 0 rgba(0,0,0,0.3);}

.resultMenu {text-align:center; margin-bottom:5em;}
.resultMenuTitle {font-size:1.75em;}
.resultMenuTitle span {font-size:1.25em;}
.imgBox {width:400px; height:400px; border-radius:50%; margin:1em auto 2em; position:relative; overflow:hidden;}
.imgBox img {width:auto; max-width:inherit; height:100%; position:absolute; top:50%; left:70%; transform:translate(-50%, -50%);}
.replayBtn {font-weight:600; cursor:pointer}
.replayBtn i {margin-right:0.2em;}

.resultMore {width:100%; position:relative; display:flex; flex-flow:row wrap; justify-content:space-between; align-items:stretch;}
.resultMore .recipeArea {width:calc(100% - 660px);}
.resultMore .recipeArea .recipeImg {cursor:pointer;}
.resultMore .recipeArea .recipeImg img {display:block;}
.resultMore .marketArea {width:600px;}
.areaTitle {font-size:1.625em; font-weight:500; margin-bottom:0.5em;}
.areaTitle span {font-weight:700;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<jsp:include page="/layout/includeLoading.jsp"></jsp:include>
		<div id="app" class="resultContainer">
			<div class="resultMenu">
	 			<h3 class="resultMenuTitle">
					오늘 ‘<span id="menuName">{{info.recipeName}}</span>’ 어때요?
				</h3>
				<div class="imgBox">
                	<img class="img" :src="info.imgPathT">
				</div>
				<a class="replayBtn" @click="fnReplay()"><i class="fa-solid fa-reply"></i> 다시 추천받기</a>
			</div>
			<div class="resultMore">
				<div class="recipeArea">
					<h4 class="areaTitle"><span>{{info.recipeName}}</span>, 이렇게만 하면 맛보장</h4>
					<div class="recipeImg styleBoxRound styleBoxShadow styleHoverShadow" @click="fnRecipeView(info.recipeNo)">
						<img class="img" :src="info.imgPathC">
					</div>
				</div>
				<div class="marketArea">
					<h4 class="areaTitle">부족한 재료는 바로 주문!</h4>
					<div class="prodBox">
						{{info.cookIngre}}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
var app = new Vue({ 
	el: '#app',
	data: {
		list : [], 
		info : {},
		param : {
			r_purpose : "${hmap.r_purpose}",
			howto : "${hmap.howto}",
			ingredient : ${hmap.ingredient},
			tool : "${hmap.tool}"
		}
	}, methods: {
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
                    console.log(self.info);
                    
                    self.info.imgPathT = "../" + data.info.imgPathT;
                    self.info.imgPathC = "../" + data.info.imgPathC;
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
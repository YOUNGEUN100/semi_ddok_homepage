<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
#result {text-align:center;}
.imgBox {width:300px; height:300px; border-radius:50%; background:var(--base-colorBasicGray); margin:1em auto 2em;}
.replayBtn {font-weight:600;}
.replayBtn i {margin-right:0.2em;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<jsp:include page="/layout/includeLoading.jsp"></jsp:include>
		<div id="app">
			<div id="result">
	 			<h3 class="resultTitle">
					오늘 <span>{{info.recipeName}}</span> 어때요?
				</h3>
				<div class="imgBox">
					<img src="" alt="">
				</div>
				<a class="replayBtn" @click="fnReplay()"><i class="fa-solid fa-reply"></i> 다시 추천받기</a>
			</div>
			<div @click="fnRecipeView(info.recipeNo)">{{info.recipeName}} 레시피 보기</div>
			<div>
				{{info.cookIngre}}
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
			r_purpose : "${map.r_purpose}",
			howto : "${map.howto}",
			ingredient : ${map.ingredient},
			tool : "${map.tool}"
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
                    cookIngre = (self.info.cookIngre).split(",");
                    console.log(cookIngre);
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
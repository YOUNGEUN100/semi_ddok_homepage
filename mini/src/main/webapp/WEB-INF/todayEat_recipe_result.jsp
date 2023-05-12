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
					오늘 <span></span> 어때요?
				</h3>
				<div class="imgBox">
					<img src="" alt="">
				</div>
				<a class="replayBtn" @click="fnReplay()"><i class="fa-solid fa-reply"></i> 다시 추천받기</a>
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
                	console.log(self.param);  
                	console.log(data);      
                    self.info = data.info;
                }
            }); 
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
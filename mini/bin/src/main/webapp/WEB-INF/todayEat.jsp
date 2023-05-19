<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth1_todayEat.css">

<!-- pageContent -- START -->
<div id="pageContent" class="todayEat">
	<div class="wrapper">
		<div id="select" class="selectArea">
			<div class="selectBtn" @click="fnSelectStore" style="background:url(../images/todayEat_img01.jpg) center center / cover no-repeat;">
				<div class="textBox">
					<h4 class="btnTitle">맛집메뉴 추천</h4>
					<p>당신의 취향만 알려주세요! <br>맛집은 우리가 추천해 드릴게요.</p>
				</div>
			</div>
			<div class="selectBtn" @click="fnSelectRecipe" style="background:url(../images/todayEat_img02.jpg) center center / cover no-repeat;">
				<div class="textBox">
					<h4 class="btnTitle">레시피 추천</h4>
					<p>냉장고에 잠자고 있는 재료들을 알려주세요! <br>가장 최적화 된 메뉴를 알려드릴게요.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
var select = new Vue({ 
    el: '#select',
    data: {
    }   
    , methods: {
    	fnSelectStore : function() {
			location.href = "/todayEat/store.do";
		}
		, fnSelectRecipe : function() {
			location.href = "/todayEat/recipe.do";
		}
    }   
	, created: function () {
	}
});
</script>
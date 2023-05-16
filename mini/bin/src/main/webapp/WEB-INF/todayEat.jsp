<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
#pageContent.todayEat .selectArea {min-height:inherit; display:flex; felx-flow:row wrap; justify-content:space-between;}
#pageContent.todayEat .selectArea a.selectBtn {width:calc(50% - 20px); border-radius:2em; padding-top:30%; display:block; position:relative; overflow:hidden; transition:all 0.25s ease-out;}
#pageContent.todayEat .selectArea a.selectBtn .textBox {width:100%; height:100%; position:absolute; top:0; left:0; display:flex; flex-flow:column wrap; justify-content:center; align-items:center; text-align:center; padding-top:5em; color:var(--base-colorWhite); transition:all 0.25s ease-out; opacity:0.75;}
#pageContent.todayEat .selectArea a.selectBtn .textBox .btnTitle {font-size:1.75em; margin-bottom:0.5em;}
#pageContent.todayEat .selectArea a.selectBtn:hover {box-shadow:0 5px 40px 0 rgba(0,0,0,0.4);}
#pageContent.todayEat .selectArea a.selectBtn:hover .textBox {opacity:1;}
</style>


<!-- pageContent -- START -->
<div id="pageContent" class="todayEat">
	<div class="wrapper">
	<!-- wrap START -->
		<div class="selectArea">
			<a class="selectBtn" href="todayEat/store.do" target="_self" style="background:url(../images/todayEat_img01.jpg) center center / cover no-repeat;">
				<div class="textBox">
					<h4 class="btnTitle">맛집메뉴 추천</h4>
					<p>당신의 취향만 알려주세요! <br>맛집은 우리가 추천해 드릴게요.</p>
				</div>
			</a>
			<a class="selectBtn" href="todayEat/recipe.do" target="_self" style="background:url(../images/todayEat_img02.jpg) center center / cover no-repeat;">
				<div class="textBox">
					<h4 class="btnTitle">레시피 추천</h4>
					<p>냉장고에 잠자고 있는 재료들을 알려주세요! <br>가장 최적화 된 메뉴를 알려드릴게요.</p>
				</div>
			</a>
		</div>
    <!-- wrap END -->
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	
</script>

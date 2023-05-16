<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	 .card_list {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            grid-template-rows: repeat(3,420px);
        }
       .card_list div { margin-right: 15px; }
       .card_list .card { text-align: left;cursor: pointer; }
</style>


<!-- pageContent -- START -->
<div id="app">
	<div id="pageContent">
		<div class="wrapper">
		 	<div id="app">
		
		 
		 <div class="card_list" >
                <div class="card" onClick="location.href='/livingTip/view.do'">
                    <img class="recipe-img" src="./images/news1.jpg">
                </div>
                <div class="card" onClick="location.href='/livingTip/view.do'">
                    <img class="recipe-img" src="./images/news2.jpg">
                </div>
                <div class="card" onClick="location.href='/livingTip/view.do'">
                    <img class="recipe-img" src="./images/news3.jpg">
                </div>
                <div class="card" onClick="location.href='/livingTip/view.do'">
                    <img class="recipe-img" src="./images/news4.jpg">
                </div>
            </div>
            
		 
		 	</div>
		</div>
	</div>
</div>

<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
 // 자바 스크립트 입력 
</script>
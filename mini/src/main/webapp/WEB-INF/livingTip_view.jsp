<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth4_livingTip.css">

<!-- pageContent -- START -->
<div id="pageContent" class="livingTip typeView">
	<div class="wrapper">
		<div id="livingTipView" class="livingTipViewContainer">
		  	<section class="livingTipSection">
		      	<p class="tip"><i class="fa-solid fa-arrow-pointer fa-beat"></i> 양 옆 화살표를 눌러 넘겨보세요!</p>
		  		<div class="slideArea styleBoxRound typeMore styleBoxShadow">
	            	<ul class="slideList">
	                	<li class="slideItem" v-for="(item, index) in list">
	                		<img :src="item.imgPath">
	                	</li>                 
	             	</ul>
             	</div>
             	<div class="arrowArea">
	             	<div class="preBtn styleBoxShadow styleHoverShadow" @click="fnPreBtn"><i class="fa-solid fa-circle-chevron-left"></i></div>
			  		<div class="nextBtn styleBoxShadow styleHoverShadow" @click="fnNextBtn"><i class="fa-solid fa-circle-chevron-right"></i></div>
		  		</div>
             </section>
            
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button class="delBtn" @click="fnDelete">삭제</button>
						</div>
					</div>
				</div>
			</template>
			<!-- adminCtrlBox -- Don't touch -->
		 </div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
var livingTipView = new Vue({
    el: '#livingTipView',
    data: {
    	list : [],
        sessionId: "${sessionId}",
        sessionStatus : "${sessionStatus}",
    	cardNo : "${map.cardNo}",
    	num : "",
    	page: 0
    }
    , methods : {
    	fnCardInfo : function(){
            var self = this;
            var nparmap = {cardNo : self.cardNo};
            $.ajax({
                url:"/livingTip/view.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
                	self.num = data.list.length;
                	console.log(self.num);
                	console.log(data.list);
                }
            });
        }
    	, fnDelete: function() {
    		var self = this;
    		if(!confirm("삭제하시겠습니까?")) {
    			return;
    		}
    		var nparmap = {cardNo : self.cardNo};
    		$.ajax({
                url:"/livingTip/remove.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
					alert("삭제완료");
					location.href="/livingTip.do";
                }
            });
    	}
	    , fnPreBtn: function() {
	    	var self = this;
	    	if(self.page > 0) {
	    		self.page--;
	    		$(".slideList").css("transform", "translateX(-" + self.page + "00%)");
	    	}
	    }
	    , fnNextBtn: function() {
	    	var self = this;
	    	if(self.page < self.num-1) {
	    		self.page++;
	    		$(".slideList").css("transform", "translateX(-" + self.page + "00%)");
	    	}
	    }
	}	
    , created: function () {
    	var self = this;
    	self.fnCardInfo();
	}
});
</script>
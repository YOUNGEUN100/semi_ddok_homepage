<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth4_livingTip.css">

<!-- pageContent -- START -->
<div id="pageContent" class="livingTip">
	<div class="wrapper">
		<div id="livingTipList" class="livingTipListContainer">
	 		<div class="cardList">
               	<div class="cardThumb styleBoxShadow styleHoverShadow" v-for="(item, index) in list" @click="fnViewCard(item.cardNo)">
                   	<img :src="item.imgPath" alt="">
               	</div>
           	</div>
			<!-- 페이징 추가 -->
			<template>
				<paginate id="page"
							:page-count="pageCount"
							:page-range="3"
							:margin-pages="2"
							:click-handler="fnSearch"
							:prev-text="'<'"
							:next-text="'>'"
							:container-class="'pagination'"
							:page-class="'page-item'">
				</paginate>
			</template>
			
			<!-- adminCtrlBox -- Don't touch -->
 			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button @click="fnAddTip">등록</button>
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
Vue.component('paginate', VuejsPaginate)
var livingTipList = new Vue({ 
    el: '#livingTipList',
    data: {
    	list : [],
    	sessionId : "${sessionId}",
	    sessionStatus : "${sessionStatus}",
		selectPage: 1,
		pageCount: 1,
		cnt : 0

    }
    , methods : {
    	fnCardList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 9);
            console.log(startNum);
            var nparmap = {startNum : startNum};
            $.ajax({
                url:"/livingTip/list.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
                	console.log(data.list);
                	console.log(data.cnt);
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 9);
                    console.log("페이지 카운트"+self.pageCount);
                }
            });
        }
		, fnSearch : function(pageNum){
			var self = this;
			console.log("선택한페이지 = "+pageNum);
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 9);
			var nparmap = {startNum : startNum};
			$.ajax({
				url : "/livingTip/list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 9);
				}
			});
		}
    	, fnViewCard: function(cardNo) {
    		var self = this;
    		self.pageChange("./livingTip/view.do", {cardNo : cardNo});
    	}
    	, pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
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
    	, fnAddTip : function() {
    		var self = this;
    		location.href = "/livingTip/edit.do";
    	}
	}	
    , created: function () {
    	var self = this;
    	self.fnCardList();
	}
});
</script>
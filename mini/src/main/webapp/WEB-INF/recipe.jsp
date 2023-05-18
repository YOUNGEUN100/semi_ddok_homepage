<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth3_recipe.css">

<!-- pageContent -- START -->
<div id="pageContent" class="recipe">
	<div class="wrapper">
		<div id="recipeList" class="recipeListContainer">
			<section class="r-search">
			    <input type="text" v-model="keyword" placeholder="원하는 레시피를 검색해 보세요!" class="r-input"  @keyup.enter="fnGetRecipeAll()">
			    <i class="search-icon fa-solid fa-magnifying-glass fa-lg" @click="fnGetRecipeAll()"></i>
			</section>
			<section class="r-category">
			    <div class="category-circle active" id="all-btn" @click="fnGetRecipeAll()">
			        <img src="/images/recipe_icon01.png" alt="">
                	<p class="circle-title">전체</p>
			    </div>
			    <div class="category-circle" id="purpose-btn">
			        <img src="/images/recipe_icon02.png" alt="">
                	<p class="circle-title">목적</p>
			    </div>
			    <div class="category-circle" id="howto-btn">
			        <img src="/images/recipe_icon03.png" alt="">
                	<p class="circle-title">방법</p>
			    </div>
			    <div class="category-circle" id="tool-btn">
			        <img src="/images/recipe_icon04.png" alt="">
                	<p class="circle-title">도구</p>
			    </div>
			</section>
			<section class="detail-category styleBoxRound styleBoxShadow">
			    <div id="purpose" class="cate-box">
                	<h3 class="cate-title">목적별</h3>
                	<div class="cate-item" >
			        	<a v-for="(item, index) in codeList" v-if="item.kind=='R_PURPOSE'" href="#tool" class="each" @click="fnGetRecipeListPur(item)">{{item.name}}</a>
			    	</div>
			    </div>
			    <div id="howto" class="cate-box">
                	<h3 class="cate-title">방법별</h3>
                	<div class="cate-item" >
			        	<a v-for="(item, index) in codeList" v-if="item.kind=='HOWTO'" href="#tool" class="each" @click="fnGetRecipeListHow(item)">{{item.name}}</a>
			    	</div>
			    </div>
			    <div id="tool" class="cate-box">
                	<h3 class="cate-title">도구별</h3>
                	<div class="cate-item" >
			        	<a v-for="(item, index) in codeList" v-if="item.kind=='TOOL'" href="#tool" class="each" @click="fnGetRecipeListTool(item)">{{item.name}}</a>
			    	</div>
			    </div>
			</section>
            <section class="search-result-s" id="tag1">
            	<div class="result-text">
            		<span v-if="keyword != ''">검색결과 : {{keyword}}</span>	
		            <span v-else>
            			<span v-if="rkind == '전체'">모든 레시피</span>	
            			<span v-else>검색결과 : {{rkind}}</span>
		            </span>
            	</div>
            	
            	<div class="result-cnt">
            		총 <span v-if="keyword != ''">{{keycnt}}</span>
            		  <span v-else>{{cnt}}</span>개의 레시피
            	</div>
            </section>
            <section class="item-list">
                <div class="item" v-for="(item, index) in list" @click="fnView(item.recipeNo)" >
                    <div class="img-box styleBoxRound styleBoxShadow styleHoverShadow">
                        <div class="re-view-cnt">
                            <i class="fa-solid fa-eye"></i>
                            <span>{{item.recipeHits}}</span>
                        </div>
                        <img class="recipe-img" :src="item.imgPath">
                    </div>
                    <div class="txt-box">
                    	<p class="hashtag">{{item.hashtag}}</p>
                    	<h4 class="title">{{item.recipeName}}</h4>
                    </div>
                </div>
            </section>
            
            <!-- 페이징 추가3 -->
            <template >
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
							<button class="addBtn" @click="fnGoEdit()">등록</button>
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
	 
var recipeList = new Vue({ 
	el: '#recipeList',
	data: {
		 keyword : "",
		 list: [],
		 cnt : 0,
		 keycnt : 0,
		 codeList : ${map.codeList},
		 rkind : "전체",
		 pageUrl : "", 
		 recipe_code : "",
		 selectPage : 1, // 클릭한 페이지 번호
		 pageCount : 1, // 페이지 수
		 sessionId: "${sessionId}",    
	     sessionStatus : "${sessionStatus}"
	}, methods: {
		// 전체 레시피 리스트 가져오기
		fnGetRecipeAll : function() {
			var self = this;
			self.rkind = "전체";
			var startNum = ((self.selectPage-1) * 12);
			var nparmap = {keyword : self.keyword, startNum : startNum};
			$.ajax({
				url: "/recipe/all.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.cnt;
					 self.keycnt = data.list.length;
					 self.pageCount = Math.ceil(self.cnt / 12);
				}
			})
		}
		// 페이징 메소드
		,fnSearch : function(pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((self.selectPage-1) * 12);
			var nparmap = {recipe_code : self.recipe_code, startNum : startNum};
			
			if (self.category == 'R_PURPOSE') {
				self.pageUrl = "/recipe/list/purpose.dox"
			} else if (self.category == 'HOWTO') {
				self.pageUrl = "/recipe/list/howto.dox"
			}else if (self.category == 'TOOL') {
				self.pageUrl = "/recipe/list/tool.dox"
			}else if (self.rkind == '전체'){
				self.pageUrl = "/recipe/all.dox"
			}
			
			$.ajax({
				url: self.pageUrl,
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.cnt;
					 self.pageCount = Math.ceil(self.cnt / 12);
					
					 self.selectPage = "1"; // 선택 페이지 초기화
				}
			})
			
		} 
		// 목적별 리스트 가져오기
		,fnGetRecipeListPur : function(item) {
			var self = this;
			self.recipe_code = item.code;
			self.rkind = item.name;
			self.category = item.kind;
			
			var startNum = ((self.selectPage-1) * 12);
			var nparmap = {recipe_code : self.recipe_code, startNum : startNum};
			$.ajax({
				url: "/recipe/list/purpose.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.cnt;
					 self.pageCount = Math.ceil(self.cnt / 12);
				}
			})
		}
		// 방법별 리스트 가져오기
		,fnGetRecipeListHow : function(item) {
			var self = this;
			self.recipe_code = item.code;
			self.rkind = item.name;
			self.category = item.kind;;
			// 페이징 추가6
			var startNum = ((self.selectPage-1) * 12);
			var nparmap = {recipe_code : self.recipe_code, startNum : startNum};
			$.ajax({
				url: "/recipe/list/howto.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.cnt;
					 self.pageCount = Math.ceil(self.cnt / 12);
				}
			})
		}
		// 도구별 리스트 가져오기
		,fnGetRecipeListTool : function(item) {
			var self = this;
			self.recipe_code = item.code;
			self.rkind = item.name;
			self.category = item.kind;
			// 페이징 추가6
			var startNum = ((self.selectPage-1) * 12);
			var nparmap = {recipe_code : self.recipe_code, startNum : startNum};
			$.ajax({
				url: "/recipe/list/tool.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.cnt;
					 self.pageCount = Math.ceil(self.cnt / 12);
				}
			})
		}
	   // 레시피 등록 페이지 이동
	   ,fnGoEdit : function() {
			location.href = "recipe/edit.do";
	   }
		// 레시피 상세 페이지 이동
		,fnView : function(recipeNo) {
			var self = this;	
			console.log(recipeNo);
	    	self.pageChange("/recipe/view.do", {recipeNo : recipeNo});
		}
		// 페이지 전환
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
	} 
	, created: function () {
		var self = this;
		self.fnGetRecipeAll();
	}
});


$(document).ready(function(){
	var cateBtn = $(".r-category .category-circle");
	var cateBox = $(".detail-category .cate-box");
	$(cateBox).addClass("active");
	$(cateBox).addClass("typeAll");

    $(cateBtn).on("click", function() {
    	$(this).addClass("active");
    	$(this).siblings().removeClass("active");
    	$(cateBox).addClass("typeAll");
    	
    	var cateIdBox = $(this).attr("id").split("-")[0];
    	if(cateIdBox == "all"){
        	$(cateBox).addClass("typeAll");
    	} else {
        	$(cateBox).removeClass("typeAll");
    	}
    	$("#" + cateIdBox).addClass("active");
    	$("#" + cateIdBox).siblings().removeClass("active");
    });
    $("#all-btn").on("click", function() {
    	$(cateBox).addClass("active");
    });
});
</script>

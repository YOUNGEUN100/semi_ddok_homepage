<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth5_qna.css">

<!-- pageContent -- START -->
<div id="pageContent" class="qna">
	<div class="wrapper">
		<div id="qnaList" class="qnaListContainer">
			<section class="boardSection">
                <div class="boardInfo">
         			<button v-if="sessionStatus=='C'" class="writeBtn styleBoxShadow styleHoverShadow" @click="fnAddCom()">문의하기</button>
			        <div class="categoryBox">
			        	<div class="categoryCircle active"  @click="fnqOrder(2)">
					        <img src="/images/qna_icon01.png">
		                	<p class="circleTitle">FAQ</p>
			        	</div>
			        	<div class="categoryCircle" @click="fnqOrder(1)">
					        <img src="/images/qna_icon02.png">
		                	<p class="circleTitle">QnA</p>
			        	</div>
			        </div>
			    </div>
				<div class="boardArea">
				    <table>
			            <tr class="list_item styleBoxShadow styleHoverShadow" v-for="(item, index) in list" @click="fnViewCom(item.boardNo)">
							<template>
								<template v-if="item.status=='A'">
				                	<td class="notice admin">FAQ</td>
									<td class="title admin">{{item.title}}</td>
								</template>
								<template v-if="item.status=='C'">
									<template v-if="item.userId==sessionId">
					                	<td class="notice myboard">내글</td>
										<td class="title myboard" v-if="item.userId==sessionId">
											<span v-if="item.commentNo > 0" class="complete">답변완료</span>
											<span v-if="item.commentNo == 0" class="progress">답변대기</span> 
											{{item.title}}
										</td>
									</template>
									<template v-else>
										<td class="notice">QnA</td>
										<td class="title">
											<span v-if="item.commentNo > 0" class="complete">답변완료</span>
											<span v-if="item.commentNo == 0" class="progress">답변대기</span> 
											{{item.title}}
										</td>
									</template>
								</template>
							</template>
	 	                    <td class="writer"><i class="fa-solid fa-user"></i> {{item.nick}}</td>
	     	                <td class="date"><i class="fa-solid fa-calendar-days"></i> {{item.cdatetime}}</td>
	             	        <td class="view"><i class="fa-solid fa-eye"></i> {{item.hits}}</td>
			            </tr>
					</table>
				    <template>
				        <paginate id="page" :page-count="pageCount" 
				                            :page-range="3" 
				                            :margin-pages="2" 
				                            :click-handler="fnSearch"
				                            :prev-text="'<'" 
				                            :next-text="'>'" 
				                            :container-class="'pagination'" 
				                            :page-class="'page-item'">
				        </paginate>
				    </template>
				</div>
			</section>
			
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button class="addBtn" @click="fnAddCom()">등록</button>
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
var qnaList = new Vue({
	el: '#qnaList',
	data: {
		list : [],
		cnt : 0,
		cnt1 : 0,
		cnt2: 0,
		selectPage : 1,
		pageCount : 1,
		sessionId: "${sessionId}",    
		sessionStatus : "${sessionStatus}",
		order : "recent",
		category : 2
	}
	, methods: {
		fnGetQnaList: function () {
			var self = this;   
			var startNum = ((self.selectPage-1) * 10);
			var nparmap = {startNum : startNum, order : self.order, category : self.category};
			$.ajax({
				url: "/qna/list.dox",
				dataType: "json",
				type: "POST",
				data: nparmap,
				success: function (data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.cnt1 = data.cnt1;
					self.cnt2 = data.cnt2;
					if (self.category == 1) {
						self.pageCount = Math.ceil(self.cnt1 / 10);
					} else if (self.category == 2) {
						self.pageCount = Math.ceil(self.cnt2 / 10);
					} else {
						self.pageCount = Math.ceil(self.cnt / 10);
					}
				}
			});
		}
		, fnChangeOrder: function () {
			var self = this;                    
			self.fnGetQnaList();
		}
		,fnqOrder : function (num) {
			var self = this;
			if (num == 1) {self.category = 1; self.selectPage = 1;}
			if (num == 2) {self.category = 2; self.selectPage = 1;}
			self.fnGetQnaList();
		}
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var nparmap = {startNum : startNum, order : self.order, category : self.category};
			$.ajax({
				url : "/qna/list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.cnt1 = data.cnt1;
					self.cnt2 = data.cnt2;
					if (self.category == 1) {
						self.pageCount = Math.ceil(self.cnt1 / 10);
					} else if (self.category == 2) {
						self.pageCount = Math.ceil(self.cnt2 / 10);
					} else {
						self.pageCount = Math.ceil(self.cnt / 10);
					}
				}
			});
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
		, fnViewCom: function(boardNo) {
			var self = this;
			self.pageChange("/qna/view.do", {boardNo : boardNo});            		
		}
		, fnAddCom: function() {
			var self = this;
			if (self.sessionId == "") {
				if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {            				
					location.href="/login.do"
					return;
				} else {
					return;
				}            			
			}
			location.href = "/qna/edit.do";
		}
	}
	, created: function () {
		var self = this;
		self.fnGetQnaList();
	}
}); 


$(document).ready(function(){
	var cateBtn = $(".categoryBox .categoryCircle");
    $(cateBtn).on("click", function() {
    	$(this).addClass("active");
    	$(this).siblings().removeClass("active");
    });
});
</script>
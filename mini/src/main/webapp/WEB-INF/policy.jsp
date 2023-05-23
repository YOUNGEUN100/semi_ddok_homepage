<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth4_policy.css">

<!-- pageContent -- START -->
<div id="pageContent" class="policy">
	<div class="wrapper">
		<div id="policyList" class="policyListContainer">
			<section class="policy_list">
				<select v-model="order" @change="fnChangeOrder()">
					<option value="" selected disabled>정렬</option>
					<option value="recent">최신순</option>
					<option value="view">조회수</option>
					<option value="life">생활</option>
					<option value="eco">경제</option>
					<option value="cul">문화</option>
				</select>
			    <table>
		            <tr class="list_item styleBoxShadow styleHoverShadow " v-for="(item, index) in list">
		                <td class="cate">
		                	<span class="cateBox">
			                	<span>#</span>{{item.category}}
			                </span>
		                </td>
		                <td class="title" @click="fnViewCom(item.boardNo)">
		                    {{item.title}} <i v-if="item.filePath" class="fa-solid fa-folder"></i>
		                </td>
		                <td class="date"><i class="fa-solid fa-calendar-days"></i> {{item.cdatetime}}</td>
		                <td class="view"><i class="fa-solid fa-eye"></i> {{item.hits}}</td>
		            </tr>
			    </table>
			</section>

            <!-- 페이징 추가3 -->
			<div id="page">
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
			</div>
			
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button class="addBtn" @click="fnAddPol()">등록</button>
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
 // 자바 스크립트 입력 
 Vue.component('paginate', VuejsPaginate)
 
  var policyList = new Vue({
            el: '#policyList',
            data: {
              list : [],
              cnt : 0,
              // 페이징 추가5
     		 selectPage : 1,
     		 pageCount : 1,
     	     sessionId: "${sessionId}",    
     		 sessionStatus : "${sessionStatus}",
     		 order : "recent"
            }
            , methods: {
            	// 커뮤니티 리스트
                fnGetPolList: function () {
                    var self = this;   
                 // 페이징 추가6
        			var startNum = ((self.selectPage-1) * 10);
            		var nparmap = {startNum : startNum, order : self.order};
            		console.log(self.order);
                    $.ajax({
                        url: "/policy/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                        	console.log(data.list);
                        	self.list = data.list;
                            self.cnt = data.cnt;
                            console.log("게시글의 개수는 :" + self.cnt);
      					 	self.pageCount = Math.ceil(self.cnt / 10);
                        }
                    });
                }
	            , fnChangeOrder: function () {
	                var self = this;
	                var liList = $(".pagination").children();
                    for(var i=0; i<liList.length; i++){
                    	liList.eq(i).removeClass("active");
                    }
                    liList.eq(1).addClass("active");
                    self.selectPage = 1,
            		self.pageCount = 1,
            		self.cnt = 0,
	                self.fnGetPolList();
	            }
            	<!-- 페이징 추가 7-->
        		, fnSearch : function(pageNum){
        			var self = this;
        			self.selectPage = pageNum;
        			var startNum = ((pageNum-1) * 10);
        			console.log(startNum);
        			var nparmap = {startNum : startNum, order : self.order};
        			$.ajax({
        				url : "/policy/list.dox",
        				dataType : "json",
        				type : "POST",
        				data : nparmap,
        				success : function(data) {
        					self.list = data.list;
        					console.log(self.list);
        					self.cnt = data.cnt;
        					self.pageCount = Math.ceil(self.cnt / 10);
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
            	
            	// 정책 글보기
            	, fnViewCom: function(boardNo) {
            		var self = this;
            		self.pageChange("/policy/view.do", {boardNo : boardNo});            		
            	}
            	
            	// 정책 글쓰기
            	, fnAddPol: function() {
            		var self = this;
            		if (self.sessionId == "") {
            			if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {            				
            				location.href="/login.do"
            				return;
            			} else {
            				return;
            			}            			
            		}
            		location.href = "/policy/edit.do";
            	}


            }
            , created: function () {
            	var self = this;
                self.fnGetPolList();
                
            }
        });
</script>
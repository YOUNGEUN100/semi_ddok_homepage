<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth5_community.css">

<!-- pageContent -- START -->
<div id="pageContent" class="community typeView">
	<div class="wrapper">
		<div id="communityView" class="communityViewContainer">
            <section class="boardSection typeBoxArea styleBoxRound typeMore styleBoxShadow">
                <div class="headArea">
	                <div class="titleBox">
	                	<h3 class="title">{{info.title}}</h3>
                        <span class="hits"><i class="fa-solid fa-eye"></i> {{info.hits}}</span>
	                </div>
                    <div class="infoBox">
                        <span class="user"><i class="fa-solid fa-user"></i> {{info.nick}}</span>
                        <span class="date"><i class="fa-regular fa-calendar"></i> {{info.cdatetime}} (최근 수정 : {{info.udatetime}})</span>
                    </div>
                </div>
                <div class="contentArea">
                    <div class="txtBox">
                    	<pre v-html="info.content"></pre>
                    </div>
	               <div class="fileBox" v-if="info.filePath">
	               		<a class="attached" @click="fnOpenFile()">
	               			<i class="fa-regular fa-folder fa-sm"></i> 첨부파일
	               		</a>
	               </div>
                </div>
                <div class="btnArea" v-if="sessionId == info.userId || sessionStatus == 'A'">
                    <button class="modBtn" @click="fnGoModify()">수정</button>
                    <button class="delBtn" @click="fnRemove()">삭제</button>
                </div>
            </section>
            
            <section class="commentSection">
	            <div class="headArea typeBoxArea">
	            	<h3 class="head"><i class="fa-solid fa-comments"></i> 댓글 </h3><span class="commCnt">(<!-- {{commentCnt}} -->)</span>
	            </div>
	            <div v-if="list.length == 0" class="commentArea commentNull typeBoxArea styleBoxRound styleBoxShadow">등록된 댓글이 없습니다.</div>
                <div v-else class="commentArea commentList">
	                <div class="commentItem typeBoxArea styleBoxRound styleBoxShadow" v-for="(item, index) in list">
	                    <div class="commenter"> <!-- 댓글작성자 댓글작성일 정보영역 -->
	                        <div class="infoBox"><i class="fa-solid fa-user"></i><span> {{item.nick}}</span><span class="date">({{item.cdatetime}})</span></div>
							<div class="btnBox">
								<button @click="fncommentDel(item.commentNo)" v-if="item.userId==sessionId || sessionStatus=='A'">삭제</button>
								<!-- <button @click="" v-if="sessionId == item.userId || sessionStatus == 'A'">수정</button> -->
							</div>
	                    </div>
	                    
	                    <div class="commentContent"> <!-- 댓글내용 -->
	                        <pre id="coContent">{{item.comment}}</pre>
	                    </div>
	                   <!--  <div class="commentContent" v-else> 댓글 수정버튼 영역
	                        <textarea rows="5" v-model="commentInfo.content"></textarea>
							<div class="btnBox">
								<button @click="fnEditCommentFinish">수정</button>
								<button @click="fnEditCommentClose">취소</button>
							</div>
	                    </div> -->
		                <!-- 댓글 출력 영역 끝 -->
	                </div>
                </div>
                <template>
	                <div v-if="sessionId != ''" class="commentAdd">
	                    <textarea rows="2" placeholder="댓글을 입력하세요." v-model="commentInfo.comment"></textarea>
	                    <button class="styleHoverShadow" @click="fnCommentEnroll()">댓글등록</button>
	                </div>
	                <div v-else class="commentAdd typeCant typeBoxArea styleBoxRound">
	                    <p><i class="fa-solid fa-user-slash"></i> 댓글은 로그인 후 작성이 가능합니다.</p>
	                </div>
	            </template>
            </section>
            
            <section class="btnSection">
               <button class="listBtn styleHoverShadow" onClick="location.href='/community.do'">목록</button>
            </section>
            
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
		                    <button class="modBtn" @click="fnGoModify()">수정</button>
		                    <button class="delBtn" @click="fnRemove()">삭제</button>
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
//자바 스크립트 입력
var communityView = new Vue({
	el: '#communityView',
	data: {
		list : []
		, info : {}
		, commentInfo : {
			boardNo : "${map.boardNo}",
			userId : "${sessionId}",
			comment : ""
		}
		, boardNo : "${map.boardNo}"
		, sessionId: "${sessionId}"    
		, sessionStatus : "${sessionStatus}"
		, sessionNick : "${sessionNick}"    
	}
	, methods: {
		// 커뮤니티 글 상세
		fnGetInfo : function(){
			var self = this;
			var nparmap = {boardNo : self.boardNo};
			$.ajax({
				url:"/community/view.dox",
				dataType:"json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.info = data.info[0];
					console.log("글 데이터는");
					console.log(data.info);
				}
			});
		}
		// 댓글 리스트
		,fnCommentList : function(){
			var self = this;
			var nparmap = {boardNo : self.boardNo};
			$.ajax({
				url:"/community/commentList.dox",
				dataType:"json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					console.log("댓글 리스트는");
					console.log(data.list);
				}
			});
		}
		// 커뮤니티 글 삭제
		, fnRemove : function() {
			var self = this;
			var nparmap = {boardNo : self.boardNo};
			$.ajax({
				url:"/community/remove.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) { 
					if (!confirm("삭제하시겠습니까?")) return;
					location.href="/community.do";
				}
			}); 
		}
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			console.log(pageNum);
			console.log(startNum);
			var nparmap = {startNum : startNum};
			$.ajax({
				url : "/community/list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
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
		// 커뮤니티 글쓰기
		, fnAddCom: function() {
			var self = this;
			if (self.sessionId == "") {
				if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {            				
					location.href="/login.do"
					return;
				} else return;
			}
			location.href = "/community/edit.do";
		}
		// 글 수정 페이지로 가기
		, fnGoModify: function() {
			var self = this;
			self.pageChange("/community/edit.do", {boardNo : self.boardNo});            		
		}
		// 댓글 등록하기
		, fnCommentEnroll : function() {
			var self = this;
			if (self.sessionId == "") {
				if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){            				
					location.href="/login.do";  
					return;
				} else return;
			}
			var nparmap = self.commentInfo;
			$.ajax({
				url:"/community/commentSave.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) {  
					console.log(data);
					alert("등록되었습니다!");
					self.fnCommentList();
					self.commentInfo.comment = "";
				}
			}); 
		}
		// 댓글 삭제하기
		, fncommentDel : function(commentNo) {
			var self = this;
			if (!confirm("삭제하시겠습니까?")) return;
			var nparmap = {commentNo : commentNo};
			$.ajax({
				url:"/community/commentRemove.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) { 
					alert("댓글이 삭제되었습니다.");
					self.fnCommentList();
				}
			}); 
		}
		, fnOpenFile : function() {
			var self = this;
			console.log(self.info.filePath);
			location.href = self.info.filePath;
		}
	}
	, created: function () {
		var self = this;
		console.log(self.sessionNick);
		console.log(self.boardNo);
		self.fnGetInfo();
		self.fnCommentList();
	}
});
</script>
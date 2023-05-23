<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


<link rel="stylesheet" href="/css/pageStyle/depth5_qna.css">

<!-- pageContent -- START -->
<div id="pageContent" class="qna typeView">
	<div class="wrapper">
		<div id="qnaView" class="qnaViewContainer">
            <section class="boardSection typeBoxArea styleBoxRound typeMore styleBoxShadow">
                <div class="headArea">
	                <div class="titleBox">
	                	<h3 class="title"><i class="fa-solid fa-q">.</i> {{info.title}}</h3>
                        <span class="hits"><i class="fa-solid fa-eye"></i> {{info.hits}}</span>
	                </div>
                    <div class="infoBox">
                        <span class="user"><i class="fa-solid fa-user"></i> {{info.nick}}</span>
                        <span class="date"><i class="fa-regular fa-calendar"></i> {{info.cdatetime}} <span>(최근 수정 : {{info.udatetime}})</span></span>
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
                    <button class="delBtn" @click="fncommentDel(item.commentNo)">삭제</button>
                </div>
            </section>
            
            <template>
	            <section v-if="info.category == '1'" class="commentSection typeBoxArea styleBoxRound typeMore styleBoxShadow">
		            <div class="headArea">
		            	<h3 class="title"><i class="fa-solid fa-a">.</i> 답변</h3>
		            </div>
		            <div v-if="list.length == 0" class="commentArea commentNull">관리자가 확인 후 답변드리겠습니다.</div>
	                <div v-else class="commentArea commentList">
		                <div class="commentItem" v-for="(item, index) in list">
		                    <div class="commentContent"> <!-- 댓글내용 -->
		                        <pre id="coContent">{{item.comment}}</pre>
		                    </div>
		                    <div class="commenter"> <!-- 댓글작성자 댓글작성일 정보영역 -->
		                        <div class="infoBox"><!-- <i class="fa-solid fa-user"></i><span> 똑똑</span> --><span class="date">답변일 : {{item.cdatetime}}</span></div>
								<div class="btnBox">
	                          		<button v-if="sessionStatus=='A'" @click="fncommentDel(item.commentNo)">삭제</button>
								</div>
		                    </div>
		                </div>
	                </div>
	                <template>
		                <div v-if="sessionStatus=='A'" class="commentAdd">
		                    <textarea rows="2" placeholder="관리자님, 문의 답글을 달아주세요." v-model="commentInfo.comment"></textarea>
		                    <button class="styleHoverShadow" @click="fnCommentEnroll()">댓글등록</button>
		                </div>
		            </template>
	            </section>
            </template>
            
            <section class="btnSection">
               <button class="listBtn styleHoverShadow" onClick="location.href='/qna.do'">목록</button>
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
var qnaView = new Vue({
    el: '#qnaView',
    data: {
        list : []
        , length : 0
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
        fnGetInfo : function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"/qna/view.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                    console.log("글 데이터는");
                    console.log(data.info);
                    self.info = data.info;
                }
            });
        }
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
                    self.length = data.list.length;
                    console.log(self.list.length);
                    console.log("댓글 리스트는");
                    console.log(data.list);
                }
            });
        }
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
                    location.href="/qna.do";
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
        , fnGoModify: function() {
            var self = this;
            self.pageChange("/qna/edit.do", {boardNo : self.boardNo});            		
        }
        , fnCommentEnroll : function() {
            var self = this;
            if (self.sessionId == "") {
                if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){            				
                    location.href="/login.do";    		
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
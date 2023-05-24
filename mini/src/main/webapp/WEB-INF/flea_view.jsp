<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth2_flea.css">
<style>
	.aa{margin-left:40px;}
</style>
<!-- pageContent -- START -->
<div id="pageContent" class="flea typeView">
	<div class="wrapper">
		<div id="fleaView" class="fleaViewContainer">
            <section class="board_section typeBoxArea styleBoxRound typeMore styleBoxShadow">
                <div class="head_area">
	                <div class="title_box">
	                	<h3 class="title"><span class="sale_flg" id="sale_flg">{{info.boardKind2}}</span> {{info.title}}</h3>
                        <span class="hits"><i class="fa-solid fa-eye"></i> {{info.hits}}</span>
	                </div>
                    <div class="info_box">
                        <span class="user"><i class="fa-solid fa-user"></i> {{info.nick}}</span>
                        <span class="date"><i class="fa-regular fa-calendar"></i> {{info.cdatetime2}}</span>
                    </div>
                </div>
                <div class="content_area">
                    <div class="img_box" v-for="(item, index) in imgList">
                        <img :src="item.filePath">
                    </div>
                    <div class="txt_box">
                    	<pre v-html="info.content"></pre>
                    </div>
                </div>
                <div class="btn_area" v-if="sessionId == info.userId || sessionStatus == 'A'">
                    <button class="fnsBtn" @click="fnFinishTrade">거래완료</button>
                    <div>
	                    <button class="modBtn" @click="fnEditFlea(boardNo)">수정</button>
	                    <button class="delBtn" @click="fnDeletePost">삭제</button>
                    </div>
                </div>
            </section>
            <section class="comment_section">
	            <div class="head_area typeBoxArea">
	            	<h3 class="head"><i class="fa-solid fa-comments"></i> 댓글 </h3><span class="comm_cnt" style="color:red;">({{commentCnt}})</span>
	            </div>
	            <div v-if="list.length == 0" class="comment_area comment_null typeBoxArea styleBoxRound styleBoxShadow">등록된 댓글이 없습니다.</div>
                <div v-else class="comment_area comment_list typeBoxArea styleBoxRound typeMore styleBoxShadow">
	                <!-- 댓글 출력 영역 commentNo와 commentReno가 같으면 출력 -->
	                <div  class="comment_item" v-for="(item, index) in list">
		                <div v-if="item.commentNo == item.commentReno">
		                    <div class="commenter"> <!-- 댓글작성자 댓글작성일 정보영역 -->
		                        <div class="info_box"><i class="fa-solid fa-user"></i><span> {{item.nick}}</span><span class="date">({{item.cdatetime2}})</span></div>
								<div class="btn_box">
									<button @click="fnDeleteComment(item.commentNo)" v-if="sessionId == item.userId || sessionStatus == 'A' || sessionId == info.userId">삭제</button>
									<button @click="fnEditComment(item)" v-if="sessionId == item.userId || sessionStatus == 'A'">수정</button>
									<button @click="fnRecommentBtn(item)" v-if="sessionId == item.userId || sessionStatus == 'A' || sessionId == info.userId">답글달기</button>
								</div>
		                    </div>
		                    
		                    <div class="comment_content" v-if="editCoNo != item.commentNo"> <!-- 댓글내용 -->
		                        <pre id="coContent" v-if="sessionId == item.userId || sessionStatus == 'A' || sessionId == info.userId">{{item.content}}</pre>
		                        <pre v-else><i class="fa-solid fa-lock"></i> 비밀 댓글입니다.</pre>
		                    </div>
		                    <div class="comment_content" v-else> <!-- 댓글 수정버튼 영역 -->
		                        <textarea rows="5" v-model="commentInfo.content"></textarea>
								<div class="btn_box">
									<button @click="fnEditCommentFinish">수정</button>
									<button @click="fnEditCommentClose">취소</button>
								</div>
		                    </div>
		
		                    <div class="recoBtnArea" v-if="editReCoNo == item.commentNo">
								<!-- fnRecommentBtn 누르면 나오는 대댓글 작성 박스 -->
								<textarea placeholder="답글을 입력하세요." v-model="reContent"></textarea>
								<div class="btn_box">
									<button @click="fnWriteReComment(item.commentNo)">입력</button>
									<button @click="fnRecommentclose">취소</button>
								</div>
		                    </div>
		                </div>
		                <!-- 댓글 출력 영역 끝 -->
		
		                <!-- 대댓글 출력 영역 commentNo와 commentReno가 다르면 출력 -->
		                <div v-if="item.commentNo != item.commentReno" class="aa">
		                    <div v-if="sessionId == item.userId || sessionStatus == 'A' || sessionId == info.userId">
		                    	<div><i class="fa-solid fa-reply fa-rotate-180"></i></div>
		                        <div class="info_box"><i class="fa-solid fa-user"></i><span> {{item.nick}}</span><span class="date">({{item.cdatetime2}})</span></div>
								<div class="btn_box">
		                        	<button @click="fnDeleteReComment(item.commentNo)">삭제</button>
								</div>
		                        <pre class="comment_content">{{item.content}}</pre>
		                    </div>
		                    <div v-else style="margin-bottom:5px;">
		                   		 <div class="info_box"><i class="fa-solid fa-user"></i><span> {{item.nick}}</span><span class="date">({{item.cdatetime2}})</span></div>
		                    	<i class="fa-solid fa-lock"></i> 비밀 댓글입니다.
		                    </div>
		                </div>
	                <!-- 대댓글 출력 영역 끝 -->
	                </div>
                </div>
                <template>
	                <div v-if="sessionId != ''" class="comment_add">
	                	<!-- <div>{{item.nick}} : </div> -->
	                    <textarea rows="2" placeholder="댓글을 입력하세요." v-model="content"></textarea>
	                    <button @click="fnWriteComment">댓글등록</button>
	                </div>
	                <div v-else class="comment_add typeCant typeBoxArea styleBoxRound">
	                    <p><i class="fa-solid fa-user-slash"></i> 댓글은 로그인 후 작성이 가능합니다.</p>
	                </div>
	            </template>
            </section>
            
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
		                    <button class="fnsBtn" @click="fnFinishTrade">거래완료</button>
		                    <button class="modBtn" @click="fnEditFlea(boardNo)">수정</button>
		                    <button class="delBtn" @click="fnDeletePost">삭제</button>
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
var fleaView = new Vue({
    el: '#fleaView',
    data: {
        info: {}, // 게시글 정보
        list: [], // 댓글 리스트
        commentCnt : 0, //댓글 갯수
        imgList: [], //이미지리스트
        commentInfo: {}, // 댓글 수정용 정보
        boardNo: "${map.boardNo}",
        sessionId: "${sessionId}",
        sessionStatus: "${sessionStatus}",
        content: "", //댓글
        reContent: "", //대댓글
        editCoNo: "", //댓글트리거용
        editReCoNo: "" //대댓글트리거용
    },
    methods: {
        fnGetFlea: function () {
            var self = this;
            var nparmap = {
                boardNo: self.boardNo
            };
            $.ajax({
                url: "/fleamarket/view.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.info = data.info;
                    self.commentCnt = data.commentCnt;
                    self.imgList = data.imgList;
                    console.log(data.commentCnt);
                    console.log(data.info);
                    console.log(data.imgList);
                    self.fnGetFleaComment();
                }
            });
        }
        // 댓글 리스트
        , fnGetFleaComment: function () {
            var self = this;
            var nparmap = {
                boardNo: self.boardNo
            };
            $.ajax({
                url: "/fleamarket/comment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    console.log(data.list);
                }
            });
        }
        // 게시글 삭제            	
        , fnDeletePost: function () {
            var self = this;
            if (!confirm("게시글을 삭제하시겠습니까?")) {
                return;
            };
            var nparmap = {
                boardNo: self.boardNo
            };
            $.ajax({
                url: "/fleamarket/deleteFlea.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제완료");
                    location.href = "/flea.do"
                }
            });
        }
        // 게시글 수정
        , fnEditFlea: function (boardNo) {
            var self = this;
            self.pageChange("./edit.do", { boardNo: boardNo });
        }
        // 댓글입력
        , fnWriteComment: function () {
            var self = this;
            if (self.content == "") {
                alert("글을 입력하세요");
                return;
            }
            if (self.sessionId == "") {
                if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
                    location.href = "/login.do"
                    return;
                } else {
                    return;
                }
            }
            var nparmap = {
                boardNo: self.boardNo,
                sessionId: self.sessionId,
                content: self.content
            };
            $.ajax({
                url: "/fleamarket/addcomment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("등록 완료");
                    self.content = "";
                    self.fnGetFlea();
                }
            });
        }
        // 거래완료 버튼
        , fnFinishTrade: function () {
            var self = this;
            if (self.info.finishYn == "Y") {
                alert("이미 종료된 거래입니다");
                return;
            }
            console.log(self.info.hits);
            if (!confirm("거래를 완료하시겠습니까?")) {
                return;
            };
            var nparmap = {
                boardNo: self.boardNo
            };
            $.ajax({
                url: "/fleamarket/finishFlea.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("거래완료");
                    self.fnGetFlea();
                }
            });
        }
        // 댓글 삭제
        , fnDeleteComment: function (commentNo) {
            var self = this;
            if (!confirm("댓글을 삭제하시겠습니까?")) {
                return
            }
            var nparmap = { commentNo: commentNo };
            $.ajax({
                url: "/fleamarket/removecomment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제 완료");
                    self.fnGetFleaComment();
                }
            });

        }
        // 댓글 수정 활성
        , fnEditComment: function (item) {
            var self = this;
            self.editCoNo = item.commentNo;
            self.commentInfo = item;
            console.log(self.commentInfo);
        }
        // 댓글 수정 확인
        , fnEditCommentFinish: function () {
            var self = this;
            if (!confirm("댓글을 수정하시겠습니까?")) {
                return
            }
            var nparmap = self.commentInfo;
            $.ajax({
                url: "/fleamarket/editcomment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("수정완료");
                    self.editCoNo = "";
                    self.commentInfo = "";
                    self.fnGetFlea();
                }
            });

        }
        // 댓글 수정 취소버튼
        , fnEditCommentClose: function () {
            var self = this;
            self.editCoNo = "";
        }
        // 대댓글 할성 버튼
        , fnRecommentBtn: function (item) {
            var self = this;
            self.editReCoNo = item.commentNo;
            console.log(self.editReCoNo);
        }
        // 대댓글 활성 취소
        , fnRecommentclose: function () {
            var self = this;
            self.editReCoNo = "";
        }
        // 대댓글 작성
        , fnWriteReComment: function (commentNo) {
            var self = this;
            if (!self.reContent) {
            	alert("댓글을 입력하세요");
            	return;
            }
            var nparmap = {
                commentNo: commentNo,
                content: self.reContent,
                sessionId: self.sessionId,
                boardNo: self.boardNo
            };
            $.ajax({
                url: "/fleamarket/addrecomment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("등록완료");
                    self.editReCoNo = "";
                    self.reContent = "";
                    self.fnGetFleaComment();
                }
            });

        }
        // 대댓글 삭제
        , fnDeleteReComment: function (commentNo) {
            var self = this;
            if (!confirm("댓글을 삭제하시겠습니까?")) {
                return
            }
            var nparmap = { commentNo: commentNo };
            $.ajax({
                url: "/fleamarket/removerecomment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제완료");
                    self.fnGetFleaComment();
                }
            });
        }
        , pageChange: function (url, param) {
            var target = "_self";
            if (param == undefined) {
                //	this.linkCall(url);
                return;
            }
            var form = document.createElement("form");
            form.name = "dataform";
            form.action = url;
            form.method = "post";
            form.target = target;
            for (var name in param) {
                var item = name;
                var val = "";
                if (param[name] instanceof Object) {
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
    ,
    created: function () {
        var self = this;
        self.fnGetFlea();
    }
});
</script>
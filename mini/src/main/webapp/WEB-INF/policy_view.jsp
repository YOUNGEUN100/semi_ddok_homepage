<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth4_policy.css">

<!-- pageContent -- START -->
<div id="pageContent" class="policy typeView">
	<div class="wrapper">
		<div id="policyView" class="policyViewContainer">
            <section class="board_section typeBoxArea styleBoxRound typeMore styleBoxShadow">
                <div class="head_area">
	                <div class="title_box">
	                	<h3 class="title">{{info.title}}</h3>
	                </div>
                    <div class="info_box">
                        <span class="hits"><i class="fa-solid fa-eye"></i> {{info.hits}}</span>
                        <span class="date"><i class="fa-regular fa-calendar"></i> {{info.cdatetime}}</span>
                    </div>
                </div>
                <div class="content_area">
                    <div class="txt_box">
                    	<pre v-html="info.content"></pre>
                    </div>
                    <template>
		               <div class="file_box" v-if="info.filePath">
		               		<a class="attached" @click="fnOpenFile()">
		               			<i class="fa-solid fa-folder"></i> 첨부파일
		               		</a>
		               </div>
	               </template>
                </div>
            </section>
            <section class="btnSection">
               <button class="listBtn styleHoverShadow" onClick="location.href='/policy.do'">목록</button>
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
var policyView = new Vue({
    el: '#policyView',
    data: {
        list: []
        , info: {}
        , commentInfo: {
            boardNo: "${map.boardNo}",
            userId: "${sessionId}",
            comment: ""
        }
        , boardNo: "${map.boardNo}"
        , sessionId: "${sessionId}"
        , sessionStatus: "${sessionStatus}"
        , sessionNick: "${sessionNick}"
    }
    , methods: {
        // 댓글 글 상세
        fnGetInfo: function () {
            var self = this;
            var nparmap = { boardNo: self.boardNo };
            $.ajax({
                url: "/policy/view.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.info = data.info[0];
                    console.log("글 데이터는");
                    console.log(data.info);
                }
            });
        }
        // 댓글 리스트
        , fnCommentList: function () {
            var self = this;
            var nparmap = { boardNo: self.boardNo };
            $.ajax({
                url: "/policy/commentList.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    console.log("댓글 리스트는");
                    console.log(data.list);
                }
            });
        }
        //  글 삭제
        , fnRemove: function () {
            var self = this;
            var nparmap = { boardNo: self.boardNo };
            $.ajax({
                url: "/policy/remove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    if (!confirm("삭제하시겠습니까?")) return;

                    location.href = "/policy.do";
                }
            });
        }
        <!-- 페이징 추가 7-->
        , fnSearch: function (pageNum) {
            var self = this;
            self.selectPage = pageNum;
            var startNum = ((pageNum - 1) * 10);
            console.log(pageNum);
            console.log(startNum);
            var nparmap = { startNum: startNum };
            $.ajax({
                url: "/policy/list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 10);
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
        // 글 수정 페이지로 가기
        , fnGoModify: function () {
            var self = this;
            self.pageChange("/policy/edit.do", { boardNo: self.boardNo });
        }
        , fnOpenFile: function () {
            var self = this;
            console.log(self.info.filePath);
            window.open(self.info.filePath);
        }
    }
    , created: function () {
        var self = this;
        self.fnGetInfo();
    }
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth5_community.css">

<!-- pageContent -- START -->
<div id="pageContent" class="community">
	<div class="wrapper">
		<div id="communityList" class="communityListContainer">
			<section class="boardSection">
                <div class="boardInfo">
                	<div class="btnBox">
                		<button v-if="sessionStatus=='C'" class="writeBtn styleBoxShadow styleHoverShadow" @click="fnAddCom()">글쓰기</button>
                	</div>
					<select v-model="order" @change="fnChangeOrder()">
						<option value="" selected disabled>정렬</option>
						<option value="recent">최신순</option>
						<option value="view">조회수</option>
					</select>
                </div>
				<div class="boardArea">
				    <table>
			            <tr class="list_item styleBoxShadow styleHoverShadow" v-for="(item, index) in list" @click="fnViewCom(item.boardNo)">
							<template>
								<template v-if="item.status=='A'">
				                	<td class="notice admin">공지</td>
									<td class="title admin">
										{{item.title}} <i v-if="item.filePath" class="fa-solid fa-folder"></i><span v-if="item.cnt>0">[{{item.cnt}}]</span>
									</td>
								</template>
								<template v-if="item.status=='C'">
									<template v-if="item.userId==sessionId">
					                	<td class="notice myboard">내글</td>
										<td class="title myboard" v-if="item.userId==sessionId">
											{{item.title}} <i v-if="item.filePath" class="fa-solid fa-folder"></i><span v-if="item.cnt>0">[{{item.cnt}}]</span>
										</td>
									</template>
									<template v-else>
										<td class="notice"></td>
										<td class="title">{{item.title}} <i v-if="item.filePath" class="fa-solid fa-folder"></i><span v-if="item.cnt>0">[{{item.cnt}}]</span></td>
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
var communityList = new Vue({
    el: '#communityList',
    data: {
        list : [],
        cnt : 0,
        selectPage : 1,
        pageCount : 1,
        sessionId: "${sessionId}",
        sessionStatus : "${sessionStatus}",
        order : "recent"
    }
    , methods: {
        fnGetComList: function () {
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
            var nparmap = {startNum : startNum, order : self.order};
            console.log(self.order);
            $.ajax({
                url: "/community/list.dox",
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
            for (var i = 0; i < liList.length; i++) {
                liList.eq(i).removeClass("active");
            }
            liList.eq(1).addClass("active");
            self.fnSearch(1);
        }
        , fnSearch : function(pageNum){
            var self = this;
            self.selectPage = pageNum;
            var startNum = ((pageNum-1) * 10);
            console.log(startNum);
            var nparmap = {startNum : startNum, order : self.order};
            $.ajax({
                url : "/community/list.dox",
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
            self.pageChange("/community/view.do", {boardNo : boardNo});
        }
        , fnAddCom: function() {
            var self = this;
            if (self.sessionId == "") {
                if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
                    location.href = "/login.do"
                    return;
                } else {
                    return;
                }            
            }
            location.href = "/community/edit.do";
        }
    }
    , created: function () {
        var self = this;
        self.fnGetComList();
    }
});
</script>
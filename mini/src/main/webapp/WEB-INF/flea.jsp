<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth2_flea.css">

<!-- pageContent -- START -->
<div id="pageContent" class="flea">
	<div class="wrapper">
		<div id="fleaList" class="fleaListContainer">
			<section class="flea_category">
				<button class="category_btn typeTrade styleBoxRound styleBoxShadow active" id="category_btn">
			        <img src="/images/flea_icon01.png" alt="">
					<p>중고판매</p>
				</button>
				<button class="category_btn typeDonate styleBoxRound styleBoxShadow" id="category_btn2">
			        <img src="/images/flea_icon02.png" alt="">
					<p>중고나눔</p>
				</button>
			</section>
			<section class="flea_section typeTrade">
			    <div class="flea_title">
			        <h3 id="title">거래할 분을 찾고 있어요!</h3>
			        <select v-model="orderValue" @change="fnChangeOrder">
	                    <option value="recent">최신순</option>
	                    <option value="viewCnt">조회수</option>
			        </select>
			    </div>
				<div class="flea_list">
				    <table>
				        <thead>
				            <tr>
	                            <th class="sale_flg">상태</th>
	                            <th class="address">주소</th>
	                            <th class="title">제목</th>
	                            <th class="user">닉네임</th>
	                            <th class="date">등록일</th>
	                            <th class="viewCnt">조회수</th>
				            </tr>
				        </thead>
				        <tbody>
	                        <tr class="styleBoxShadow styleHoverShadow" v-for="(item, index) in list" @click="fnViewFlea(item.boardNo)">
					        	<template v-if="item.boardKind=='T_LAN'">
				                    <td class="sale_flg" v-if="item.finishYn=='N'">{{item.boardKind2}}</td>
				                    <td class="sale_flg disabled" v-else>{{item.boardKind2}}</td>
				                    <td class="address">{{item.addr}}</td>
				                    <td class="title">{{item.title}} <span>[{{item.commentCnt}}]</span></td>
				                    <td class="user">{{item.nick}}</td>
				                    <td class="date">{{item.cdatetime2}}</td>
				                    <td class="viewCnt">{{item.hits}}</td>
					            </template>
				            </tr>
				        </tbody>
				    </table>
				    <template>
				        <paginate id="page" :page-count="pageCount" :page-range="3" :margin-pages="2"
				            :click-handler="fnSearch" :prev-text="'<'" :next-text="'>'"
				            :container-class="'pagination'" :page-class="'page-item'" style="display:none;">
				        </paginate>
				    </template>
	                <div class="flea_write"><button class="writeBtn styleBoxShadow styleHoverShadow" @click="fnAddFlea">글쓰기</button></div>
				</div>
				<div class="open_more">
				    <button id="moreBtn" class="styleHoverShadow" @click="fnShowMore">더보기</button>
				</div>
			</section>
			
			<section class="flea_section typeDonate">
			    <div class="flea_title">
			        <h3 id="title">나눔할 분을 찾고 있어요!</h3>
                    <select v-model="orderValue2" @change="fnChangeOrder2">
                        <option value="recent">최신순</option>
                        <option value="viewCnt">조회수</option>
                    </select>
			    </div>
			    <div class="flea_list">
	                <table>
	                    <thead>
	                        <tr>
	                            <th class="sale_flg">상태</th>
	                            <th class="address">주소</th>
	                            <th class="title">제목</th>
	                            <th class="user">닉네임</th>
	                            <th class="date">등록일</th>
	                            <th class="viewCnt">조회수</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr class="styleBoxShadow styleHoverShadow" v-for="(item, index) in list2" @click="fnViewFlea(item.boardNo)">
		                    	<template v-if="item.boardKind=='D_LAN'">
	                                <td class="sale_flg" v-if="item.finishYn=='N'">{{item.boardKind2}}</td>
	                                <td class="sale_flg disabled" v-else>{{item.boardKind2}}</td>
	                                <td class="address">{{item.addr}}</td>
	                                <td class="title">{{item.title}} <span>[{{item.commentCnt}}]</span></td>
	                                <td class="user">{{item.nick}}</td>
	                                <td class="date">{{item.cdatetime2}}</td>
	                                <td class="viewCnt">{{item.hits}}</td>
		                        </template>
	                        </tr>
	                    </tbody>
	                </table>
	                <template>
	                    <paginate id="page2" :page-count="pageCount2" :page-range="3" :margin-pages="2"
	                        :click-handler="fnSearch2" :prev-text="'<'" :next-text="'>'"
	                        :container-class="'pagination2 styleRed'" :page-class="'page-item'" style="display:none;">
	                    </paginate>
	                </template>
	                <div class="flea_write"><button class="writeBtn styleBoxShadow styleHoverShadow" @click="fnAddFlea">글쓰기</button></div>
	            </div>
	
	            <div class="open_more">
	                <button id="moreBtn2" class="styleHoverShadow" @click="fnShowMore2">더보기</button>
	            </div>
			</section>
			
			<!-- adminCtrlBox -- Don't touch -->
 			<!-- <template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
						</div>
					</div>
				</div>
			</template> -->
			<!-- adminCtrlBox -- Don't touch -->
        </div>
    </div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
//거래게시판으로 스크롤 이동
$(function () {
    $("#category_btn").on("click", function () {
        var offset = $(".flea_section.typeTrade").offset();
        offset.top -= 150
        $("html, body").animate({ scrollTop: offset.top }, 400);
        console.log(offset);
    })
})
//나눔게시판으로 스크롤 이동
$(function () {
    $("#category_btn2").on("click", function () {
        var offset = $(".flea_section.typeDonate").offset();
        offset.top -= 150
        $("html, body").animate({ scrollTop: offset.top }, 400);
        console.log(offset);
    })
})
<!-- 페이징 추가 4-->
Vue.component('paginate', VuejsPaginate)
var fleaList = new Vue({
    el: '#fleaList',
    data: {
        list: [],
        list2: [],
        finish: "",
        finish2: "",
        moreBtn: "off",
        moreBtn2: "off",
        orderValue: "recent",
        orderValue2: "recent",
        sessionId: "${sessionId}",
        //<!-- 페이징 추가 5-->
        selectPage: 1,
        pageCount: 1,
        remainNum: 0,
        cnt: 0,
        selectPage2: 1,
        pageCount2: 1,
        cnt2: 0,
    }
    , methods: {
        fnGetFleaList: function () {
            var self = this;
            // <!-- 페이징 추가 6-->     		
            var startNum = ((self.selectPage - 1) * 10);
            var nparmap = { moreBtn: self.moreBtn, orderValue: self.orderValue, startNum: startNum};
            $.ajax({
                url: "/fleamarket/list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    console.log(data.list);
                    self.list = data.list;
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 10);
                    self.remainNum = data.cnt % 10;
                    console.log("게시글 수 : " + data.cnt);
                    console.log("나머지 게시글 : " + self.remainNum);
                    console.log("총 페이지수 : " + self.pageCount);
                    console.log("현재 페이지 : " + self.selectPage);
                }
            });
        }
        , fnGetFleaList2: function () {
            var self = this;
            // <!-- 페이징 추가 6-->     		
            var startNum = ((self.selectPage - 1) * 10);
            var nparmap = { moreBtn2: self.moreBtn2, orderValue2: self.orderValue2, startNum: startNum };
            $.ajax({
                url: "/fleamarket/list2.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    console.log(data.list);
                    self.list2 = data.list;
                    self.cnt2 = data.cnt2;
                    self.pageCount2 = Math.ceil(self.cnt2 / 10);
                }
            });
        }
        <!--페이징 추가 7-->
        , fnSearch: function (pageNum) {
            var self = this;
            self.selectPage = pageNum;
            var startNum = ((pageNum - 1) * 10);
            var nparmap = { moreBtn: self.moreBtn, orderValue: self.orderValue, startNum: startNum};
            $.ajax({
                url: "/fleamarket/list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    self.cnt = data.cnt;
                    console.log("현재 페이지수 =="+self.selectPage);
                    self.pageCount = Math.ceil(self.cnt / 10);
                    
                }
            });
        }
        <!--페이징 추가 7-->
        , fnSearch2: function (pageNum) {
	        var self = this;
	        self.selectPage2 = pageNum;
	        var startNum = ((pageNum - 1) * 10);
	        var nparmap = { moreBtn2: self.moreBtn2, orderValue2: self.orderValue2, startNum: startNum };
	        $.ajax({
	            url: "/fleamarket/list2.dox",
	            dataType: "json",
	            type: "POST",
	            data: nparmap,
	            success: function (data) {
	                self.list2 = data.list;
	                self.cnt2 = data.cnt2;
	                self.pageCount2 = Math.ceil(self.cnt2 / 10);
	            }
	        });
	    }
        // 거래글 더보기 버튼
        , fnShowMore: function () {
		    var self = this;
		    if (self.moreBtn == "off") {
		        document.getElementById('page').style.display = 'flex';
		        self.moreBtn = "on"
		        self.fnGetFleaList();
		        moreBtn.innerText = "접기";
		    } else if (self.moreBtn == "on") {
		        document.getElementById('page').style.display = 'none';
		        var liList = $(".pagination").children();
		        for (var i = 0; i < liList.length; i++) {
		            liList.eq(i).removeClass("active");
		        }
		        liList.eq(1).addClass("active");
		        self.fnSearch(1);
//  		        self.selectPage = 1;
//  		            self.pageCount = 1;
//  		            self.cnt = 0;
		        self.moreBtn = "off"
		        self.fnGetFleaList();
		        moreBtn.innerText = "더보기";
		    }
		}
	    // 나눔글 더보기 버튼
	    , fnShowMore2: function () {
	        var self = this;
	        if (self.moreBtn2 == "off") {
	            document.getElementById('page2').style.display = 'flex';
	            self.moreBtn2 = "on";
	            self.fnGetFleaList2();
	            moreBtn2.innerText = "접기";
	        } else if (self.moreBtn2 == "on") {
	            document.getElementById('page2').style.display = 'none';
		        var liList = $(".pagination2").children();
		        for (var i = 0; i < liList.length; i++) {
		            liList.eq(i).removeClass("active");
		        }
		        liList.eq(1).addClass("active");
		        self.fnSearch2(1);
//  		        self.selectPage2 = 1;
//  	            self.pageCount2 = 1;
//  	            self.cnt2 = 0;
	            self.moreBtn2 = "off";
	            self.fnGetFleaList2();
	            moreBtn2.innerText = "더보기";
	        }
	    }
	    // 거래글 카테고리 변경
	    , fnChangeOrder: function () {
	        var self = this;
	        var liList = $(".pagination").children();
	        for (var i = 0; i < liList.length; i++) {
	            liList.eq(i).removeClass("active");
	        }
	        liList.eq(1).addClass("active");
	        self.fnSearch(1);
// 	        self.selectPage = 1;
//  	       	self.pageCount = 1;
//             self.cnt = 0;  
          	self.fnGetFleaList();
            
	    }
	    // 나눔글 카테고리 변경
	    , fnChangeOrder2: function () {
	        var self = this;
	        var liList = $(".pagination2").children();
	        for (var i = 0; i < liList.length; i++) {
	            liList.eq(i).removeClass("active");
	        }
	        liList.eq(1).addClass("active");
	        self.fnSearch2(1);
//  	        self.selectPage2 = 1;
//              self.pageCount2 = 1;
//              self.cnt2 = 0;
             self.fnGetFleaList2();
	    }
	    // 랜선장터 글 보기
	    , fnViewFlea: function (boardNo) {
	        var self = this;
	        self.pageChange("./flea/view.do", { boardNo: boardNo });
	    }
	    // 랜선장터 글 쓰기
	    , fnAddFlea: function () {
	        var self = this;
	        if (self.sessionId == "") {
	            if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
	                location.href = "/login.do"
	                return;
	            } else {
	                return;
	            }
	        }
	        location.href = "/flea/edit.do";
	    }
	    , pageChange : function (url, param) {
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
    , created: function () {
	    var self = this;
	    self.fnGetFleaList();
	    self.fnGetFleaList2();
	}
});
</script>
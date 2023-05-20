<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


    <style>
        /* style START */
		
        .container {
            width: 1200px;
            height: 100%;
            position: relative;
            margin: auto;
        }
        
        table {}

        table,
        td,
        th {
            /* border: 1px dotted black; */
            border-collapse: collapse;
            padding: 16px;
            table-layout: fixed;
            text-align:center;
        }
        
        th {
        	border-bottom: 1px solid #999999;
        }
        
        

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .board_title h1 {
            display: inline-block;
        }

        select {
            width: 80px;
            float: right;
            background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99761B495C84AA8716') no-repeat 95% 50%;
            padding: .8em .5em;
            border: none;
            border-radius: 0px;
            appearance: none;
        }

        .box2 {
            width: 1200px;
            margin: auto;
            margin-top: 70px;
        }

        .market_category {
            width: 1200px;
            text-align: center;
        }

        .category_btn {
            font-size: 20px;
            font-weight: bold;
            margin: 16px;
            width: 110px;
            height: 50px;
            border: none;
            border-radius: 50px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            background-color: white;
            
        }

        .purchase_list {
            border: none;
            box-sizing: border-box;
            padding: 40px 40px;
            width: 1200px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .donate_list {
            border: none;
            box-sizing: border-box;
            padding: 40px 40px;
            width: 1200px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }
        .sale_flg { 
        	width : 120px;
        }
        
        .address {
        	width : 180px;
        }
        
        .title {
        	cursor : pointer;
        	width : 480px;;
        	text-align:left;
        	overflow : hidden;
        	text-overflow: ellipsis;
        	white-space  : nowrap;
        }
        
        .id {
        	width : 120px;
        }
        
        .date {
        	width : 180px;
        }
        
        .viewCnt {
        	width : 10%;
        }
        
        .writeBtn {
        	margin-top : 16px;
        	margin-bottom : -15px;
        	display : flex;
        	justify-content: flex-end;
        }
        
        .writeBtn button {
        	border: none;
            width: 100px;
            height: 40px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            cursor : pointer;
        }

        .open_detail {
            text-align: center;
            margin-top: 60px;
        }

        .open_detail button {
            border: none;
            width: 200px;
            height: 60px;
            border-radius: 20px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
            cursor : pointer;            
        }
		

        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

                <div class="container">
                    <div class="market_category">
                        <button class="category_btn" id="category_btn">중고판매</button>
                        <button class="category_btn" id="category_btn2">중고나눔</button>
                    </div>

                    <div class="box1">

                        <div class="board_title">
                            <h1 id="tradeHeader">거래할 분을 찾고 있어요!</h1>
                            <select v-model="orderValue" @change="fnChangeOrder">
                                <option value = "recent">최신순</option>
                                <option value = "viewCnt">조회수</option>
                            </select>
                        </div>

                        <div class="purchase_list">
                            <table>                            
                            	<thead>
                            		<tr>
                            			<th>상태</th>
                            			<th>주소</th>
                            			<th>제목</th>
                            			<th>닉네임</th>
                            			<th>등록일</th>
                            			<th>조회수</th>
                            		</tr>
                            	</thead>
                            
                            	<tbody>
	                            	<tr v-for="(item, index) in list">
    	                                <template v-if="item.boardKind=='T_LAN'">
        	                                <td class="sale_flg" v-if="item.finishYn=='N'" style="color : #5ea152">{{item.boardKind2}}</td>                                            
            	                            <td class="sale_flg" v-else>{{item.boardKind2}}</td>
                	                        <td class="address">{{item.addr}}</td>
                    	                    <td class="title" @click="fnViewFlea(item.boardNo)">{{item.title}}</td>
                        	                <td class="id">{{item.nick}}</td>
                            	            <td class="date">{{item.cdatetime2}}</td>
                                	        <td class="viewCnt">{{item.hits}}</td>
                                    	</template> 
	                                </tr>                                 
    	                        </tbody>        	                       
                            </table>
                            <!-- 페이징 추가 3-->
							<template>
								<paginate id="page"
											:page-count="pageCount"
											:page-range="3"
											:margin-pages="2"
											:click-handler="fnSearch"
											:prev-text="'<'"
											:next-text="'>'"
											:container-class="'pagination'"
											:page-class="'page-item'" style="display:none;">
								</paginate>
							</template>
							<!-- 3끝 -->
                            <div class="writeBtn"><button @click="fnAddFlea">글쓰기</button></div>
                        </div>

                        <div class="open_detail">
                            <button id="moreBtn" @click="fnShowMore">더보기</button>
                        </div>

                    </div>

                    <div class="box2">

                        <div class="board_title">
                            <h1 id="donateHeader">나눔할 분을 찾고 있어요!</h1>
                            <select v-model = "orderValue2" @change = "fnChangeOrder2">
                                <option value = "recent">최신순</option>
                                <option value = "viewCnt">조회수</option>
                            </select>
                        </div>

                        <div class="donate_list">
                            <table>
                            	<thead>
                            		<tr>
                            			<th>상태</th>
                            			<th>주소</th>
                            			<th>제목</th>
                            			<th>닉네임</th>
                            			<th>등록일</th>
                            			<th>조회수</th>
                            		</tr>
                            	</thead>
                            	<tbody>
                            		<tr v-for="(item, index) in list2">
                                    	<template v-if="item.boardKind=='D_LAN'">
                                        	<td class="sale_flg" v-if="item.finishYn=='N'" style="color : #5ea152">{{item.boardKind2}}</td>                                            
                                        	<td class="sale_flg" v-else>{{item.boardKind2}}</td>
                                        	<td class="address">{{item.addr}}</td>
                                        	<td class="title" @click="fnViewFlea(item.boardNo)">{{item.title}}</td>
                                        	<td class="id">{{item.nick}}</td>
                                        	<td class="date">{{item.cdatetime2}}</td>
                                        	<td class="viewCnt">{{item.hits}}</td>
                                    	</template>
                                	</tr>
                            	</tbody>                                
                            </table>
                            <!-- 페이징 추가 3-->
							<template>
								<paginate id="page2"
											:page-count="pageCount2"
											:page-range="3"
											:margin-pages="2"
											:click-handler="fnSearch2"
											:prev-text="'<'"
											:next-text="'>'"
											:container-class="'pagination2'"
											:page-class="'page-item'" style="display:none;">
								</paginate>
							</template>
							<!-- 3끝 -->                           
                            <div class="writeBtn"><button @click="fnAddFlea">글쓰기</button></div>
                        </div>

                        <div class="open_detail">
                            <button id="moreBtn2" @click="fnShowMore2">더보기</button>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">
    //거래게시판으로 스크롤 이동
    $(function() {
        $("#category_btn").on("click",function(){
        	var offset = $("#tradeHeader").offset();
        	offset.top -=150
        	$("html, body").animate({scrollTop: offset.top},400);
            console.log(offset);
        })
    })
    //나눔게시판으로 스크롤 이동
    $(function() {
        $("#category_btn2").on("click",function(){
        	var offset = $("#donateHeader").offset();
        	offset.top -=150
        	$("html, body").animate({scrollTop: offset.top},400);
            console.log(offset);
        })
    })
    
    	<!-- 페이징 추가 4-->
    	Vue.component('paginate', VuejsPaginate)
        var app = new Vue({
            el: '#app',
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
        		cnt : 0,
        		selectPage2: 1,
        		pageCount2: 1,
        		cnt2 : 0,
        		//<!-- 5-->
            }
            , methods: {
                fnGetFleaList: function () {
                    var self = this;
                 	// <!-- 페이징 추가 6-->     		
            		var startNum = ((self.selectPage-1) * 10);
            		var nparmap = {moreBtn : self.moreBtn, orderValue : self.orderValue, startNum : startNum};
            		// <!--  6-->
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

                        }
                    });
                }
            
            	, fnGetFleaList2: function () {
                    var self = this;
                 	// <!-- 페이징 추가 6-->     		
            		var startNum = ((self.selectPage-1) * 10);
                    var nparmap = {moreBtn2 : self.moreBtn2, orderValue2 : self.orderValue2, startNum : startNum};
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
            	
            	<!-- 페이징 추가 7-->
        		, fnSearch : function(pageNum){
        			var self = this;
        			self.selectPage = pageNum;
        			var startNum = ((pageNum-1) * 10);
        			var nparmap = {moreBtn : self.moreBtn, orderValue : self.orderValue, startNum : startNum};
        			$.ajax({
        				url : "/fleamarket/list.dox",
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
        		<!--  7-->
        		
        		<!-- 페이징 추가 7-->
        		, fnSearch2 : function(pageNum){
        			var self = this;
        			self.selectPage2 = pageNum;
        			var startNum = ((pageNum-1) * 10);
        			var nparmap = {moreBtn2 : self.moreBtn2, orderValue2 : self.orderValue2, startNum : startNum};
        			$.ajax({
        				url : "/fleamarket/list2.dox",
        				dataType : "json",
        				type : "POST",
        				data : nparmap,
        				success : function(data) {
        					self.list2 = data.list;
        					self.cnt2 = data.cnt2;
        					self.pageCount2 = Math.ceil(self.cnt2 / 10);
        				}
        			});
        		}
        		<!--  7-->
        		
            	// 거래글 더보기 버튼
            	, fnShowMore: function() {
            	    var self = this;
            	    if (self.moreBtn == "off") {
            	        document.getElementById('page').style.display = 'flex';  
            	        self.moreBtn = "on"
            	        self.fnGetFleaList();
            	        moreBtn.innerText = "접기";
            	    } else if (self.moreBtn == "on") {
            	        document.getElementById('page').style.display = 'none';    
            	        self.moreBtn = "off"
            	        self.fnGetFleaList();
            	        moreBtn.innerText = "더보기";
            	    }
            	}
            	
            	// 나눔글 더보기 버튼
            	, fnShowMore2: function() {
            		var self = this;
                    if (self.moreBtn2 == "off") {
                    	document.getElementById('page2').style.display = 'flex';  
                    	self.moreBtn2 = "on";
                    	self.fnGetFleaList2();
                    	moreBtn2.innerText = "접기";
                    } else if (self.moreBtn2 == "on") {
                    	document.getElementById('page2').style.display = 'none';  
                    	self.moreBtn2 = "off";
                        self.fnGetFleaList2();
                        moreBtn2.innerText = "더보기";
                    }
            	}
            	
            	// 거래글 카테고리 변경
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
                    self.fnGetFleaList();
                }
            	
            	// 나눔글 카테고리 변경
            	, fnChangeOrder2: function () {
                    var self = this;
                    var liList = $(".pagination2").children();
                    for(var i=0; i<liList.length; i++){
                    	liList.eq(i).removeClass("active");
                    }
                    liList.eq(1).addClass("active");
                    self.selectPage2 = 1,
            		self.pageCount2 = 1,
            		self.cnt2 = 0,
                    self.fnGetFleaList2();
                }
            	
            	// 랜선장터 글 보기
            	, fnViewFlea: function(boardNo) {
            		var self = this;
            		self.pageChange("./flea/view.do", {boardNo : boardNo});            		
            	}
            	
            	// 랜선장터 글 쓰기
            	, fnAddFlea: function() {
            		var self = this;
            		if (self.sessionId == "") {
            			if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {            				
            				location.href="/login.do"
            				return;
            			} else {
            				return;
            			}            			
            		}
            		location.href = "/flea/edit.do";
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


            }
            , created: function () {
            	var self = this;
                self.fnGetFleaList();
                self.fnGetFleaList2();
            }
        });
    </script>
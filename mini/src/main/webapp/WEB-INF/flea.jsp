<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

    <style>
        /* style START */
        /* * {
            border: 1px dotted rgb(223, 60, 141);
        } */

        .container {
            width: 1200px;
            height: 100%;
            position: relative;
            margin: auto;
        }
        
        table {
        width : 100%;}

        table,
        td,
        th {
            border: 1px dotted black;
            border-collapse: collapse;
            padding: 16px;
            table-layout: fixed;
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
        
        #title {
        	cursor : pointer;
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
                        <button class="category_btn">중고판매</button>
                        <button class="category_btn">중고나눔</button>
                    </div>

                    <div class="box1">

                        <div class="board_title">
                            <h1>거래할 분을 찾고 있어요!</h1>
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
        	                                <td id="sale_flg" v-if="item.finishYn=='N'" style="color : #5ea152">{{item.finish}}</td>                                            
            	                            <td id="sale_flg" v-else>{{item.finish}}</td>
                	                        <td id="address">{{item.addr}}</td>
                    	                    <td id="title" @click="fnViewFlea(item.boardNo)">{{item.title}}</td>
                        	                <td id="id">{{item.nick}}</td>
                            	            <td id="date">{{item.cdatetime2}}</td>
                                	        <td id="viewCnt">{{item.hits}}</td>
                                    	</template> 
	                                </tr>                                 
    	                        </tbody>        	                       
                            </table>
                            <div class="writeBtn"><button>글쓰기</button></div>
                        </div>

                        <div class="open_detail">
                            <button id="moreBtn" @click="fnShowMore">더보기</button>
                        </div>

                    </div>

                    <div class="box2">

                        <div class="board_title">
                            <h1>나눔할 분을 찾고 있어요!</h1>
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
                                        	<td id="sale_flg" v-if="item.finishYn=='N'" style="color : #5ea152">{{item.finish2}}</td>                                            
                                        	<td id="sale_flg" v-else>{{item.finish2}}</td>
                                        	<td id="address">{{item.addr}}</td>
                                        	<td id="title" @click="fnViewFlea(item.boardNo)">{{item.title}}</td>
                                        	<td id="id">{{item.nick}}</td>
                                        	<td id="date">{{item.cdatetime2}}</td>
                                        	<td id="viewCnt">{{item.hits}}</td>
                                    	</template>
                                	</tr>
                            	</tbody>                                
                            </table>                            
                            <div class="writeBtn"><button>글쓰기</button></div>
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
                orderValue2: "recent"
            }
            , methods: {
                fnGetFleaList: function () {
                    var self = this;
                    var nparmap = {moreBtn : self.moreBtn, orderValue : self.orderValue};
                    $.ajax({
                        url: "/fleamarket/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.list = data.list;
                            
                            for (var i = 0; i < self.list.length; i++) {
                                if (self.list[i].finishYn == 'N') {
                                    self.list[i].finish = '판매중';                                    
                                } else if (self.list[i].finishYn == 'Y') {
                                    self.list[i].finish = '판매완료';                                    
                                }
                            }
                            console.log(data.list);
                        }
                    });
                }
            
            	, fnGetFleaList2: function () {
                    var self = this;
                    var nparmap = {moreBtn2 : self.moreBtn2, orderValue2 : self.orderValue2};
                    $.ajax({
                        url: "/fleamarket/list2.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.list2 = data.list;
                            
                            for (var i = 0; i < self.list2.length; i++) {
                                if (self.list2[i].finishYn == 'N') {                                    
                                    self.list2[i].finish2 = '나눔중';
                                } else if (self.list2[i].finishYn == 'Y') {                                    
                                    self.list2[i].finish2 = '나눔완료';
                                }
                            }
                            console.log(data.list);
                        }
                    });
                }
            	
            	// 거래글 더보기 버튼
            	, fnShowMore: function() {
            		var self = this;
                    if (self.moreBtn == "off") {
                    	self.moreBtn = "on"
                    	self.fnGetFleaList();
                    	moreBtn.innerHTML = "접기";
                    } else if (self.moreBtn == "on") {
                    	self.moreBtn = "off"
                        self.fnGetFleaList();
                        moreBtn.innerHTML = "더보기";
                    }
            	}
            	
            	// 나눔글 더보기 버튼
            	, fnShowMore2: function() {
            		var self = this;
                    if (self.moreBtn2 == "off") {
                    	self.moreBtn2 = "on"
                    	self.fnGetFleaList2();
                    	moreBtn2.innerHTML = "접기";
                    } else if (self.moreBtn2 == "on") {
                    	self.moreBtn2 = "off"
                        self.fnGetFleaList2();
                        moreBtn2.innerHTML = "더보기";
                    }
            	}
            	
            	// 거래글 카테고리 변경
            	, fnChangeOrder: function () {
                    var self = this;
                    console.log(self.orderValue);
                    self.fnGetFleaList();
                }
            	
            	// 나눔글 카테고리 변경
            	, fnChangeOrder2: function () {
                    var self = this;
                    console.log(self.orderValue2);
                    self.fnGetFleaList2();
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
            	
            	// 랜선장터글 보기
            	, fnViewFlea: function(boardNo) {
            		var self = this;
            		self.pageChange("./flea/view.do", {boardNo : boardNo});            		
            	}


            }
            , created: function () {
            	var self = this;
                self.fnGetFleaList();
                self.fnGetFleaList2();
            }
        });
    </script>
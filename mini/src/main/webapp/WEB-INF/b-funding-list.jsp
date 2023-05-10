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

        .add_box {
            position: absolute;
            top: 330px;
        }

        .add_box button {
            border: none;
            width: 100px;
            height: 40px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
			cursor: pointer
        }

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .fund_title h1 {
            display: inline-block;
        }

        select {
            width: 120px;
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

        .fund_category {
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
            cursor: pointer
        }

        .open_list {
            border: none;
            box-sizing: border-box;
            padding: 26px;
            width: 1200px;
            height: 350px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .planned_list {
            border: none;
            box-sizing: border-box;
            padding: 26px;
            width: 1200px;
            height: 350px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }
        
        .fund_name {
        	cursor: pointer;
        	width : 735px;
        	overflow     : hidden;
        	text-overflow: ellipsis;
        	white-space  : nowrap;
        }
        
        .fund_img {            
            float: left;
        }

        .fund_img img {
            border: 1px solid #e7e6e6;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            cursor: pointer
        }

        .fund_content {
            margin-top: 40px;
            margin-left: 50px;
            float: left;
        }

        .fund_summary {
            margin-top: 30px;
            font-size: 15px;
        }

        .fund_cnt .fund_time{
            display: inline-block;
            margin-top: 30px;
            font-size: 15px;
        }
        
        .fund_time {
        	float : right;
        }

        .fund_progress {
            width: 735px;
            height: 20px;
        }

        .price_box {
            margin-top: 15px;
            font-size: 20px;
        }

        .fund_price {
            font-size: 30px;
            font-weight: bold;
            color: #5ea152;
        }

        .planned_list_box .fund_price {
            color: #fe7167;
        }

        .open_more {
            text-align: center;
            margin-top: 60px;
        }

        .open_more button {
            border: none;
            width: 200px;
            height: 60px;
            border-radius: 20px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer
        }


        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">
                <div class="add_box">
                    <button class="add_btn">등록</button>
                </div>
                <div class="container">

                    <div class="fund_category">

                        <button class="category_btn">진행중</button>
                        <button class="category_btn">오픈예정</button>

                    </div>

                    <div class="box1">

                        <div class="fund_title">

                            <h1 id="fund_open_title">현재 진행중인 랜선펀딩</h1>

                            <select v-model="orderValue" @change="fnChangeOrder">
                                <option value="endDate" selected>종료일순</option>
                                <option value="rowPrice">낮은가격순</option>
                                <option value="highPrice">높은가격순</option>
                            </select>

                        </div>

                        <div class="open_list_box">

                            <ul>
                                <li>
                                    <div class="open_list" v-for="(item, index) in list">
                                        <div class="fund_img"><img :src="item.imgPath" @click="fnViewFunding(item.fundingNo)"></div>
                                        <div class="fund_content">
                                            <h1 class="fund_name" @click="fnViewFunding(item.fundingNo)">{{item.fundingName}}</h1>
                                            <p class="fund_summary">{{item.fundingSummary}}</p>
                                            <span class="fund_cnt">{{item.fundingGoalCnt}}명 중 {{item.cnt}}명</span>
                                            <span class="fund_time" v-if="item.dDay > 0" >{{item.dDay}}일 남음</span>
                                            <span class="fund_time" v-else style = "color:red;">금일 {{item.endTime}}시 종료</span>
                                            <p></p>
                                            <progress :value="item.cnt" :max="item.fundingGoalCnt" class="fund_progress"></progress>
                                            <div class="price_box">
                                                <span>공구가</span>
                                                <span class="fund_price">{{item.fundingPrice}}원</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="open_more">
                                    <button id="moreBtn" @click="fnShowMore">더보기</button>
                                </li>

                            </ul>

                        </div>

                    </div>

                    <div class="box2">

                        <div class="fund_title">
                            <h1>오픈 예정 펀딩</h1>

                            <select v-model="orderValue2" @change="fnChangeOrder2">
                                <option value="startDate" selected>시작일순</option>
                                <option value="rowPrice">낮은가격순</option>
                                <option value="highPrice">높은가격순</option>
                            </select>

                        </div>

                        <div class="planned_list_box">
                            <ul>
                                <li>
                                    <div class="planned_list" v-for="(item, index) in list2">
                                        <div class="fund_img"><img :src="item.imgPath" @click="fnViewFunding2(item.fundingNo)"></div>
                                        <div class="fund_content">
                                            <h1 class="fund_name" @click="fnViewFunding2(item.fundingNo)">{{item.fundingName}}</h1>
                                            <p class="fund_summary">{{item.fundingSummary}}</p>
                                            <span class="fund_cnt">최소 {{item.fundingGoalCnt}}명 중 {{item.cnt}}명 </span>
                                            <span class="fund_time">{{item.sDay}}{{item.dow}}
                                                {{item.sTime}}시 오픈예정</span>
                                            <p></p>
                                            <progress :value="item.cnt" :max="item.fundingGoalCnt" class="fund_progress"></progress>
                                            <div class="price_box">
                                                <span>펀딩예정가</span>
                                                <span class="fund_price">{{item.fundingPrice}}원</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="open_more">
                                    <button id="moreBtn2" @click="fnShowMore2">더보기</button>
                                </li>
                            </ul>
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
                moreBtn: "off",
                moreBtn2: "off",
                orderValue: "",
                orderValue2: "",
                endTime : ""
            }
            , methods: {
                fnGetFundingList: function () {
                    var self = this;
                    var nparmap = { moreBtn: self.moreBtn, orderValue: self.orderValue };
                    $.ajax({
                        url: "/funding/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.list = data.list;
                            console.log(data.list[0].endTime);                            
                        }
                    });
                }

                , fnGetFundingList2: function () {
                    var self = this;
                    var nparmap = { moreBtn2: self.moreBtn2, orderValue2: self.orderValue2 };
                    $.ajax({
                        url: "/funding/list2.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.list2 = data.list;
                            console.log(data.list);
                        }
                    });
                }

                , fnShowMore: function () {
                    var self = this;
                    if (self.moreBtn == "off") {
                    	self.moreBtn = "on"
                    	self.fnGetFundingList();
                    	moreBtn.innerHTML = "접기";
                    } else if (self.moreBtn == "on") {
                    	self.moreBtn = "off"
                    	self.fnGetFundingList();
                    	moreBtn.innerHTML = "더보기";
                    }
                }
               
                , fnShowMore2: function () {
                    var self = this;
                    if (self.moreBtn2 == "off") {
                    	self.moreBtn2 = "on"
                    	self.fnGetFundingList2();
                    	moreBtn2.innerHTML = "접기";
                    } else if (self.moreBtn2 == "on") {
                    	self.moreBtn2 = "off"
                    	self.fnGetFundingList2();
                    	moreBtn2.innerHTML = "더보기";
                    }
                }

                , fnChangeOrder: function () {
                    var self = this;
                    console.log(self.orderValue);
                    self.fnGetFundingList();
                }

                , fnChangeOrder2: function () {
                    var self = this;
                    console.log(self.orderValue2);
                    self.fnGetFundingList2();
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
                
                , fnViewFunding: function(fundingNo) {
                	var self = this;
                	self.pageChange("./funding-open.do", {fundingNo : fundingNo});
                }
                
                , fnViewFunding2: function(fundingNo) {
                	var self = this;
                	self.pageChange("./funding-planned.do", {fundingNo : fundingNo});
                }
                
              
                
            }
            , created: function () {
                var self = this;
                self.fnGetFundingList();
                self.fnGetFundingList2();
            }
        });
    </script>
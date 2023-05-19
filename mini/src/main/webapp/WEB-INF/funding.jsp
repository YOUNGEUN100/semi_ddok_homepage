<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth2_funding.css">

<!-- pageContent -- START -->
<div id="pageContent" class="funding">
	<div class="wrapper">
		<div id="fundingList" class="fundingListContainer">
			<section class="fund_category">
				<button class="category_btn typeOpen styleBoxRound styleBoxShadow active">
			        <img src="/images/funding_icon01.png" alt="">
					<p>진행중</p>
				</button>
				<button class="category_btn typePlanned styleBoxRound styleBoxShadow">
			        <img src="/images/funding_icon02.png" alt="">
					<p>오픈예정</p>
				</button>
			</section>
			<section class="fund_section">
			    <div class="fund_title">
			        <h3 id="fund_open_title">현재 진행중인 랜선펀딩</h3>
			        <select v-model="orderValue" @change="fnChangeOrder">
			            <option value="" selected>정렬순</option>
			            <option value="endDate">종료일순</option>
			            <option value="rowPrice">낮은가격순</option>
			            <option value="highPrice">높은가격순</option>
			        </select>
			    </div>
			    <div class="open_list_box">
			        <ul>
			            <li>
			                <div class="list_thumb open_list styleBoxRound typeMore styleBoxShadow styleHoverShadow" v-for="(item, index) in list" @click="fnViewFunding(item.fundingNo)">
			                    <div class="fund_img"><img :src="item.imgPath"></div>
			                    <div class="fund_content">
			                        <h4 class="fund_name" @click="fnViewFunding(item.fundingNo)">{{item.fundingName}}</h4>
			                        <p class="fund_summary">{{item.fundingSummary}}</p>
			                        <div class="prog_box">
			                        	<div class="fund_cnt">
			                        		<span class="goal">{{item.fundingGoalCnt}}명</span> 중 <span class="cnt">{{item.cnt}}명</span>
			                        	</div>
				                        <template>
					                        <div class="fund_time" v-if="item.dDay > 0">{{item.dDay}}일 남음</div>
					                        <div class="fund_time" v-else style="color:red;">금일 {{item.endTime}}시 종료</div>
				                        </template>
				                        <progress :value="item.cnt" :max="item.fundingGoalCnt" class="fund_progress"></progress>
			                        </div>
			                        <div class="price_box">
			                            <span>펀딩가</span>
			                            <span class="fund_price">{{item.fundingPrice2}}원</span>
			                        </div>
			                    </div>
			                </div>
			            </li>
			            <li class="open_more">
			                <button id="moreBtn" class="styleHoverShadow" @click="fnShowMore">더보기</button>
			            </li>
			        </ul>
			    </div>
			</section>
			
			<section class="fund_section">
			    <div class="fund_title">
			        <h3>오픈 예정 펀딩</h3>
			        <select v-model="orderValue2" @change="fnChangeOrder2">
			            <option value="" selected>정렬순</option>
			            <option value="startDate" selected>시작일순</option>
			            <option value="rowPrice">낮은가격순</option>
			            <option value="highPrice">높은가격순</option>
			        </select>
			    </div>
			    <div class="planned_list_box">
			        <ul>
			            <li>
			                <div class="list_thumb planned_list styleBoxRound typeMore styleBoxShadow styleHoverShadow" v-for="(item, index) in list2"  @click="fnViewFunding2(item.fundingNo)">
			                    <div class="fund_img"><img :src="item.imgPath"></div>
			                    <div class="fund_content">
			                        <h4 class="fund_name" @click="fnViewFunding2(item.fundingNo)">{{item.fundingName}}</h4>
			                        <p class="fund_summary">{{item.fundingSummary}}</p>
			                        <div class="prog_box">
				                        <span class="fund_cnt">최소 {{item.fundingGoalCnt}}명 중 {{item.cnt}}명 </span>
				                        <span class="fund_time">{{item.sDay}}{{item.dow}}{{item.sTime}}시 오픈예정</span>
			                        	<progress :value="item.cnt" :max="item.fundingGoalCnt" class="fund_progress"></progress>
			                        </div>
			                        <div class="price_box">
			                            <span>펀딩예정가</span>
			                            <span class="fund_price">{{item.fundingPrice2}}원</span>
			                        </div>
			                    </div>
			                </div>
			            </li>
			            <li class="open_more">
			                <button id="moreBtn2" class="styleHoverShadow" @click="fnShowMore2">더보기</button>
			            </li>
			        </ul>
			    </div>
			</section>
			
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button class="addBtn" @click="fnAddFunding">등록</button>
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

var fundingList = new Vue({
    el: '#fundingList',
    data: {
        list: [],
        list2: [],
        moreBtn: "off",
        moreBtn2: "off",
        orderValue: "",
        orderValue2: "",
        endTime : "",
        sessionId : "${sessionId}",
        sessionStatus : "${sessionStatus}"
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
                    console.log(data.list);
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

        // 오픈중 펀딩 더보기 버튼
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
       	
        // 준비중 펀딩 더보기 버튼
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

        // 오픈중 펀딩 카테고리 변경
        , fnChangeOrder: function () {
            var self = this;
            console.log(self.orderValue);
            self.fnGetFundingList();
        }

        // 준비중 펀딩 카테고리 변경
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
        
        // 오픈중 펀딩 상세페이지로
        , fnViewFunding: function(fundingNo) {
        	var self = this;
        	self.pageChange("./funding/view/open.do", {fundingNo : fundingNo});
        }
        
        // 준비중 펀딩 상세페이지로
        , fnViewFunding2: function(fundingNo) {
        	var self = this;
        	self.pageChange("./funding/view/planned.do", {fundingNo : fundingNo});
        }
        
        // 펀딩 상품 등록
      	, fnAddFunding : function(){
    		location.href = "/funding/edit.do";
    	}
        
    }
    , created: function () {
        var self = this;
        self.fnGetFundingList();
        self.fnGetFundingList2();
    }
});
</script>
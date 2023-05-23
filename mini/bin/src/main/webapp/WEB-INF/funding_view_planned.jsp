<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth2_funding.css">

<!-- pageContent -- START -->
<div id="pageContent" class="funding typeView stylePlanned">
	<div class="wrapper">
		<div id="fundingView" class="fundingViewContainer">
            <section class="funding_info_section">
                <div class="funding_thumb_area styleBoxRound styleBoxShadow">
                	<img :src="info.imgPath">
                </div>
                <div class="funding_info_area">
                    <div class="info_box typeBoxArea styleBoxRound styleBoxShadow">
	                    <div class="info_txt">
	                    	<h3 class="title">{{info.fundingName}}</h3>
	                    	<p class="summary">{{info.fundingSummary}}</p>
	                    </div>
                        <div class="info_prog">
                        	<div class="fund_cnt">
                        		<span class="goal">최소 {{info.fundingGoalCnt}}명</span>
                        	</div>
	                        <div class="fund_cnt" id="fund_cnt">{{info.sDay}}{{info.dow}}
                            {{info.sTime}}시 오픈예정</div>
                        	<progress :value="info.cnt" :max="info.fundingGoalCnt" class="fund_progress"></progress>
                        </div>
                        <div class="info_price">
                            <span>펀딩예정가</span>
                            <span class="fund_price">{{info.fundingPrice2}}원</span>
                        </div>
                    </div>
                    <div class="funding_button_Box">
                    	<button class="apply_button styleBoxShadow styleHoverShadow"><i class="fa-regular fa-clock"></i> {{remainTime}}</button>
                    	<button class="share_button styleBoxShadow styleHoverShadow" @click="fnClip"><i class="fa-solid fa-share-nodes"></i></button>
                    </div>
                </div>
            </section>
            <section class="detail_section" id="box2">
                <div id="detail_box" v-for="(item, index) in imgInfo">
                    <img :src="item.imgPathDetail">
                </div>
            </section>
            <section class="detail_show_section" id="button_box1">
                <button @click="show" class="show_button" id="show_button">펼쳐보기</button>
            </section>
            
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button class="modBtn" @click="fnEditFunding(info.fundingNo)">수정</button>
							<button class="delBtn" @click="fnDeleteFunding">삭제</button>
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
var btn = "N";
function show() {
    if (btn == "N") {
        self.btn = "Y";
        document.getElementById('box2').classList.add('show');
        show_button.innerText = "접기";
    } else {
        document.getElementById('box2').classList.remove('show');
        show_button.innerText = "펼쳐보기";
        self.btn = "N";
    }
}

var fundingView = new Vue({
    el: '#fundingView',
    data: {
        info: {},
        imgInfo: [],
        fundingNo: "${map.fundingNo}",
        sDate: "",
        remainTime: "",
        sessionId: "${sessionId}",
        sessionStatus : "${sessionStatus}"
    },
    methods: {
        fnGetFunding: function () {
            var self = this;
            var nparmap = {
                fundingNo: self.fundingNo
            };
            $.ajax({
                url: "/funding/view2.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.info = data.info;
                    self.imgInfo = data.imgInfo;
                    console.log(data.info);
                    console.log(data.imgInfo);
                    console.log(data.info.startDate);
                    self.sDate = data.info.fundingStartDt;
                    self.fnTimeDiff();
                    self.fnCountDown();
                }
            });
        }
    
	    // 펀딩삭제
	    , fnDeleteFunding: function () {
	    	var self = this;
	    	if (!confirm("펀딩을 삭제하시겠습니까?")) {
	    		return;
	    	}
	    	var nparmap = {fundingNo: self.fundingNo};
	            $.ajax({
	                url: "/funding/delete.dox",
	                dataType: "json",
	                type: "POST",
	                data: nparmap,
	                success: function (data) {
	                    console.log(data);
	                    alert("삭제완료");
	                    location.href = "/funding.do";
	                }
	            });
	    }
	    
        // 펀딩 수정
        , fnEditFunding: function (fundingNo) {
            var self = this;
            self.pageChange("../../funding/edit.do", { fundingNo: fundingNo });
        }
        
        , fnClip: function () {
            navigator.clipboard.writeText(window.location.href);
            alert("복사되었습니다.");
        }
        , fnTimeDiff: function () {
            var self = this;
            var endTime = new Date(self.sDate);
            var todayTime = new Date();
            var diff = endTime - todayTime;
            var diffDay = Math.floor(diff / (1000 * 60 * 60 * 24));
            var diffHour = Math.floor((diff / (1000 * 60 * 60)) % 24);
            var diffMin = Math.floor((diff / (1000 * 60)) % 60);
            var diffSec = Math.floor(diff / 1000 % 60);
            self.remainTime = "오픈까지 " + diffDay + "일 " + diffHour + "시간 " + diffMin + "분 " + diffSec + "초 남음";
        }
        , fnCountDown: function () {
            setInterval(this.fnTimeDiff, 1000);
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
        self.fnGetFunding();
    }
});
</script>
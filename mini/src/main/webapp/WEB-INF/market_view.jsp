<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<link rel="stylesheet" href="/css/pageStyle/depth3_market.css">

<!-- pageContent -- START -->
<div id="pageContent" class="market typeView">
	<div class="wrapper">
		<div id="marketView" class="marketViewContainer">
            <section class="marketInfoSection">
                <div class="marketThumbArea styleBoxRound styleBoxShadow">
                	<img :src="info.imgPath">
                </div>
                <div class="marketInfoArea">
                    <div class="infoBox typeBoxArea styleBoxRound styleBoxShadow">
	                    <div class="infoTxt">
	                    	<h3 class="title">{{info.productName}}</h3>
	                    	<p class="review" v-if="(info.satisfactionGrade + info.repurchaseGrade + info.deliveryGrade)>0"><i class="fa-solid fa-star"></i> {{(info.satisfactionGrade + info.repurchaseGrade + info.deliveryGrade)/3 |  numberFormat(1)}}</p>
	                    	<p class="summary">{{info.content}}</p>
	                    </div>
                        <div class="infoPrice">
                            <span>판매가</span>
			                <span class="price">{{info.productPrice | numberFormat()}}원 </span>
			                <span class="weight" v-if="info.productVolume=='g' || info.productVolume=='ml'">(100{{info.productVolume}}당 {{(info.productPrice*100) / (info.productWeight*info.productEa) | numberFormat()}}원)</span>
			                <span class="weight" v-else>(1{{info.productVolume}}당 {{(info.productPrice) / (info.productWeight*info.productEa) | numberFormat()}}원)</span>
                        </div>
			            <div class="infoCount">
			            	<span class="name">수량</span>
			                <span class="count"><input class="input_cnt" type="number" min="1" :max="info.productStock" value="1" v-model="productCnt"></span>	
			                <span class="nowCnt">현재 {{info.productStock}}개 남았어요!</span>
			            </div>
                    </div>
                    <div class="marketButtonBox">
                    	<button class="buyBtn styleBoxShadow styleHoverShadow" @click="fnOrder">구매하기</button>
						<button class="cartBtn styleBoxShadow styleHoverShadow" @click="fnCart(info.productNo)">장바구니담기</button>
						<button class="shareBtn styleBoxShadow styleHoverShadow" @click="fnClip"><i class="fa-solid fa-share-nodes"></i></button>
                    </div>
                </div>
            </section>
        
			<section id="typeProduct" class="marketTabSection styleBoxRound styleBoxShadow">
			    <div class="productScrollBtn active">상품설명</div>
			    <div class="reviewScrollBtn">후기</div>
			</section>
			
			<section class="productDetailSection">
				<div class="imgAlign" id="detailShowBox">
					<img :src="item.imgPath" v-for="(item, index) in imglist">
				</div>
				<div class="detailShowBtn"><button class="showBtn" id="showBtn" @click="show">펼쳐보기</button></div>
			</section>
        
			<section id="typeReview" class="marketTabSection styleBoxRound styleBoxShadow">
			    <div class="productScrollBtn">상품설명</div>
			    <div class="reviewScrollBtn active">후기</div>
			</section>
			
			<section class="reviewSection" v-if="self.cnt>0">
				<details class="reviewItem styleBoxRound styleBoxShadow styleHoverShadow" v-for="(item, index) in list">
				    <summary class="reviewSummary">
				    	<div class="rDate">{{item.cdatetime}}</div>
				    	<div class="rProduct">{{item.productName}}</div>
				    	<div class="rTotal">
				    		<i class="fa-solid fa-star"></i> 
				    		{{(item.satisfactionGrade + item.repurchaseGrade + item.deliveryGrade)/3 | numberFormat(1)}}
				    	</div>
				    	<div class="rUser"><i class="fa-solid fa-user"></i> {{item.nick}}</div>
				    </summary>
				    <div class="reviewDetail">
				    	<div class="typeSa">상품 만족도 <span><i class="fa-solid fa-star"></i> {{item.satisfactionGrade}}</span></div>
				    	<div class="typeDe">배송 만족도 <span><i class="fa-solid fa-star"></i> {{item.deliveryGrade}}</span></div>
				    	<div class="typeRe">재구매 의사 <span><i class="fa-solid fa-star"></i> {{item.repurchaseGrade}}</span></div>
				    </div>
				</details>
			
			    <!-- 페이징 추가 3-->
			    <template>
			        <paginate :page-count="pageCount" :page-range="3" :margin-pages="2" :click-handler="fnSearch" :prev-text="'<'"
			            :next-text="'>'" :container-class="'pagination'" :page-class="'page-item'">
			        </paginate>
			    </template>
			</section>
						<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							
							<button class="delBtn" @click="fndelete">삭제</button>
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
        document.getElementById('detailShowBox').classList.add('show');
        showBtn.innerText = "접기";
    } else {
        document.getElementById('detailShowBox').classList.remove('show');
        showBtn.innerText = "펼쳐보기";
        self.btn = "N";
    }
}

<!-- 페이징 추가 4-->
Vue.component('paginate', VuejsPaginate)
var marketView = new Vue({
    el: '#marketView',
    data: {
        list: []
        , info: {}
        , imglist: {}
        , reviewlist: {}
        , productNo: "${map.productNo}"
        , sessionId: "${sessionId}"
        , sessionStatus: "${sessionStatus}"
        , productName: ""
        , isOpen: false
        , selectedItems: []
        , productCnt: "${map.productCnt}"
        , productStock:""

        <!-- 페이징 추가 5-->
        , selectPage: 1
        , pageCount: 1
        , cnt: 0
    }
    
    , filters: {
        numberFormat: (value, numFix) => {
            value = parseFloat(value);
            if (!value) return '0';
            return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
        },
    }
    , methods: {
        fnGetList: function () {
            var self = this;
            var nparmap = { productNo: self.productNo, sessionId: self.sessionId};
            productCnt = self.productCnt;
            //console.log("productCnt: =====>",self.productCnt);
            
            if(productCnt=="" || productCnt==0){
            	self.productCnt=1;
            }
            //상품정보
            $.ajax({
                url: "/smartmarket-view.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    console.log(data);
                    self.info = data.info;
                    self.imglist = data.imgList.list;
                }
            });
            
            
            
			var startNum = ((self.selectPage - 1) * 5);
            var lastNum = (self.selectPage * 5)
            var nparmap = {
                keyword: self.keyword
                , kind: self.selectItem
                , startNum: startNum
                , lastNum: lastNum
                , productNo: self.productNo
            };
            console.log(nparmap);
            $.ajax({
                url: "/reviewlist.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    console.log(data);
                    self.list = data.list;
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 5);
                }
            });
        }
        //장바구니담기
        , fnCart: function (productNo) {
            var self = this;
            var nparmap = { productNo: self.productNo, productCnt: self.productCnt };
            if (self.sessionId == "" || self.sessionId == "undefind") {
                alert("장바구니담기를 하시려면 로그인해주세요");
                return;
            }
            
            if(self.info.productStock == 0 || self.info.productStock ==""){
            	alert("품절된 상품입니다.");
                return;
            }
            
            
            $.ajax({
                url: "/addCart.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("장바구니에 담았습니다..");
                    location.href = "/cart.do";
                }
            });
        }
        //구매하기
        , fnOrder: function () {
            var self = this;
            var nparmap = { productNo: self.productNo, productCnt: self.productCnt };
            var selectedItems = [];
            if (self.sessionId == "" || self.sessionId == "undefind") {
                alert("구매하시려면 로그인해주세요");
                return;
            }
            
            if(self.info.productStock == 0 || self.info.productStock ==""){
            	alert("품절된 상품입니다.");
                return;
            }
            
            
            nparmap = {
                productNo: Number(self.productNo)
                , productCnt: self.productCnt
                , productPrice: self.info.productPrice
                , imgPath: self.info.imgPath
                , productName: self.info.productName
                , userid: self.sessionId
            };
            selectedItems.push(nparmap);
            self.pageChange("/order.do", { selectedItems: selectedItems });
        }
        
        // 상품 삭제
        , fndelete: function () {
        	var self = this;
        	var nparmap = { productNo: self.productNo};
            $.ajax({
                url: "/smartmarket/delete.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제완료.");
                    location.href = "/market.do";
                }
            });
        	
        }
        // 주소 복사
        , fnClip: function () {
            navigator.clipboard.writeText(window.location.href);
            alert("복사되었습니다.");
        }
        , pageChange: function (url, param) {
            var target = "_self";
            if (param == undefined) {
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
        , fnSearch: function (pageNum) {
            var self = this;
            self.selectPage = pageNum;
            var startNum = ((pageNum - 1) * 5);
            var lastNum = (pageNum * 5) + 1;
            var nparmap = { startNum: startNum, lastNum: lastNum, productNo: self.productNo };
            $.ajax({
                url: "/reviewlist.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 5);
                }
            });
        }
    }
    , created: function () {
        var self = this;
        self.fnGetList();
    }
});

$(document).ready(function(){
	$(".productScrollBtn").click(function(){
		$('html,body').animate({scrollTop:$("#typeProduct").offset().top - 150}, 500);
		return false;
	});
	$(".reviewScrollBtn").click(function(){
		$('html,body').animate({scrollTop:$("#typeReview").offset().top - 150}, 500);
		return false;
	});
	
	var details = document.querySelector("details")
	details.addEventListener("toggle", function() {
		details.firstChild.textContent = "done"
	})
});
</script>

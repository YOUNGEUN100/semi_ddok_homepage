<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth3_market.css">

<!-- pageContent -- START -->
<div id="pageContent" class="market">
	<div id="marketList" class="marketListContainer">
		<div class="wrapper">
			<section class="categorySection">
			    <div class="categoryCircle styleBoxShadow styleHoverShadow" v-for="(item, index) in codeList" @click="fnGetList2(item)">
			        <img :src="item.img" alt="">
                	<p class="circle-title">{{item.name}}</p>
			    </div>
		    </section>
		</div>
		    
		<section class="productSection typeRecomm">
			<div class="wrapper">
				<h3 class="prodTitle"><i class="fa-solid fa-hand-holding-heart fa-bounce"></i> 똑똑이 추천합니다</h3>
		        <div class="prodArea">
					<div class="prodThumb" v-for="(item2, index) in list2" @click="fnView(item2.productNo)">
						<div class="imgBox">
							<img :src="item2.imgPath" alt="">
						</div>
						<div class="txtBox">
							<p class="text" v-if="item2.productStock>5"></p>
							<p class="text" v-else-if="item2.productStock>0 && item2.productStock<=5"><i class="fa-solid fa-tag"></i> 현재 5개 남았어요!</p>
							<p class="text soldOut" v-else>품절</p>
						    <h4 class="title">{{item2.productName}}</h4>
						    <div class="price">
						    	<span class="amount">{{item2.productPrice | numberFormat()}}원</span> 
						    	(100{{item2.productVolume}}당 {{item2.productPrice*100 / item2.productWeight*item2.productEa | numberFormat()}}원)
						    </div>
						    <div class="review">
							    <i class="fa-solid fa-star"></i>
							    {{(item2.satisfactionGrade + item2.repurchaseGrade + item2.deliveryGrade)/3 |  numberFormat(1)}}
						    </div>
						</div>
					</div>
				</div>
			</div>
		</section>
		    
		<div class="wrapper">
            <section id="searchSection" class="searchSection">
            	<div class="searchKind">상품목록 : {{pkind}}</div>
            	<div class="searchCnt">총 <span>{{product_cnt}}</span>개의 상품</div>
            </section>
            
			<section class="productSection">
		        <div class="prodArea">
					<div class="prodThumb" v-for="(item, index) in list" @click="fnView(item.productNo)">
						<div class="imgBox">
							<img :src="item.imgPath" alt="">
						</div>
						<div class="txtBox">
							<p class="text" v-if="item.productStock>5" style="imageObject.disabled"></p>
							<p class="text" v-else-if="item.productStock>0 && item.productStock<=5"><i class="fa-solid fa-tag"></i> 현재 5개 남았어요!</p>
							<p class="text soldOut" v-else><i class="fa-solid fa-circle-exclamation"></i> 품절</p>
						    <h4 class="title">{{item.productName}}</h4>
						    <div class="price">
						    	<span class="amount">{{item.productPrice | numberFormat()}}원</span> 
						    	(100{{item.productVolume}}당 {{item.productPrice*100 / item.productWeight*item.productEa | numberFormat()}}원)
						    </div>
						    <div class="review">
						    	<i class="fa-solid fa-star"></i> 
						    	{{(item.satisfactionGrade + item.repurchaseGrade + item.deliveryGrade)/3 |  numberFormat(1)}}
						    </div>
						</div>
					</div>
				</div>
		    </section>
            
			<!-- 페이징 추가 3-->
			<template>
				<paginate :page-count="pageCount"
						  :page-range="3"
						  :margin-pages="2"
						  :click-handler="fnSearch"
						  :prev-text="'<'"
						  :next-text="'>'"
						  :container-class="'pagination'"
						  :page-class="'page-item'">
				</paginate>
			</template>
			
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button class="addBtn" @click="fnAddproduct">등록</button>
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
var marketList = new Vue({
    el: '#marketList',
    data: {
        list: [],
        list2: [],
        codeList: ${ map.codeList },
	    product_cnt : "",
	    pkind : "전체",
	    product_kind : "",
	    sessionStatus : "${sessionStatus}", 
	    selectPage: 1, 
	    pageCount: 1, 
	    cnt : 0
	}
	, filters: {
	    numberFormat: (value, numFix) => {
	        value = parseFloat(value);
	        if (!value) return '0';
	        return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d)) /g, ',');
	    }
	} 
    , methods: {
        fnGetList: function() {
            var self = this; //var nparmap={product_kind : self.product_kind}; <!-- 페이징 추가 6-->
            var startNum = ((self.selectPage - 1) * 15);
            var lastNum = (self.selectPage * 15)
            var nparmap = {
                keyword: self.keyword
                , kind: self.selectItem
                , startNum: startNum
                , lastNum: lastNum
                , product_kind: self.product_kind
                , productNo: self.productNo
            };
            console.log(nparmap);
            //상품리스트
            $.ajax({
                url: "/smartmarket-list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.product_cnt = data.list.length;
                    self.list = data.list;
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 15);
                    console.log("==============", data);
                }
            });
        }
    	, fnView: function(productNo) {
            var self = this;
            self.pageChange("/market/view.do", { productNo: productNo });
        }
		, fnGetList2: function(item) {
            var self = this;

            self.product_kind = item.code;
            self.pkind = item.name;
            self.fnGetList();
        }
		, fnGetList3: function() {
            var self = this;
            var nparmap = { product_kind: self.product_kind };
            //추천상품
            $.ajax({
                url: "/smartmarket-recommend-list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    console.log(data.list);
                    self.list2 = data.list;
                }
            });
        }
		, pageChange: function(url, param) {
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
		// 상품 등록
		, fnAddproduct: function() {
            location.href = "/market/edit.do";
        }
		, fnSearch : function(pageNum) {
            var self = this;
            self.selectPage = pageNum;
            var startNum = ((pageNum - 1) * 15);
            var lastNum = (pageNum * 15) + 1;
            var nparmap = {
                startNum: startNum
                , lastNum: lastNum
                , product_kind: self.product_kind
                , productNo: self.productNo
            };
            console.log(nparmap);
            $.ajax({
                url: "/smartmarket-list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 15);
                }
            });
        }
    }
, created: function () {
    var self = this;
    self.fnGetList();
    self.fnGetList3();
}
});

$(document).ready(function(){
	$(".categoryCircle").click(function(){
		$('html,body').animate({scrollTop:$("#searchSection").offset().top - 150}, 500);
		return false;
	});
});
</script>

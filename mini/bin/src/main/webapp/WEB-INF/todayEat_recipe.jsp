<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
.formContainer {display:flex; flex-flow:column wrap; justify-content:center; align-items:center;}
.selectArea {width:100%; margin-bottom:2em;}
.typeBoxArea {padding:1.75em 3.5em 1.25em;}
.styleBoxRound {border-radius:1.5em;}
.styleBoxShadow {box-shadow:0 0 10px 0 rgba(0,0,0,0.1);}
.styleHoverShadow {transition:all 0.2s ease-out;}
.styleHoverShadow:hover {box-shadow:0 2px 20px 0 rgba(0,0,0,0.3);}

.selectTitle {font-size:1.5em; margin-bottom:0.75em;}
.selectBox {width:100%; display:flex; flex-flow:row wrap; justify-content:flex-start; align-items:stretch;}
.selectBox .boxItem {display:inline-block; margin-bottom:0.5em; margin-right:1.5em;}
.selectBox .boxItem:last-child {margin-right:0;}
.selectBox .boxItem label {font-size:1.125em; cursor:pointer; transition:all 0.1s ease-out; word-break:keep-all; padding-left:0.5em;}
#selectAllBtn {font-size:1.2em; padding:1em 7%; border:0; border-radius:1em; background:var(--base-colorCharcoal); color:var(--base-colorWhite); font-weight:600;}

input {position:relative; transition:all 0.2s ease-in;}
input[type="radio"] {width:1.125em; height:1.125em; border-radius:50%; vertical-align:middle; appearance:none; background:var(--base-colorWhite); border:0.2em solid var(--base-colorWhite); outline:0.15em solid var(--base-colorDarkGray); margin-top:-0.125em;}
input[type="checkbox"] {width:1.125em; height:1.125em; border-radius:0.2em; vertical-align:middle; appearance:none; background:var(--base-colorWhite); outline:0.15em solid var(--base-colorDarkGray); margin-top:-0.125em;}
input[type="radio"]:checked {outline-color:var(--main-colorRed); background:var(--main-colorRed);}
input[type="checkbox"]:checked {outline-color:var(--main-colorRed); background:var(--main-colorRed);}
input[type="checkbox" i]:checked:before {content:"✔"; position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); color:var(--base-colorWhite);}
input[type="radio"]:focus-visible, input[type="checkbox"]:focus-visible {outline-color:var(--main-colorRed);}
input[type="radio"]:hover, input[type="checkbox"]:hover {box-shadow:0 0 0 0.25em var(--base-colorBasicGray); cursor:pointer;}
input[type="radio"]:disabled {box-shadow:none; opacity:0.7; cursor:not-allowed; border-color:var(--base-colorLightGray); background:var(--base-colorLightGray); outline-color:var(--base-colorDeepGray);}
input[type="radio"]:disabled + label {opacity:0.26; cursor:not-allowed;}

select {border-radius:4px; border-color:var(--base-colorDeepGray); padding:0.5em 1em;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<div id="app" class="formContainer">
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">목적별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="radio" id="ref" v-model="r_purpose" value="ref"><label for="ref">냉장고털이</label></span>
                    <span class="boxItem"><input type="radio" id="han" v-model="r_purpose" value="han"><label for="han">해장</label></span>
                    <span class="boxItem"><input type="radio" id="die" v-model="r_purpose" value="die"><label for="die">다이어트</label></span>
                    <span class="boxItem"><input type="radio" id="sna" v-model="r_purpose" value="sna"><label for="sna">간단</label></span>
                    <span class="boxItem"><input type="radio" id="nig" v-model="r_purpose" value="nig"><label for="nig">야식</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">방법별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="radio" id="roa" v-model="howto" value="roa"><label for="roa">구이/부침</label></span>
                    <span class="boxItem"><input type="radio" id="sou" v-model="howto" value="sou"><label for="sou">국탕찌개</label></span>
                    <span class="boxItem"><input type="radio" id="fry" v-model="howto" value="fry"><label for="fry">볶음/조림</label></span>
                    <span class="boxItem"><input type="radio" id="mix" v-model="howto" value="mix"><label for="mix">무침/비빔</label></span>
                    <span class="boxItem"><input type="radio" id="etc" v-model="howto" value="etc"><label for="etc">기타</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">재료별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="checkbox" id="pot" v-model="ingredient" value="pot"><label for="pot">감자/고구마</label></span>
                    <span class="boxItem"><input type="checkbox" id="veg" v-model="ingredient" value="veg"><label for="veg">채소</label></span>
                    <span class="boxItem"><input type="checkbox" id="tof" v-model="ingredient" value="tof"><label for="tof">두부</label></span>
                    <span class="boxItem"><input type="checkbox" id="che" v-model="ingredient" value="che"><label for="che">우유/치즈</label></span>
                    <span class="boxItem"><input type="checkbox" id="egg" v-model="ingredient" value="egg"><label for="egg">계란</label></span>
                    <span class="boxItem"><input type="checkbox" id="chi" v-model="ingredient" value="chi"><label for="chi">닭고기</label></span>
                    <span class="boxItem"><input type="checkbox" id="bre" v-model="ingredient" value="bre"><label for="bre">식빵</label></span>
                    <span class="boxItem"><input type="checkbox" id="tun" v-model="ingredient" value="tun"><label for="tun">참치캔</label></span>
                    <span class="boxItem"><input type="checkbox" id="ham" v-model="ingredient" value="ham"><label for="ham">햄</label></span>
                    <span class="boxItem"><input type="checkbox" id="ram" v-model="ingredient" value="ram"><label for="ram">라면</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">도구별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="radio" id="pot" v-model="tool" value="pot"><label for="pot">냄비/후라이팬</label></span>
                    <span class="boxItem"><input type="radio" id="mic" v-model="tool" value="mic"><label for="mic">전자레인지</label></span>
                    <span class="boxItem"><input type="radio" id="ove" v-model="tool" value="ove"><label for="ove">에어프라이어/오븐</label></span>
                    <span class="boxItem"><input type="radio" id="etc" v-model="tool" value="etc"><label for="etc">기타</label></span>
                </div>
            </div>
            <button id="selectAllBtn" class="styleBoxShadow styleHoverShadow" @click="fnFilterRecipe()">선택완료</button>
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
    	r_purpose : "ref" ,
    	howto : "roa" ,
    	ingredient : ["pot"] ,
    	tool : "pot"
    }   
    , methods: {
    	fnFilterRecipe : function(){
			var self = this;
			var nparmap = {
            		r_purpose : self.r_purpose, 
        			howto : self.howto, 
        			ingredient : self.ingredient, 
        			tool : self.tool
            };
			if(nparmap.ingredient.length == 0) {
            	alert('[재료별]에서 최소 한 개 이상 선택해 주세요.');
                return false;
            };
			self.pageChange("/todayEat/recipe/result.do", nparmap);
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
	}
});
</script>
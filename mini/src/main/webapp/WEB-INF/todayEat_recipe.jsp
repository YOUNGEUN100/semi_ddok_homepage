<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth1_todayEat.css">

<!-- pageContent -- START -->
<div id="pageContent" class="todayEat">
	<div class="wrapper">
		<div id="form" class="formContainer">
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
var form = new Vue({ 
    el: '#form',
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
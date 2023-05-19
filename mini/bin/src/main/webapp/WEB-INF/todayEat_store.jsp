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
                    <span class="boxItem"><input type="radio" id="han" v-model="purpose" value="han"><label for="han">해장</label></span>
                    <span class="boxItem"><input type="radio" id="sim" v-model="purpose" value="sim"><label for="sim">간단식</label></span>
                    <span class="boxItem"><input type="radio" id="die" v-model="purpose" value="die"><label for="die">식이조절</label></span>
                    <span class="boxItem"><input type="radio" id="one" v-model="purpose" value="one"><label for="one"></label>한그릇</span>
                    <span class="boxItem"><input type="radio" id="bru" v-model="purpose" value="bru"><label for="bru"></label>브런치</span>
                    <span class="boxItem"><input type="radio" id="sna" v-model="purpose" value="sna"><label for="sna">간식</label></span>
                    <span class="boxItem"><input type="radio" id="nig" v-model="purpose" value="nig"><label for="nig">야식</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">상황별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="radio" id="alo" v-model="situation" value="alo"><label for="alo">혼밥</label></span>
                    <span class="boxItem"><input type="radio" id="fre" v-model="situation" value="fre"><label for="fre">친구</label></span>
                    <span class="boxItem"><input type="radio" id="lov" v-model="situation" value="lov"><label for="lov">연인</label></span>
                    <span class="boxItem"><input type="radio" id="fan" v-model="situation" value="fan"><label for="fan">가족</label></span>
                    <span class="boxItem"><input type="radio" id="com" v-model="situation" value="com"><label for="com">모임</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">나라별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="checkbox" id="kor" v-model="nation" value="kor"><label for="kor">한식</label></span>
                    <span class="boxItem"><input type="checkbox" id="chi" v-model="nation" value="chi"><label for="chi">중식</label></span>
                    <span class="boxItem"><input type="checkbox" id="jap" v-model="nation" value="jap"><label for="jap">일식</label></span>
                    <span class="boxItem"><input type="checkbox" id="ita" v-model="nation" value="ita"><label for="ita">양식</label></span>
                    <span class="boxItem"><input type="checkbox" id="etc" v-model="nation" value="etc"><label for="etc">그 외</label></span>
            	</div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">위치설정</h3>
                <div class="selectBox">
	                <select class="boxItem" v-model="sido" name="sido" id="sido"></select>
	                <select class="boxItem" v-model="gugun" name="gugun" id="gugun"></select>
                </div>
            </div>
            <button id="selectAllBtn" class="styleBoxShadow styleHoverShadow" @click="fnFilterStore()">선택완료</button>
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
		purpose : "han" ,
		situation : "alo" ,
		nation : ["kor"] ,
		location : [] , 
		sido : "시/도 선택" ,
		gugun : "전체"
    }   
    , methods: {
    	fnFilterStore : function(){
			var self = this;
			var nparmap = {
					purpose : self.purpose, 
					situation : self.situation, 
					nation : self.nation, 
					location : [self.sido, self.gugun]
            };
			if(nparmap.nation.length == 0) {
            	alert('[나라별]에서 최소 한 개 이상 선택해 주세요.');
                return false;
            };
        	if(nparmap.location[0] == "시/도 선택"){
        		alert("위치를 설정해 주세요.");
                return false;
        	};
			self.pageChange("/todayEat/store/result.do", nparmap);
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

$('document').ready(function() {
	var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	var area1 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["전체","계양구","미추홀구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["전체","대덕구","동구","서구","유성구","중구"];
	var area4 = ["전체","광산구","남구","동구","북구","서구"];
	var area5 = ["전체","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["전체","남구","동구","북구","중구","울주군"];
	var area7 = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["전체","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["전체","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["전체","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["전체","제주시","서귀포시"];
	
	// 시/도 선택 박스 초기화
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});
	
	// 시/도 선택시 구/군 설정
	$("select[name^=sido]").change(function() {
		var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		var $gugun = $(this).next(); // 선택영역 군구 객체
		$("option",$gugun).remove(); // 구군 초기화
		if(area == "area0")
			$gugun.append("<option value=''>구/군 선택</option>");
		else {
			$.each(eval(area), function() {
				$gugun.append("<option value='"+this+"'>"+this+"</option>");
			});
		}
	});
});
</script>
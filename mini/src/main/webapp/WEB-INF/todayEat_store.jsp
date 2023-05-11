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
		<form class="formContainer" name="storeForm" action="/todayEat/store/result.do" method="post" onSubmit="return Checkform()">
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">목적별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="radio" id="han" name="purpose" value="han" checked><label for="han">해장</label></span>
                    <span class="boxItem"><input type="radio" id="sim" name="purpose" value="sim"><label for="sim">간단식</label></span>
                    <span class="boxItem"><input type="radio" id="die" name="purpose" value="die"><label for="die">식이조절</label></span>
                    <span class="boxItem"><input type="radio" id="one" name="purpose" value="one"><label for="one"></label>한그릇</span>
                    <span class="boxItem"><input type="radio" id="bru" name="purpose" value="bru"><label for="bru"></label>브런치</span>
                    <span class="boxItem"><input type="radio" id="sna" name="purpose" value="sna"><label for="sna">간식</label></span>
                    <span class="boxItem"><input type="radio" id="nig" name="purpose" value="nig"><label for="nig">야식</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">상황별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="radio" id="alo" name="situation" value="alo" checked><label for="alo">혼밥</label></span>
                    <span class="boxItem"><input type="radio" id="fre" name="situation" value="fre"><label for="fre">친구</label></span>
                    <span class="boxItem"><input type="radio" id="lov" name="situation" value="lov"><label for="lov">연인</label></span>
                    <span class="boxItem"><input type="radio" id="fan" name="situation" value="fan"><label for="fan">가족</label></span>
                    <span class="boxItem"><input type="radio" id="com" name="situation" value="com"><label for="com">모임</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">나라별</h3>
                <div class="selectBox">
                    <span class="boxItem"><input type="checkbox" id="kor" name="nation" value="kor" checked><label for="kor">한식</label></span>
                    <span class="boxItem"><input type="checkbox" id="chi" name="nation" value="chi"><label for="chi">중식</label></span>
                    <span class="boxItem"><input type="checkbox" id="jap" name="nation" value="jap"><label for="jap">일식</label></span>
                    <span class="boxItem"><input type="checkbox" id="ita" name="nation" value="ita"><label for="ita">양식</label></span>
                    <span class="boxItem"><input type="checkbox" id="etc" name="nation" value="etc"><label for="etc">그 외</label></span>
                </div>
            </div>
            <div class="selectArea typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="selectTitle">위치설정</h3>
                <div class="selectBox">
	                <select class="boxItem" name="sido" id="sido"></select>
	                <select class="boxItem" name="gugun" id="gugun"></select>
                </div>
            </div>
            <button id="selectAllBtn" class="styleBoxShadow styleHoverShadow">선택완료</button>
        </form>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
function Checkform() {
	var f = document.storeForm;
	
	var nat_check = document.querySelectorAll('input[name="nation"]:checked').length;
	if(nat_check == 0){
		alert("[나라별]에서 최소 한 곳 이상 선택해 주세요.");
        return false;
	};
	
	if(f.sido.value == "시/도 선택"){
		alert("위치를 설정해 주세요.");
        return false;
	}
};

$('document').ready(function() {
	var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["대덕구","동구","서구","유성구","중구"];
	var area4 = ["광산구","남구","동구",     "북구","서구"];
	var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["남구","동구","북구","중구","울주군"];
	var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth4_livingMap.css">

<!-- pageContent -- START -->
<div id="pageContent" class="livingMap">
	<div class="wrapper">
		<div id="livingMap" class="livingMapContainer">
			<section class="selectArea">
		      	<div class="selectBox">
		      		<h3 class="selectTitle">위치설정</h3>
			       	<select class="boxItem" v-model="sido" name="sido" id="sido"></select>
			       	<select class="boxItem" v-model="gugun" name="gugun" id="gugun"></select>
		      	</div>
		      	<p class="tip"><i class="fa-solid fa-hand"></i> 잠깐! 위치설정을 하지 않으실 경우 ‘서울특별시 강남구’ 기준으로 조회됩니다.</p>
		  	</section>
			<section class="categoryArea">
			    <div class="category-circle active" id="pharmacy" @click="inputKey($event)">
			        <img src="/images/livingMap_icon01.png" alt="">
                	<p class="circle-title">약국</p>
			    </div>
			    <div class="category-circle" id="laundry" @click="inputKey($event)">
			        <img src="/images/livingMap_icon02.png" alt="">
                	<p class="circle-title">코인세탁</p>
			    </div>
			    <div class="category-circle" id="daiso" @click="inputKey($event)">
			        <img src="/images/livingMap_icon03.png" alt="">
                	<p class="circle-title">다이소</p>
			    </div>
			    <div class="category-circle" id="mart" @click="inputKey($event)">
			        <img src="/images/livingMap_icon04.png" alt="">
                	<p class="circle-title">편의점</p>
			    </div>
			    <div class="category-circle" id="park" @click="inputKey($event)">
			        <img src="/images/livingMap_icon05.png" alt="">
                	<p class="circle-title">공원</p>
			    </div>
			</section>
			<section class="resultMap">
				<div class="map_wrap styleBoxRound styleBoxShadow">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				</div>
	            <div id="menu_wrap" class="styleBoxRound styleBoxShadow">
	                <ul id="placesList"></ul>
	            </div>
			</section>
			<!-- <section class="map_wrap">
				<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				<div id="menu_wrap" class="bg_white">
				    <ul id="placesList"></ul>
				    <div id="pagination"></div>
				</div>
			</section> -->
        </div>
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
var livingMap = new Vue({ 
    el: '#livingMap',
    data: {
    	map : {},
    	ps : {},
    	marker : {},
    	markers : [],
    	key : "약국",
    	sido : "서울특별시",
    	gugun : "강남구"
    }   
    , methods: {
    	inputKey : function (event) {
    		var self = this;
    		const targetId = event.currentTarget.id;
    		if (targetId=="pharmacy") {self.key= "약국";}
    		else if (targetId=="laundry") {self.key= "코인세탁";}
    		else if (targetId=="daiso") {self.key= "다이소";}
    		else if (targetId=="mart") {self.key= "편의점";}
    		else if (targetId=="park") {self.key= "공원";}
    		self.searchPlaces();
    	},
    	initMap() {
    		var container = document.getElementById('map');
			var options = {
					center: new kakao.maps.LatLng(33.450701, 126.570667), level: 3
			};
			this.map = new kakao.maps.Map(container, options);
			//마커추가하려면 객체를 아래와 같이 하나 만든다.
			var marker = new kakao.maps.Marker({
				position: this.map.getCenter()
			});
			marker.setMap(this.map);
			// 장소 검색 객체를 생성합니다
			this.ps = new kakao.maps.services.Places();
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			this.infowindow = new kakao.maps.InfoWindow({zIndex:1});
			// 키워드로 장소를 검색합니다
			this.searchPlaces();
   	    },
   	    addScript() {
   	      const script = document.createElement('script');
   	        /* global kakao */
   	        script.onload = () => kakao.maps.load(this.initMap);
   	        script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=30e998e52c143c51abd2dbc6754b52d3&libraries=services';
   	        document.head.appendChild(script);
   	    },
	   	// 키워드 검색을 요청하는 함수입니다
	   	 searchPlaces : function() {
	   		var self = this;
    		self.key = self.sido + " " + self.gugun + " " + self.key;
	   	    var keyword = self.key;			
	   	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	   	    this.ps.keywordSearch(keyword, this.placesSearchCB); 
	   	 },
	   	 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	   	 placesSearchCB : function(data, status, pagination) {
	   	     if (status === kakao.maps.services.Status.OK) {
	   	         // 정상적으로 검색이 완료됐으면 검색 목록과 마커를 표출합니다
	   	         this.displayPlaces(data);
	   	     } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	   	         alert('검색 결과가 존재하지 않습니다.');
	   	         return;
	   	     } else if (status === kakao.maps.services.Status.ERROR) {
	   	         alert('검색 결과 중 오류가 발생했습니다.');
	   	         return;
	   	     }
	   	 },
	   	 // 검색 결과 목록과 마커를 표출하는 함수입니다
	   	 displayPlaces : function(places) {
			var self = this;
	   	     var listEl = document.getElementById('placesList'), 
	   	     menuEl = document.getElementById('menu_wrap'),
	   	     fragment = document.createDocumentFragment(), 
	   	     bounds = new kakao.maps.LatLngBounds(), 
	   	     listStr = '';
	   	     // 검색 결과 목록에 추가된 항목들을 제거합니다
	   	     this.removeAllChildNods(listEl);
	   	     // 지도에 표시되고 있는 마커를 제거합니다
	   	     this.removeMarker();
	   	     for ( var i=0; i<places.length; i++ ) {
	   	         // 마커를 생성하고 지도에 표시합니다
	   	         var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	   	             marker = this.addMarker(placePosition, i), 
	   	             itemEl = this.getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	   	         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 LatLngBounds 객체에 좌표를 추가합니다
	   	         bounds.extend(placePosition);
	   	         // 마커와 검색결과 항목에 mouseover 했을때 해당 장소에 인포윈도우에 장소명을 표시합니다
	   	         // mouseout 했을 때는 인포윈도우를 닫습니다
	   	         (function(marker, title) {
	   	             kakao.maps.event.addListener(marker, 'mouseover', function() {
	   	            	self.displayInfowindow(marker, title);
	   	             });
	   	             kakao.maps.event.addListener(marker, 'mouseout', function() {
	   	                 self.infowindow.close();
	   	             });
	   	             itemEl.onmouseover =  function () {
	   	            	self.displayInfowindow(marker, title);
	   	             };
	   	             itemEl.onmouseout =  function () {
	   	                 self.infowindow.close();
	   	             };
	   	         })(marker, places[i].place_name);
	   	         fragment.appendChild(itemEl);
	   	     }
	   	     // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	   	     listEl.appendChild(fragment);
	   	     menuEl.scrollTop = 0;
	   	     // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	   	     this.map.setBounds(bounds);
	   	 },
	   	 // 검색결과 항목을 Element로 반환하는 함수입니다
	   	 getListItem : function(index, places) {
	   	     var el = document.createElement('li'),
	   	     itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	   	                 '<div class="info">' +
	   	                 '   <h5>' + places.place_name + '</h5>';
	   	     if (places.road_address_name) {
	   	         itemStr += '    <span>' + places.road_address_name + '</span>' +
	   	                     '   <span class="jibun gray">' +  places.address_name  + '</span>';
	   	     } else {
	   	         itemStr += '    <span>' +  places.address_name  + '</span>'; 
	   	     }
	   	       itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	   	                 '</div>';
	   	     el.innerHTML = itemStr;
	   	     el.className = 'item';
	   	     return el;
	   	 },
	   	 // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	   	 addMarker : function(position, idx, title) {
	   	     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	   	         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	   	         imgOptions =  {
	   	             spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	   	             spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	   	             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	   	         },
	   	         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	   	             marker = new kakao.maps.Marker({
	   	             position: position, // 마커의 위치
	   	             image: markerImage 
	   	         });
	   	     marker.setMap(this.map); // 지도 위에 마커를 표출합니다
	   	     this.markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	   	     return marker;
	   	 },
	   	 // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	   	 removeMarker : function() {
	   	     for ( var i = 0; i < this.markers.length; i++ ) {
	   	    	this.markers[i].setMap(null);
	   	     }   
	   	  	this.markers = [];
	   	 },
	   	 // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	   	 // 인포윈도우에 장소명을 표시합니다
	   	 displayInfowindow : function(marker, title) {
	   	     var self = this;
	   		 var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	   	     self.infowindow.setContent(content);
	   	     self.infowindow.open(self.map, marker);
	   	 },
	   	  // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	   	 removeAllChildNods : function(el) {   
	   	     while (el.hasChildNodes()) {
	   	         el.removeChild (el.lastChild);
	   	     }
	   	 }
    }   
    , mounted(){
    	window.kakao && window.kakao.maps ? this.initMap() : this.addScript();  
    }
    , created: function () {
	}
});

$('document').ready(function () {
    var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
    var area1 = ["전체", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
    var area2 = ["전체", "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"]; 
    var area3 = ["전체", "대덕구", "동구", "서구", "유성구", "중구"]; var area4 = ["전체", "광산구", "남구", "동구", "북구", "서구"]; 
    var area5 = ["전체", "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"]; var area6 = ["전체", "남구", "동구", "북구", "중구", "울주군"]; 
    var area7 = ["전체", "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"]; 
    var area8 = ["전체", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
    var area9 = ["전체", "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
    var area10 = ["전체", "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"]; 
    var area11 = ["전체", "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"]; 
    var area12 = ["전체", "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"]; 
    var area13 = ["전체", "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
    var area14 = ["전체", "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
    var area15 = ["전체", "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
    var area16 = ["전체", "제주시", "서귀포시"];
	
	// 시/도 선택 박스 초기화
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});

	// 시/도 선택시 구/군 설정
	$("select[name^=sido]").change(function () {
	    var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
	    var $gugun = $(this).next(); // 선택영역 군구 객체
	    $("option", $gugun).remove(); // 구군 초기화
	    if (area == "area0")
	        $gugun.append("<option value=''>구/군 선택</option>");
	    else {
	        $.each(eval(area), function () {
	            $gugun.append("<option value='" + this + "'>" + this + "</option>");
	        });
	    }
	});
	
	
	var cateBtn = $(".categoryArea .category-circle");
	var cateBox = $(".detail-category .cate-box");
	$(cateBox).addClass("active");

    $(cateBtn).on("click", function() {
    	$(this).addClass("active");
    	$(this).siblings().removeClass("active");
    	$("#" + cateIdBox).addClass("active");
    	$("#" + cateIdBox).siblings().removeClass("active");
    });
    $("#pharmacy").on("click", function() {
    	$(cateBox).addClass("active");
    });
});
</script>

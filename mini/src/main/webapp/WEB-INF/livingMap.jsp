<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>

	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:950px;}	
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
		
		.inputbox {display:none;}
		
		.r-category { display: flex; justify-content: center; margin-bottom: 40px;)}
		.r-category .box1 {text-align: center; margin: 0 25px; cursor: pointer;}
		.r-category .box1 .category-circle {
            width:100px;
            height: 100px;
            border-radius: 50%;
            background: rgba(232, 227, 227, 0.959);
        }
		 .r-category .box1 .category-circle:hover {background: #bdee71;}
		 .r-category .box1 .category-circle:hover {background: #bdee71;}
		 .box1 .c-icon { position:relative; bottom: 60px; }
		 .clicked {background: black;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
        <div id="app">
            <div id="container">
		        <div class="r-category">
		            <div class="box1" id="pharmacy" @click="inputKey($event)">
		                <div class="category-circle"></div>
		                <i class="c-icon fa-solid fa-prescription-bottle-medical fa-2xl"></i>
		                <div>약국</div>
		            </div>
		            <div class="box1" id="laundry" @click="inputKey($event)">
		                <div class="category-circle"></div>
		                <i class="c-icon fa-solid fa-shirt fa-2xl"></i>
		                <div>코인세탁</div>
		            </div>
		            <div class="box1" id="daiso" @click="inputKey($event)">
		                <div class="category-circle"></div>
		                <i class="c-icon fa-solid fa-bag-shopping fa-2xl"></i>
		                <div>다이소</div>
		            </div>
		            <div class="box1" id="mart" @click="inputKey($event)">
		                <div class="category-circle"></div>
		                <i class="c-icon fa-solid fa-shop fa-2xl"></i>
		                <div>편의점</div>
		            </div>
		            <div class="box1" id="park" @click="inputKey($event)">
		                <div  class="category-circle"></div>
		                <i class="c-icon fa-solid fa-tree fa-2xl"></i>
		                <div>공원</div>
		            </div>
		        </div>
                <div class="map_wrap">
                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                
                    <div id="menu_wrap" class="bg_white">
                        <div class="option">
                            <div class="inputbox">
                                <template>
                                    키워드 : <input type="text" value="더조은컴퓨터학원" id="keyword" size="15">
                                </template>
                            </div>
                        </div>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
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
    	map : {},
    	ps : {},
    	marker : {},
    	markers : []
    }   
    , methods: {
    	inputKey : function (event) {
    		var self = this;
    		const targetId = event.currentTarget.id;
    		if (targetId=="pharmacy") {$("#keyword").val("약국"); self.searchPlaces();}
    		else if (targetId=="laundry") {$("#keyword").val("코인세탁"); self.searchPlaces();}
    		else if (targetId=="daiso") {$("#keyword").val("다이소"); self.searchPlaces();}
    		else if (targetId=="mart") {$("#keyword").val("편의점"); self.searchPlaces();}
    		else if (targetId=="park") {$("#keyword").val("공원"); self.searchPlaces();}
    		
    		

    	},
    	
    	initMap() {
    		var container = document.getElementById('map');
    	       var options = {
    	         center: new kakao.maps.LatLng(33.450701, 126.570667),
    	         level: 3
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
	
	   	     var keyword = document.getElementById('keyword').value;
	
	   	     if (!keyword.replace(/^\s+|\s+$/g, '')) {
	   	         alert('키워드를 입력해주세요!');
	   	         return false;
	   	     }
	
	   	     // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	   	     this.ps.keywordSearch( keyword, this.placesSearchCB); 
	   	 },
	
	   	 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	   	 placesSearchCB : function(data, status, pagination) {
	   	     if (status === kakao.maps.services.Status.OK) {
	
	   	         // 정상적으로 검색이 완료됐으면
	   	         // 검색 목록과 마커를 표출합니다
	   	         this.displayPlaces(data);
	
	   	         // 페이지 번호를 표출합니다
	   	         this.displayPagination(pagination);
	
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
	
	   	         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	   	         // LatLngBounds 객체에 좌표를 추가합니다
	   	         bounds.extend(placePosition);
	
	   	         // 마커와 검색결과 항목에 mouseover 했을때
	   	         // 해당 장소에 인포윈도우에 장소명을 표시합니다
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
	
	   	 // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	   	 displayPagination : function(pagination) {
	   	     var paginationEl = document.getElementById('pagination'),
	   	         fragment = document.createDocumentFragment(),
	   	         i; 
	
	   	     // 기존에 추가된 페이지번호를 삭제합니다
	   	     while (paginationEl.hasChildNodes()) {
	   	         paginationEl.removeChild (paginationEl.lastChild);
	   	     }
	
	   	     for (i=1; i<=pagination.last; i++) {
	   	         var el = document.createElement('a');
	   	         el.href = "#";
	   	         el.innerHTML = i;
	
	   	         if (i===pagination.current) {
	   	             el.className = 'on';
	   	         } else {
	   	             el.onclick = (function(i) {
	   	                 return function() {
	   	                     pagination.gotoPage(i);
	   	                 }
	   	             })(i);
	   	         }
	
	   	         fragment.appendChild(el);
	   	     }
	   	     paginationEl.appendChild(fragment);
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
</script>

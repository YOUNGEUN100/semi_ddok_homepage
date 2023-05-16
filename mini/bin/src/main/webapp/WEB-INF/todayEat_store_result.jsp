<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
.styleBoxRound {border-radius:1.5em; overflow:hidden;}
.styleBoxShadow {box-shadow:0 0 10px 0 rgba(0,0,0,0.1);}

.resultMenu {text-align:center; margin-bottom:5em;}
.resultMenuTitle {font-size:1.75em;}
.resultMenuTitle span {font-size:1.25em;}
.imgBox {width:300px; height:300px; border-radius:50%; background:var(--base-colorBasicGray); margin:1em auto 2em;}
.replayBtn {font-weight:600;}
.replayBtn i {margin-right:0.2em;}
.resultMapTitle {font-size:1.625em; font-weight:500; margin-bottom:0.5em;}
.resultMapTitle span {font-weight:700;}
.resultMap {width:100%; position:relative; display:flex; flex-flow:row wrap; justify-content:space-between; align-items:stretch;}
.resultMap .map_wrap {width:calc(100% - 370px); position:relative; height:500px;}
.resultMap #menu_wrap {width:350px; height:500px; overflow-y:auto; text-align:justify; font-size:0.875em; line-height:1.25; background:var(--base-colorWhite); padding:0.5em;}
.resultMap #menu_wrap h5 {font-size:1.125em;}
.infowindow {font-size:0.875em; font-weight:500;}

#placesList li {list-style:none;}
#placesList .item {position:relative; border-bottom:1px solid var(--base-colorDeepGray); overflow:hidden; cursor:pointer; min-height:65px; transition:all 0.2s ease-in;}
#placesList .item:hover h5 {color:var(--main-colorRed);}
#placesList .item:last-child {border-bottom:0;}
#placesList .item span {display:block; margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow:ellipsis; overflow:hidden; white-space:nowrap; transition:all 0.2s ease-in;}
#placesList .item .info {padding:1.2em 0 1em 4em;}
#placesList .info .gray {color:var(--base-colorDarkGray);}
#placesList .info .jibun {padding-left:26px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {font-weight:600; color:var(--main-colorGreen);}
#placesList .item .markerbg {float:left; position:absolute; width:36px; height:37px; margin:10px 0 0 10px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position:0 -10px;}
#placesList .item .marker_2 {background-position:0 -56px;}
#placesList .item .marker_3 {background-position:0 -102px}
#placesList .item .marker_4 {background-position:0 -148px;}
#placesList .item .marker_5 {background-position:0 -194px;}
#placesList .item .marker_6 {background-position:0 -240px;}
#placesList .item .marker_7 {background-position:0 -286px;}
#placesList .item .marker_8 {background-position:0 -332px;}
#placesList .item .marker_9 {background-position:0 -378px;}
#placesList .item .marker_10 {background-position:0 -423px;}
#placesList .item .marker_11 {background-position:0 -470px;}
#placesList .item .marker_12 {background-position:0 -516px;}
#placesList .item .marker_13 {background-position:0 -562px;}
#placesList .item .marker_14 {background-position:0 -608px;}
#placesList .item .marker_15 {background-position:0 -654px;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<jsp:include page="/layout/includeLoading.jsp"></jsp:include>
		<div id="app" class="resultContainer">
			<div class="resultMenu">
	 			<h3 class="resultMenuTitle">
					오늘 ‘<span id="menuName">{{info.menuName}}</span>’ 어때요?
				</h3>
				<div class="imgBox">
					<img src="" alt="">
				</div>
				<a class="replayBtn" href="/todayEat/store.do"><i class="fa-solid fa-reply"></i> 다시 추천받기</a>
			</div>
			<h4 class="resultMapTitle"><span id="location"></span>에서 찾아본 <span>{{info.menuName}} 맛집</span>은 여기래요!</h4>
			<div class="resultMap">
				<div class="map_wrap styleBoxRound styleBoxShadow">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				</div>
	            <div id="menu_wrap" class="styleBoxRound styleBoxShadow">
	                <ul id="placesList"></ul>
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
		list : [], 
		info : {},
		param : {
			purpose : "${hmap.purpose}",
			situation : "${hmap.situation}",
			nation : ${hmap.nation}
		},
		location : ${hmap.location},
    	map : {},
    	ps : {},
    	marker : {},
    	markers : []
    }   
    , methods: {
		fnGetStoreResult : function() {
            var self = this;
            var nparmap = self.param;
            nparmap.nation = JSON.stringify(self.param.nation);

            var location = self.location;
            location = JSON.stringify(self.location);
            var storeLoc = document.getElementById("location");
            if(self.location[1] == "전체") {
            	storeLoc.innerHTML = self.location[0];
            } else {
            	storeLoc.innerHTML = self.location[0].concat(" ", self.location[1]);
            }
            
            
            $.ajax({
                url:"/todayEat/store/result.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                    self.info = data.info;
                    console.log(self.info);
                }
            }); 
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
			 var self = this;
			 var storeLoc = document.getElementById("location").innerText;
			 var storeMenu = document.getElementById("menuName").innerText;
			 var keyword = storeLoc.concat(" ", storeMenu, " 맛집");
			 console.log(keyword);
	
	   	     // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	   	     this.ps.keywordSearch( keyword, this.placesSearchCB); 
	   	 },
	
	   	 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	   	 placesSearchCB : function(data, status) {
	   	     if (status === kakao.maps.services.Status.OK) {
	
	   	         // 정상적으로 검색이 완료됐으면
	   	         // 검색 목록과 마커를 표출합니다
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
	
	   	 // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	   	 // 인포윈도우에 장소명을 표시합니다
	   	 displayInfowindow : function(marker, title) {
	   	     var self = this;
	   		 var content = '<div class="infowindow" style="padding:5px;z-index:1;">' + title + '</div>';
	
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
		var self = this;
		self.fnGetStoreResult();
	}
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth1_todayEat.css">

<!-- pageContent -- START -->
<div id="pageContent" class="todayEat">
	<div class="wrapper">
		<jsp:include page="/layout/includeLoading.jsp"></jsp:include>
		<div id="result" class="resultContainer">
			<div class="resultMenu">
	 			<h3 class="resultMenuTitle">
					<span v-if="menuFlg">{{message}}</span> 오늘 ‘<span id="menuName">{{info.menuName}}</span>’ 어때요?
				</h3>
				<div class="imgBox">
					<img :src="info.imgPath" alt="menuImg">
				</div>
				<button class="replayBtn" @click="fnReplay()"><i class="fa-solid fa-arrow-rotate-left"></i> 다시 추천받기</button>
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
var result = new Vue({ 
    el: '#result',
    data: {
		list : [], 
		info : {},
		menuFlg : false,
		message : "",
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
    	// 전체 메뉴 랜덤하게 가져오기
    	fnGetMenu : function() {
            var self = this;
            var nparmap = {};
            
            $.ajax({
                url:"/todayEat/menu/result.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                    self.info = data.menu;
                  // console.log("menu 데이터는" + data.menu);
                  //  console.log(data.menu);
                    self.message = "검색결과가 없어요. 대신";
                    self.menuFlg = true;
                  
                }
            }); 
		},
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
                  //  console.log("info결과값");
                  //  console.log(self.info);
                  // 검색값이 없을 때 전체 메뉴에서 랜덤하게 추천
                    if (!self.info) {self.fnGetMenu();  }
                }
            }); 
		},
		fnReplay : function() {
			location.href = "/todayEat/store.do";
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
		//self.fnGetMenu();
		self.fnGetStoreResult();
         
	}
});
</script>
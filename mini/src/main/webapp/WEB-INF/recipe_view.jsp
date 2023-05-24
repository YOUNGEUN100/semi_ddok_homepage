<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth3_recipe.css">

<!-- pageContent -- START -->
<div id="printarea">
<div id="pageContent" class="recipe typeView">
	<div class="wrapper">
		<div id="recipeView" class="recipeViewContainer">
            <section class="recipe-info-section">
                <div class="recipe-thumb-area styleBoxRound styleBoxShadow">
                    <div class="re-view-cnt noPrint">
                        <i class="fa-solid fa-eye"></i>
                        <span>{{info.recipeHits}}</span>
                    </div>
                    <img :src="info.imgPath">
                </div>
                <div class="recipe-info-area">
                    <div class="info-box typeBoxArea styleBoxRound styleBoxShadow">
	                    <div class="info_txt">
	                    	<p class="hashtag">{{info.hashtag}}</p>
	                    	<h3 class="title">{{info.recipeName}}</h3>
	                    </div>
                        <div class="info_keyword">
                            <div class="type">
                                <img class="re-icon" src="/images/icon/icon_recipe01.png">
                                <h5>조리도구</h5>
                                <p>{{info.tname}}</p>
                            </div>
                            <div class="type">
                                <img class="re-icon" src="/images/icon/icon_recipe02.png">
                                <h5>조리시간</h5>
                                <p>{{info.time}}</p>
                            </div>
                            <div class="type">
                                <img class="re-icon" src="/images/icon/icon_recipe03.png">
                                <h5>난이도</h5>
                                <p>{{info.difficulty}}</p>
                            </div>
                        </div>
                    </div>
                    <div class="recipe-btn-Box noPrint">
                        <div class="save-btn styleBoxShadow styleHoverShadow" @click="fnSave()">레시피 저장하기</div>
                        <div class="print-btn styleBoxShadow styleHoverShadow" @click="fnPrint()"><i class="fa-solid fa-print"></i></div>
                        <div class="share-btn styleBoxShadow styleHoverShadow" @click="fnClip()"><i class="fa-solid fa-share-nodes"></i></div>
                    </div>
                </div>
            </section>

            <!-- 레시피 만드는 방법 시작 -->
            <section class="ingredient-section typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="section-title">
                    <img class="re-icon" src="/images/icon/icon_recipe04.png">
                    <span>레시피 재료</span>
                </h3>
                <div class="ingre-info">{{info.cookIngre}}</div>
            </section>
            <section class="cook-section typeBoxArea styleBoxRound styleBoxShadow">
                <h3 class="section-title">
                    <img class="re-icon" src="/images/icon/icon_recipe05.png">
                    <span>만드는 방법</span>
                </h3>
                <div class="cook-index" v-for="(item, index) in list">
                    <img class="img-index" :src="item.imgPath">
                    <div class="text-index">
                        <h4>Step {{item.cookIndex}}</h4>
                        <p>{{item.cookContent}}</p>
                    </div>
                </div>
            </section>
            <!-- 레시피 만드는 방법 끝 -->
            
			<!-- adminCtrlBox -- Don't touch -->
			<template>
				<div v-if="sessionStatus=='A'" id="adminCtrlArea">
					<i id="adminBtn" class="fa-solid fa-gear fa-spin styleBoxShadow styleHoverShadow"></i>
					<div id="adminBox" class="styleBoxShadow">
						<div class="boxTitle">’<span class="pageName"></span>’ 게시판</div>
						<div class="btnSet">
							<button class="delBtn" @click="fnRemoveRecipe()">삭제</button>
						</div>
					</div>
				</div>
			</template>
			<!-- adminCtrlBox -- Don't touch -->
        </div>
    </div>
</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	var recipeView = new Vue({ 
	    el: '#recipeView',
	    data: {
		    list : [] 
		    , info : {}
		    , recipeNo : "${map.recipeNo}"
		    , sessionId: "${sessionId}"    
		    , sessionStatus : "${sessionStatus}"
	    } 
	    , methods: {
	    	// 레시피 정보 보여주기
	        fnGetInfo : function(){
	            var self = this;
	            var nparmap = {recipeNo : self.recipeNo};
	            // 레시피 설명
	            $.ajax({
	                url:"/recipe/view.dox",
	                dataType:"json",
	                type : "POST",
	                data : nparmap,
	                success : function(data) {
	                    self.info = data.info;
	                    console.log(self.info);
	                }
	            });
	        }
		    // 만드는 방법 리스트 가져오기
			,fnGetCookMethod : function() {
				var self = this;
				var nparmap = {recipeNo : self.recipeNo};
				$.ajax({
					url: "/recipe/cook.dox",
					dataType: "json",
					type: "POST",
					data : nparmap,
					success : function(data) {
						 self.list = data.list;
						 console.log(self.list);
					}
				})
			}
			// 주소 복사
            , fnClip: function () {
                navigator.clipboard.writeText(window.location.href);
                alert("복사되었습니다.");
            }
			// 레시피 저장
			, fnSave : function() {
				var self = this;
				console.log(self.sessionId);
				console.log(self.sessionStatus);
				if (self.sessionId == "") {
                	alert("로그인을 해주세요");
                	return;
                }
                if (!confirm("레시피를 저장하시겠습니까?")) {
                    return;
                }
                var nparmap = {userId : self.sessionId, recipeNo : self.recipeNo};
    	        $.ajax({
    	            url:"/recipe/mypageSave.dox",
    	            dataType:"json",	
    	            type : "POST", 
    	            data : nparmap,
    	            success : function(data) {
    	            	alert(data.message);
    	            }
    	        }); 
			}
			// 레시피 인쇄
			, fnPrint : function() {
				let printHtml = $('#printarea').html();
				let win = window.open('','_blank','fullscreen');
				 
				//win.document.write('');
				win.document.write('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">');
				win.document.write('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">');
				win.document.write('<link rel="stylesheet" href="/css/pageStyle/pageStyle.css">');
				 
				win.document.write('<link rel="stylesheet" href="/css/common.css">');
				win.document.write('<link rel="stylesheet" href="/css/layoutStyle.css">');
				win.document.write('<link rel="stylesheet" href="/css/mainStyle.css">');
				win.document.write('<link rel="stylesheet" href="/css/pageStyle/depth3_recipe.css">');
				win.document.write("<html><head></head><body>");
				win.document.write(printHtml);
				win.document.write("</body></html>");
				  
				win.document.close();
				setTimeout(function() {
					win.focus();
					win.print();
					win.close();
				}, 1000);
			}
			// 레시피 삭제
			, fnRemoveRecipe : function() {
				 var self = this;
        		 if (!confirm("레시피를 삭제하시겠습니까?")) return;
                 var nparmap = {recipeNo : self.recipeNo};
     	        $.ajax({
     	            url:"/recipe/remove.dox",
     	            dataType:"json",	
     	            type : "POST", 
     	            data : nparmap,
     	            success : function(data) { 
     	            	alert("레시피가 삭제되었습니다.");
     	            	location.href="/recipe.do";
     	            }
     	        }); 
			}
	    
	        
	    }   
	    , created: function () {
	        var self = this;
	        self.fnGetInfo();
	        self.fnGetCookMethod();
	    }
	});
	

	
	
</script>

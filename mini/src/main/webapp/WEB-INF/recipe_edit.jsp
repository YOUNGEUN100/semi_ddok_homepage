<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth3_recipe.css">

<!-- pageContent -- START -->
<div id="pageContent" class="recipe typeEdit">
	<div class="wrapper">
		<div id="recipeEdit" class="recipeEditContainer">
            <fieldset class="fieldset-area typeBoxArea styleBoxRound styleBoxShadow">
            	<h3 class="area-title">레시피 정보</h3>
                <ul class="area-list">
					<li class="no">
						<label for="recipe_no" class="enrol-re" >레시피 번호</label>
						<input id="recipe_no" name="recipe_no" type="number" min="1" max="999999" v-model="info.recipeNo" placeholder="숫자만 입력가능" required>
						<button id="no_btn" @click="fnCheck()">레시피번호 중복 확인</button>
					</li>
					<li class="name">
						<label for="recipe_name" class="enrol-re">레시피 제목</label>
						<input id="recipe_name" name="recipe_name" v-model="info.recipeName" type="text" required>
					</li>
					<li class="hashtag">
						<label for="recipe_hashtag" class="enrol-re">해시태그</label>
						<input id="recipe_hashtag" name="recipe_hashtag" v-model="info.hashtag" type="text" required>
					</li>
					<li class="img">
						<label for="recipe_img" class="enrol-re">대표 사진</label>
						<form action="" class="filebox">
							<input type="file" id="file1" name="file1">
						</form>
					</li>
					<li class="cate">
						<label class="enrol-re">카테고리</label>
						<select class="sel" name="purpose" id="purpose" v-model="info.pcode">
						    <option value="" selected="selected" disabled hidden>목적별</option>
						    <option value="REF">냉장고털이</option>
						    <option value="HAN">해장</option>
						    <option value="SNA">간식</option>
						    <option value="NIG">야식</option>
						    <option value="DIE">다이어트</option>
						</select>
						<select class="sel" name="howto" id="howto" v-model="info.hcode">
						    <option value="" selected="selected" disabled hidden>방법별</option>
						    <option value="ROA">구이/부침</option>
						    <option value="SOU">국탕찌개</option>
						    <option value="FRY">볶음/조림</option>
						    <option value="MIX">무침/비빔</option>
						    <option value="ETC">기타</option>
						</select>
						<select class="sel" name="tool" id="tool" v-model="info.tcode">
						    <option value="" selected disabled hidden>도구별</option>
						    <option value="POT">냄비/후라이팬</option>
						    <option value="MIC">전자레인지</option>
						    <option value="OVE">에어프라이어/오븐</option>
						    <option value="ETC">기타</option>
						</select>
					</li>
					<li class="type">
	                    <label class="enrol-re">요리정보</label>
						<span class="time">
							<strong>시간</strong>
							<select class="sel" name="time" id="time" v-model="info.time">
								<option value="" selected disabled hidden>시간</option>
								<option value="5분이내">5분이내</option>
								<option value="10분이내">10분이내</option>
								<option value="15분이내">15분이내</option>
								<option value="20분이내">20분이내</option>
								<option value="30분이내">30분이내</option>
								<option value="60분이내">60분이내</option>
								<option value="90분이내">90분이내</option>
								<option value="2시간이내">2시간이내</option>
								<option value="2시간이상">2시간이상</option>
							</select>
						</span>
						<span class="level">
							<strong>난이도</strong>
							<select class="sel" name="difficult" id="difficult" v-model="info.difficulty">
								<option value="" selected disabled hidden>난이도</option>
								<option value="핵쉬움">핵쉬움</option>
								<option value="쉬움">쉬움</option>
								<option value="보통">보통</option>
								<option value="어려움">어려움</option>
								<option value="핵어려움">핵어려움</option>
							</select>
						</span>
					</li>
					<li class="ingre">
						<label class="enrol-re">재료분류</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode"  value="POT"> 감자/고구마</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode"  value="VEG"> 채소</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="TOP"> 두부</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="CHE"> 우유/치즈</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="EGG"> 계란</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="CHI"> 닭고기</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="BRE"> 식빵</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="TUN"> 참치캔</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="HAM"> 햄</label>
						<label class="ingre-ch"><input type="checkbox" v-model="info.icode" value="RAM"> 라면</label>
					</li>
					<li class="more">
						<label for="recipe-ingre" class="enrol-re">재료상세</label> 
						<input id="recipe-ingre" name="recipe-ingre" type="text" v-model="info.cookIngre">
					</li>
				</ul>
			</fieldset>
            <fieldset class="fieldset-area typeBoxArea styleBoxRound styleBoxShadow">
            	<h3 class="area-title">레시피 순서</h3>
				<div id="recipe-step">
					<!-- <div class="step-box">
						<p id="step-num">Step 1</p>
						<div id="re-img">
							<label class="recipe-img">요리 이미지</label>
							<form action="" class="filebox">
								<input type="file" :id="'file' + index" class="file2" name="file2">
							</form>
						</div>
						<div id="re-info">
							<label class="recipe-info">레시피 단계 설명</label>
							<textarea id="memo" rows="5" v-model="cookContent"></textarea>
						</div>
					</div> -->
					<div class="step-box" v-for="n in indexNum">
						<p id="step-num">Step {{n}}</p>
						<div id="re-img">
							<label class="recipe-img">레시피 이미지</label>
							<form action="" class="filebox">
								<input type="file" :id="'file' + (n + 1)" name="file2">
							</form>
						</div>
						<div id="re-info">
							<label class="recipe-info">레시피 단계 설명</label>
							<textarea id="memo" rows="5" :id="'cookContent' + (n + 1)" v-model="cookContent"></textarea>
						</div>
					</div>
					
				</div>
				<button id="add-btn" class="btn" @click="fnAddIndex()">
					<i class="fa-solid fa-circle-plus"></i>
					<span>Step 추가</span>
				</button>
			</fieldset>
			
			<!-- btnArea -- Don't touch -->
			<div class="btnArea">
				<button class="addBtn" @click="fnEnroll()">등록</button>
				<button class="cancelBtn" onclick="location.href='/recipe.do'">취소</button>
			</div>
			<!-- btnArea -- Don't touch -->
        </div>
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
//3. 뷰에 vue2editor 추가
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var recipeEdit = new Vue({
	el: '#recipeEdit',
	data: {
	 	info : {
			recipeNo : "",
			recipeName : "",
			hashtag : "",
			pcode : "",
			hcode : "",
			tcode : "",
			icode : [],
			time : "",
			difficulty : "",
			cookIngre :"",
			imgNo : ""
		},
		cnt : 1,
		cookContent : "",
		enrollFlg : false,
		indexNum : 1
	}
	// 4. 컴포넌트 추가
	, components: {VueEditor}
	, methods: {
		// 레시피 등록
		fnEnroll : function() {
			var self = this;
			if (self.enrollFlg==false){alert("레시피번호 중복 확인을 해주세요.");return;} 
			//console.log($("#file1")[0].files[0]);
   	     	if (!$("#file1")[0].files[0]) {alert("레시피 사진을 등록해주세요.");return;} 
   	     	if (!self.info.recipeName) {alert("레시피 이름을 작성해주세요."); return;}
   	     	self.info.icode = JSON.stringify(self.info.icode);
			console.log(self.info.icode);
			var nparmap = {
							recipeNo : self.info.recipeNo,
							recipeName : self.info.recipeName,
							hashtag : self.info.hashtag,
							pcode : self.info.pcode,
							hcode : self.info.hcode,
							tcode : self.info.tcode,
							icode : self.info.icode,
							time : self.info.time,
							difficulty : self.info.difficulty,
							cookIngre : self.info.cookIngre
			}
			$.ajax({
				url:"/recipe/save.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) {  
					
					if (!$("#file1")[0].files[0]) return;
					var form = new FormData();
					form.append( "file1",  $("#file1")[0].files[0]);
					form.append( "recipeNo",  data.recipeNo); // pk
					self.upload(form); 
					
					if (!$("#file2")[0].files[0]) return;
					for(var i=2; i<self.indexNum+2; i++){
						var form = new FormData();
						form.append( "file2",  $("#file" + i)[0].files[0]);
						form.append( "recipeNo",  data.recipeNo); // pk
						//form.append("cookIndex", self.cnt);
						//form.append("cookContent", self.cookContent);
						//console.log(form);
						console.log("fnEnroll의 i");
						console.log(i);
						self.uploadCook(form, i-1); 
					}
					
					alert("등록되었습니다!");
					
					//location.href="/recipe.do";
				}
			});
		},
		fnAddIndex : function() {
	       	var self = this;
	       	self.cnt += 1;
	       	self.indexNum += 1;
	       	console.log(self.cnt);
	       	
	       	/* document.getElementById("recipe-step").innerHTML += 
				` <div class="step-box">
					<p id="step-num">Step ${cnt}</p>
					<div id="re-img">
						<label class="recipe-img">레시피 이미지</label>
						<form action="" class="filebox">
							<input type="file" id="'file2'" name="file2">
						</form>
					</div>
					<div id="re-info">
						<label class="recipe-info">레시피 단계 설명</label>
						<textarea id="memo" rows="5" v-model="cookContent"></textarea>
					</div>
				</div> ` */
       },
       // 파일 업로드
       upload : function(form){
    	   var self = this;
	        $.ajax({
	        	url : "/recipe/fileUpload.dox",
	        	type : "POST",
	        	processData : false,
	        	contentType : false,
	        	data : form,
	        	success:function(response) {
	        		
	        	}
	        });
	    },
	 // 요리과정 이미지 업로드
    	uploadCook : function(form, num){
    		var self = this;
         	$.ajax({
            	url : "/cook/fileUpload.dox",
	           	type : "POST",
	           	processData : false,
	           	contentType : false,
	           	data : form,
	           	success:function(response) { 
	           		console.log("uploadCook의 num");
	           		console.log(num);
	           		self.fnCookContent(num);
          		 }
       		});
         	
		},
		// 요리과정 글 업로드
		fnCookContent : function(num) {
            var self = this;
            var cookNum = num;
            console.log("cookNum은");
            console.log(cookNum);
            var nparmap = {recipeNo: self.info.recipeNo, cookIndex: cookNum, cookContent: self.cookContent}
	        $.ajax({
	            url: "/cook/content.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log("fnCookContent의 num");
	            	console.log(num);
	            }
	        }); 
        },
		// 레시피 번호 중복 확인
	    fnCheck : function(){
	   	 	var self = this;
	   	 	var nparmap = {recipeNo : self.info.recipeNo};
	        $.ajax({
	            url:"/recipe/check.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	if(data.cnt > 0){
	            		self.enrollFlg = false;
	            		alert("레시피 번호가 중복되었습니다.");
	            	}
	            	else{
	            		self.enrollFlg = true;
	            		alert("사용가능한 레시피 번호입니다.");
	            	}
	            }
	       	}); 
  	 	}
   } // 메소드 end
   , created: function () {
		var self = this;
		self.info.imgNo += 1;
	}
});
</script>

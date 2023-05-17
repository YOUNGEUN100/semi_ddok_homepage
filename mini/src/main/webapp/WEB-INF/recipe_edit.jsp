<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<link rel="stylesheet" href="/css/pageStyle/depth3_recipe.css">

<!-- pageContent -- START -->
<div id="pageContent" class="recipe typeEdit">
	<div class="wrapper">
		<div id="recipeEdit" class="recipeEditContainer">
            <fieldset>
            	<legend>레시피 정보</legend>
                <ul>
					<li>
						<label for="recipe_no" class="enrol-re" >레시피 번호</label>
						<input id="recipe_no" name="recipe_no" type="number" min="1" v-model="info.recipeNo" placeholder=" 레시피 번호를 입력하세요" required>
						<button id="no_btn" @click="fnCheck()">레시피번호 중복 확인</button>
					</li>
					<li>
						<label for="recipe_name" class="enrol-re">레시피 제목</label>
						<input id="recipe_name" name="recipe_name" v-model="info.recipeName" type="text" required>
					</li>
					<li>
						<label for="recipe_img" class="enrol-re">대표 사진</label>
						<form action="">
							<input type="file" id="file1" name="file1">
						</form>
					</li>
					<li>
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
				 	<li>
	                    <label class="enrol-re">요리정보</label>
						<span>
							<span>시간</span>
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
						<span>
							<span>난이도</span>
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
					<li>
						<label class="enrol-re">재료분류</label>
						<label class="ingre-ch"><input type="checkbox" value="POT"> 감자/고구마</label>
						<label class="ingre-ch"><input type="checkbox" value="VEG"> 채소</label>
						<label class="ingre-ch"><input type="checkbox" value="TOP"> 두부</label>
						<label class="ingre-ch"><input type="checkbox" value="CHE"> 우유/치즈</label>
						<label class="ingre-ch"><input type="checkbox" value="EGG"> 계란</label>
						<label class="ingre-ch"><input type="checkbox" value="CHI"> 닭고기</label>
						<label class="ingre-ch"><input type="checkbox" value="BRE"> 식빵</label>
						<label class="ingre-ch"><input type="checkbox" value="TUN"> 참치캔</label>
						<label class="ingre-ch"><input type="checkbox" value="HAM"> 햄</label>
						<label class="ingre-ch"><input type="checkbox" value="RAM"> 라면</label>
					</li>
					<li>
						<label for="recipe-ingre" class="enrol-re">재료상세</label> 
						<input id="recipe-ingre" name="recipe-ingre" type="text" v-model="info.cookIngre">
					</li>
				</ul>
			</fieldset>
			<fieldset>
				<legend>요리 순서</legend>
				<div id="recipe-step">
					<div id="step-num"><b>Step1</b></div>
					<div id="re-img">
						<label>레시피 이미지</label>
						<form action="">
							<input type="file" id="fileR" name="fileR">
						</form>
					</div>
					<div id="re-info">
						<label class="recipe-info">레시피 단계 설명</label>
						<textarea id="memo" cols="140" rows="5"></textarea>
					</div>
				</div>
				<div id="add-area" class="btn" @click="fnAddIndex()">
					<i class="fa-solid fa-circle-plus fa-xl"></i>
					<button id="add-btn">Step 추가</button>
				</div>
			</fieldset>
			<div class="btn_box">
				<button class="btn" @click="fnEnroll()">등록</button>
			</div>
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
			pcode : "",
			hcode : "",
			tcode : "",
			time : "",
			difficulty : "",
			cookIngre :"",
			ingredient : "",
			imgNo : ""
		},
		cnt : 1,
		content : "",
		enrollFlg : false
	}
	// 4. 컴포넌트 추가
	, components: {VueEditor}
	, methods: {
		fnEnroll : function() {
			var self = this;
			if (!enrollFlg){
				alert("레시피 번호가 중복되었습니다.");
			}
			return;
			
			var nparmap = self.info;
			$.ajax({
				url:"/recipe/save.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) {  
					console.log(data);
					alert("등록되었습니다!");
					
					var form = new FormData();
					form.append( "file1",  $("#file1")[0].files[0] );
					form.append( "recipeNo",  data.recipeNo); // pk
					self.upload(form); 
					
					location.href="/recipe.do";
				}
			});
		},
		fnAddIndex : function() {
	       	var self = this;
	       	self.cnt += 1;
	       	console.log(self.cnt);
	       	
	       	document.getElementById("recipe-step").innerHTML += 
				`<div id="step-num"><b>Step ${cnt}</b></div>
			     <div>
			        <label>레시피 이미지</label>
			        <form action="">
			            <input type="file">
			            <input type="submit">
			        </form>
			     </div>
			     <div>
			        <label class="recipe-info">레시피 단계 설명</label>
			        <textarea id="memo" cols="100" rows="5"></textarea>
			     </div> `
       },
       // 파일 업로드
       upload : function(){
    	   var self = this;
	        $.ajax({
	        	url : "/fileUpload.dox",
	        	type : "POST",
	        	processData : false,
	        	contentType : false,
	        	data : form,
	        	success:function(response) {
	        		
	        	}
	        });
	    },
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

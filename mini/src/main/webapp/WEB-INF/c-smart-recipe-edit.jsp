<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


<style>
      /* style START */
        h1 {
            text-align: center;
        }
        legend {
            font-size: x-large;
        }
        fieldset {
            width: 100%;
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 10px;
            padding: 20px 30px;
            margin: 40px 0;
        }
        fieldset li {
            margin: 20px 5px;
        }
        fieldset .enrol-re {
            float: left;
            width: 100px;
            font-weight: bold;
            /* font-size: large; */
        }
        .recipe-file {
            display: flex;
        }
        fieldset li input[type=text] {
            border-radius: 5px;
            width: 80%;
        }
        select {
            width: 100px;
            margin-right: 10px;
        }
        .ingre-ch {
            margin-right: 10px;
        }
        .btn_box button {
            border: none;
            width: 100px;
            height: 40px;
            margin-left: 16px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
            }
        #add-area {
            text-align: center;
            margin:10px 0;
        }
        #add-area #add-btn {
            border: none;
            background: none;
            padding:5px;
            font-size: medium;
        }
        #step-num{
            margin-right: 30px;
        }
        #re-info {
            margin-bottom: 20px;
        }
        #re-img {
            display: flex;
        }
        #recipe-step label {
                float: left;
                width: 130px;
                /* font-size: large; */
        }
        .btn:hover {
            cursor: pointer;
        }
	 
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
        <!-- wrap START -->
        <div id="app">
            <h1>레시피 등록</h1>
            <fieldset>
                <legend>레시피 정보</legend>
                  <li>
                    <label for="recipe_name" class="enrol-re">레시피 제목</label>
                    <input id="recipe_name" name="recipe_name" type="text" required>
                  </li>
                  <li class="recipe-file">
                  	<!--
                    <label for="recipe_img" class="enrol-re">대표 사진</label>
                    <div>
                        <vue-editor v-model="content"></vue-editor></div>  2. 화면 에디터 추가 -->
                   <label for="recipe_img" class="enrol-re">대표 사진</label>
                   <form action="">
                        <input type="file">
                        <input type="submit">
                    </form> 
                 </li>
                  <li>
                    <label class="enrol-re">카테고리</label>
                        <select class="sel" name="purpose" id="purpose">
                            <option value="0">목적별</option>
                            <option value="REF">냉장고털이</option>
                            <option value="HAN">해장</option>
                            <option value="SNA">간식</option>
                            <option value="NIG">야식</option>
                            <option value="DIE">다이어트</option>
                        </select>
                        <select class="sel" name="howto" id="howto">
                            <option value="0">방법별</option>
                            <option value="ROA">구이/부침</option>
                            <option value="SOU">국탕찌개</option>
                            <option value="FRY">볶음/조림</option>
                            <option value="MIX">무침/비빔</option>
                            <option value="ETC">기타</option>
                        </select>
                        <select class="sel" name="tool" id="tool">
                            <option value="0">도구별</option>
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
                        <select class="sel" name="time" id="time">
                            <option value="0">시간</option>
                            <option value="5">5분이내</option>
                            <option value="10">10분이내</option>
                            <option value="15">15분이내</option>
                            <option value="20">20분이내</option>
                            <option value="30">30분이내</option>
                            <option value="60">60분이내</option>
                            <option value="90">90분이내</option>
                            <option value="120">2시간이내</option>
                            <option value="121">2시간이상</option>
                        </select>
                    </span>
                    <span>
                        <span>난이도</span>
                        <select class="sel" name="difficult" id="difficult">
                            <option value="0">난이도</option>
                            <option value="1">핵쉬움</option>
                            <option value="2">쉬움</option>
                            <option value="3">보통</option>
                            <option value="4">어려움</option>
                            <option value="5">핵어려움</option>
                        </select>
                    </span>
                  </li>  
                  <li>
                    <label class="enrol-re">요리재료</label>
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
                    <label for="recipe-ingre" class="enrol-re">그 외 재료</label> 
                    <input id="recipe-ingre" name="recipe-ingre" type="text">
                  </li>
              </fieldset>
    
              <fieldset>  
                <legend>요리 순서</legend>
                <div id="recipe-step">              
                     <div id="step-num"><b>Step1</b></div>
                     <div id="re-img">
                        <label>레시피 이미지</label>
                        <form action="">
                            <input type="file">
                            <input type="submit">
                        </form>
                     </div>
                     <div id="re-info">
                        <label class="recipe-info">레시피 단계 설명</label>
                        <textarea id="memo" cols="80" rows="5"></textarea>
                     </div>   
               </div>
               <div id="add-area" class="btn" @click="fnAddIndex()">
                    <i class="fa-solid fa-circle-plus fa-xl"></i>
                    <button id="add-btn">Step 추가</button>
                </div>
              </fieldset>
    
              <div class="btn_box">
                <button class="btn" @click="fnEnrollRe()">등록</button>
                <button class="btn" @click="fnEditRe()">수정</button>
                <button class="btn" @click="fnDelRe()">삭제</button>
            </div>
    
       
        </div>
    
        <!-- wrap END -->
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script>

    var app = new Vue({ 
    el: '#app',
    data: {
        cnt : 1,
        content : ""
    }, methods: {
        fnEnrollRe : function() {
            alert("등록되었습니다!");
        },
        fnEditRe : function() {
            alert("수정되었습니다!");
        },
        fnDelRe : function() {
            alert("삭제되었습니다!");
        },
        fnAddIndex : function() {
        	var self = this;
        	self.cnt += 1;
        	console.log(self.cnt);
        	
            document.getElementById("recipe-step").innerHTML += 
            `<div id="step-num"><b>Step</b></div>
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
			var form = new FormData();
	        form.append( "file1", $("#file1")[0].files[0] );
	        
	         $.ajax({
	             url : "/upload.do"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		}
       
    } // 메소드 end
    , created: function () {

	}
});

</script>

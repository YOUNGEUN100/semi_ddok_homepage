<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


<style>
      /* style START */
        .h1_center { text-align: center;  }
        legend {font-size: x-large; }
        .fieldStyle {  width: 100%;  height: auto; border: 5px solid rgba(245, 243, 243, 0.959); box-shadow: 2px 2px 20px 0px #ece9e9; border-radius: 10px; padding: 20px 30px;margin: 40px 0;}
        .fieldStyle li {display: flex; margin: 20px 5px; }
        .fieldStyle .enrol_re {float: left; width: 100px;font-weight: bold;  }
        .recipe_file { display: flex; }
        .fieldStyle > li > #boarde_name, #content {  border-radius: 5px;  width: 100%; }
        .fieldStyle > li > #no_btn {  border-radius: 5px;  width: 15%; }
        .enrol_no {border-radius: 5px; width : 30%;}
        .btn_box button {border: none;width: 100px;  height: 40px; margin-left: 16px;border-radius: 15px;background-color: #999999;color: white; font-size: 20px;font-weight: bold; }
        #add_area { text-align: center;margin:10px 0; }
        #step_num{margin-right: 30px;}
        #re_info {margin-bottom: 20px;}
        #re_img { display: flex; }
        #recipe_step label {float: left; width: 130px; }
        .btn:hover {  cursor: pointer; }
	 
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
        <!-- wrap START -->
        <div id="app">
            <h1 class="h1_center">글쓰기</h1>
            <fieldset class="fieldStyle">
                  <li>
                    <label for="board_name" class="enrol_re">제목</label>
                    <input id="boarde_name" name="board_name" type="text" v-model="info.title" required >
                  </li>
                  <li>
	                  <label for="file1" class="enrol_re">첨부파일</label>
	                   <form action="">
	                        <input type="file" id="file1" name="file1">
	                    </form>
                 </li>
                  <li>
                    <label for="board_content" class="enrol_re">내용</label> 
                    <div id="content">
                   		 <vue-editor  v-model="info.content"> </vue-editor>
                    </div>
                    
                  </li>
              </fieldset>
    
    
              <div class="btn_box">
                <button v-if="info.cdatetime" class="btn" @click="fnModify()">수정</button>
                <button v-else class="btn" @click="fnEnroll()">등록</button>
            </div>
    
       
        </div>
    
        <!-- wrap END -->
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	//3. 뷰에 vue2editor 추가
	console.log(Vue);
	Vue.use(Vue2Editor);
	const VueEditor = Vue2Editor.VueEditor;
    var app = new Vue({ 
    el: '#app',
    data: {
    	info : {
    		boardNo : "${boardNo}"
    		,userId : "${sessionId}"   
   	    	,title : ""
   	    	,content : ""
   	    	,cdatetime: ""
   	    	,category : 1
    	},
        cnt : 1,
        content : "",
        boardNo : "${map.boardNo}",
        sessionStatus : "${sessionStatus}",
        sessionId : "{sessionId}"
    }
    // 4. 컴포넌트 추가
    , components: {VueEditor}
    , methods: {
    	// 수정할 글 불러오기
    	 fnGetInfo : function(){
	            var self = this;
	            var nparmap = {boardNo : self.boardNo};
	            // 레시피 설명
	            $.ajax({
	                url:"/community/view.dox",
	                dataType:"json",
	                type : "POST",
	                data : nparmap,
	                success : function(data) {
	                	//console.log(data.info);
	                	if (data.info.length > 1) return;
	                    self.info = data.info[0];
	                   	console.log(self.info);
	                }
	            });
	
	        }
    	// 커뮤니티 글 등록
        ,fnEnroll : function() {
            var self = this;
            // 관리자가 작성한 글이면 공지글로
            if (self.sessionStatus=='A') {
            	self.info.category = 2;
            }
            
            var nparmap = self.info;
	        $.ajax({
	            url:"/community/save.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
	            	
	            	var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "boardNo",  data.boardNo); // pk
	       	     	// 첨부파일이 있으면 파일 업로드 함수 실행
	       	     	console.log($("#file1")[0].files[0] );
	       	     	if ($("#file1")[0].files[0] ) {
	       	     		self.upload(form); 
	       	     	}
	       	     	alert("등록되었습니다!");
	           	 	location.href="/community.do";
	            }
	        }); 
        }
     // 파일 업로드
	    , upload : function(form){
	    	var self = this;
	        
	         $.ajax({
	             url : "/community/fileUpload.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		}
     	// 커뮤니티 글 수정
        , fnModify : function() {
            var self = this;
            var nparmap = self.info;
	        $.ajax({
	            url:"/community/modify.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
	            	var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "boardNo",  data.boardNo); // pk
	       	     	if ($("#file1")[0].files[0] ) {
	       	     		self.upload(form); 
	       	     	}
		       	     alert("수정되었습니다!");
	           	 	location.href="/community.do"; 
	            }
	        }); 
        }
        
    } // 메소드 end
    , created: function () {
		var self = this;
		self.fnGetInfo();
	}
});

</script>

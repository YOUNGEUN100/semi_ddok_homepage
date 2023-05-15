<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


<style>
      /* style START */
        h1 { text-align: center;  }
        legend {font-size: x-large; }
        fieldset {
            width: 100%;
            height: 500px;
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 10px;
            padding: 20px 30px;
            margin: 40px 0;
        }
        fieldset li {display: flex; margin: 20px 5px; }
        fieldset .enrol-re {float: left; width: 100px;font-weight: bold;  }
        .recipe-file { display: flex; }
        fieldset > li > #boarde_name, #content {  border-radius: 5px;  width: 100%; }
        fieldset > li > #no_btn {  border-radius: 5px;  width: 15%; }
        .enrol-no {border-radius: 5px; width : 30%;}
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
        #add-area { text-align: center;margin:10px 0; }
        #add-area #add-btn {
            border: none;
            background: none;
            padding:5px;
            font-size: medium;
        }
        #step-num{margin-right: 30px;}
        #re-info {margin-bottom: 20px;}
        #re-img { display: flex; }
        #recipe-step label {float: left; width: 130px; }
        .btn:hover {  cursor: pointer; }
	 
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
        <!-- wrap START -->
        <div id="app">
            <h1>글쓰기</h1>
            <fieldset>
                  <li>
                    <label for="board_name" class="enrol-re">제목</label>
                    <input id="boarde_name" name="board_name" type="text" v-model="info.title" required >
                  </li>
                  <li>
	                  <label for="file1" class="enrol-re">첨부파일</label>
	                   <form action="">
	                        <input type="file" id="file1" name="file1">
	                    </form>
                 </li>
                  <li>
                    <label for="board_content" class="enrol-re">내용</label> 
                    <div id="content">
                   		 <vue-editor  v-model="info.content"></vue-editor>
                    </div>
                    
                  </li>
              </fieldset>
    
    
              <div class="btn_box">
                <button class="btn" @click="fnEnroll()">등록</button>
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
    	},
        cnt : 1,
        content : ""
    }
    // 4. 컴포넌트 추가
    , components: {VueEditor}
    , methods: {
        fnEnroll : function() {
            var self = this;
            
            var nparmap = self.info;
	        $.ajax({
	            url:"/community/save.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
	            	alert("등록되었습니다!");
	            	
	            	var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "boardNo",  data.boardNo); // pk
	           		self.upload(form); 
	            	
	           	 	location.href="/community.do";
	            }
	        }); 
        },
        // 파일 업로드
	    upload : function(form){
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
		},
		
    } // 메소드 end
    , created: function () {
		var self = this;
	}
});

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	<!--스타일 입력 -->
	h4 {margin-bottom: 20px;}
    button {
       font-size: medium;
       padding: 5px 10px;
       margin-right:10px;
       border-radius: 10px;
       border: 1px solid gainsboro;
       background-color: gainsboro;
       width: 80px;
       height: 40px;
    }
    button:hover {cursor: pointer;}
    .btns { display: flex; justify-content: space-between;  }
    .container {
	    border : 1px solid red;
        border: 5px solid rgba(245, 243, 243, 0.959);
        box-shadow: 2px 2px 20px 0px #ece9e9;
        border-radius: 35px;
        padding: 20px 40px;
        margin-bottom: 30px;
        width: 100%;
	}
    .com_head .title {
        font-size: large;
        font-weight: bold;
        margin: 20px auto;
    }
    .com_head .writer div:first-child { margin-bottom: 10px;}
    .com_head .writer .flexc {display:flex; justify-content: space-between;}
   .com_content {
        margin: 20px auto 40px auto;
        /* border: 1px solid black; */
        padding: 10px 10px;
        height: 300px;
   }
   .comment_list div:first-child {margin-bottom: 10px; }
   .comment {margin: 10px 10px;}
   .comment .comment_enroll {
        margin: 20px auto;
        padding: 10px 10px;
        border: 1px solid #999;
        border-radius: 5px;
        display: flex;
        flex-direction: column;
   }
   .comment_enroll div{  margin-bottom: 10px;}
   .comment_enroll input{
        width: 1000px;
        padding: 5px 5px;
        margin-bottom: 20px;
        border: none;
        font-size: medium;
   }
   .comment_enroll button {
         width: 60px;
         height: 35px;
   }
   .comment_list button {
         width: 50px;
         height: 30px;
         font-size:small;
         margin-left : 20px;
         background-color: white;
   }
   .mgr20 {margin-right: 20px;}
   .mgb20 {margin-bottom: 20px;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<div id="app">

           <div class="container">
               <div class="com_head">
                   <div class="title">{{info.title}}</div>
                   <div class="writer">
                       <div>{{info.nick}}</div> 
                       <div class="flexc">
                       		<div>
	                       		<span class="mg20">작성일 {{info.cdatetime}}</span>
	                           <span>조회 {{info.hits}}</span> 
                       		</div>
                       		<div>수정일 {{info.udatetime}}</div>
                       </div>
                       
                   </div>
               </div>
               <hr>
               <div class="com_content" v-html="info.content"><pre></pre></div>
               
               <hr>
               <div class="comment">
                   <h4 class="mgb20">댓글</h4>
                   
                   <div class="comment_list" v-for="(item, index) in list" >
                       <div>
                           <span class="mg20">{{item.nick}}</span>
                           <span>{{item.cdatetime}}</span>
                            <button v-if="item.userId==sessionId || sessionStatus=='A'" @click="fncommentDel(item.commentNo)">삭제</button>
                       </div>
                       <div class="mgb20">{{item.comment}}</div>
                      
                   </div>
                   
                   <div class="comment_enroll">
                   		<template>
                   			<div v-if="sessionId==''">작성자</div>
                   			<div v-else>{{sessionNick}}</div>
                   		</template>
                   
                      <input type="text" placeholder="댓글을 남겨보세요." v-model="commentInfo.comment">
                      <button @click="fnCommentEnroll()">등록</button>
                   </div>
                   
               </div>
           
           </div>
           <!--container 끝-->
           <div class="btns">
               <span>
                   <button @click="fnAddCom()" style="background-color: #E4DBD6;">글쓰기</button>
                   <button @click="fnGoModify()" v-if="info.userId==sessionId || sessionStatus=='A'">수정</button>
                   <button @click="fnRemove()" v-if="info.userId==sessionId || sessionStatus=='A'">삭제</button>
               </span>
               <button onClick="location.href='/community.do'">목록</button>
           </div>

       </div>
		
		
		
		
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
 // 자바 스크립트 입력
   var app = new Vue({
            el: '#app',
            data: {
            	list : []
              , info : {}
   			  , commentInfo : {
	   				boardNo : "${map.boardNo}",
	        		userId : "${sessionId}",
	        		comment : ""
   			  }
              , boardNo : "${map.boardNo}"
          	  , sessionId: "${sessionId}"    
          	  , sessionStatus : "${sessionStatus}"
          	  , sessionNick : "${sessionNick}"    
            }
            , methods: {
            	// 커뮤니티 글 상세
            	 fnGetInfo : function(){
     	            var self = this;
     	            var nparmap = {boardNo : self.boardNo};
     	            $.ajax({
     	                url:"/community/view.dox",
     	                dataType:"json",
     	                type : "POST",
     	                data : nparmap,
     	                success : function(data) {
     	                    self.info = data.info[0];
     	                   console.log("글 데이터는");
     	                    console.log(data.info);
     	                }
     	            });
     	        }
		         // 댓글 리스트
		       	 ,fnCommentList : function(){
			            var self = this;
			            var nparmap = {boardNo : self.boardNo};
			            $.ajax({
			                url:"/community/commentList.dox",
			                dataType:"json",
			                type : "POST",
			                data : nparmap,
			                success : function(data) {
			                    self.list = data.list;
			                    console.log("댓글 리스트는");
			                    console.log(data.list);
			                }
			            });
			
			        }
            	 // 커뮤니티 글 삭제
                , fnRemove : function() {
                    var self = this;
                    var nparmap = {boardNo : self.boardNo};
        	        $.ajax({
        	            url:"/community/remove.dox",
        	            dataType:"json",	
        	            type : "POST", 
        	            data : nparmap,
        	            success : function(data) { 
        	            	if (!confirm("삭제하시겠습니까?")) return;
        	            	
        	           	 	location.href="/community.do";
        	            }
        	        }); 
                }
            		<!-- 페이징 추가 7-->
        		, fnSearch : function(pageNum){
        			var self = this;
        			self.selectPage = pageNum;
        			var startNum = ((pageNum-1) * 10);
        			console.log(pageNum);
        			console.log(startNum);
        			var nparmap = {startNum : startNum};
        			$.ajax({
        				url : "/community/list.dox",
        				dataType : "json",
        				type : "POST",
        				data : nparmap,
        				success : function(data) {
        					self.list = data.list;
        					self.cnt = data.cnt;
        					self.pageCount = Math.ceil(self.cnt / 10);
        				}
        			});
        		}
            	, pageChange : function(url, param) {
            		var target = "_self";
            		if(param == undefined){
            		//	this.linkCall(url);
            			return;
            		}
            		var form = document.createElement("form"); 
            		form.name = "dataform";
            		form.action = url;
            		form.method = "post";
            		form.target = target;
            		for(var name in param){
        				var item = name;
        				var val = "";
        				if(param[name] instanceof Object){
        					val = JSON.stringify(param[name]);
        				} else {
        					val = param[name];
        				}
        				var input = document.createElement("input");
        	    		input.type = "hidden";
        	    		input.name = item;
        	    		input.value = val;
        	    		form.insertBefore(input, null);
        			}
            		document.body.appendChild(form);
            		form.submit();
            		document.body.removeChild(form);
            	}
            	// 커뮤니티 글쓰기
            	, fnAddCom: function() {
            		var self = this;
            		if (self.sessionId == "") {
            			if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {            				
            				location.href="/login.do"
            				return;
            			} else {
            				return;
            			}            			
            		}
            		location.href = "/community/edit.do";
            	}
            	// 글 수정 페이지로 가기
            	, fnGoModify: function() {
            		var self = this;
            		self.pageChange("/community/edit.do", {boardNo : self.boardNo});            		
            	}
            	// 댓글 등록하기
            	, fnCommentEnroll : function() {
            		 var self = this;
            		 if (self.sessionId == "") {
             			if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){            				
             				location.href="/login.do";    		
             			} else return;
             		 }
                   	var nparmap = self.commentInfo;
        	        $.ajax({
        	            url:"/community/commentSave.dox",
        	            dataType:"json",	
        	            type : "POST", 
        	            data : nparmap,
        	            success : function(data) {  
        	            	console.log(data);
        	            	alert("등록되었습니다!");
        	            	self.fnCommentList();
        	            	self.commentInfo.comment = "";
        	            }
        	        }); 
            	}
            	// 댓글 삭제하기
            	, fncommentDel : function(commentNo) {
            		 var self = this;
            		 if (!confirm("삭제하시겠습니까?")) return;
                     var nparmap = {commentNo : commentNo};
         	        $.ajax({
         	            url:"/community/commentRemove.dox",
         	            dataType:"json",	
         	            type : "POST", 
         	            data : nparmap,
         	            success : function(data) { 
         	            	alert("댓글이 삭제되었습니다.");
         	            	self.fnCommentList();
         	            }
         	        }); 
            	}
            


            }
            , created: function () {
            	var self = this;
            	console.log(self.sessionNick);
            	console.log(self.boardNo);
            	self.fnGetInfo();
            	self.fnCommentList();
            }
        });

</script>
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
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<div id="app">

           <div class="container">
               <div class="com_head">
                   <div class="title">{{info.title}}</div>
                   <div class="writer">
                       <div>{{info.userId}}</div> 
                       <div>
                           <span>{{info.cdatetime}}</span>
                           <span>조회 {{info.hits}}</span>  
                       </div>
                       
                   </div>
               </div>
               <hr>
               <div class="com_content">{{info.content}}</div>
               <hr>
               <div class="comment">
                   <h4>댓글</h4>
                   <div class="comment_list">
                       <div>
                           <span>작성자</span>
                           <span>작성일</span>
                       </div>
                       <div class="comment_content">작성내용</div>
                       
                   </div>
                   <div class="comment_enroll">
                      <div>작성자</div>
                      <input type="text" placeholder="댓글을 남겨보세요.">
                      <button>등록</button>
                   </div>
                   
               </div>
           
           </div>
           <!--container 끝-->
           <div class="btns">
               <span>
                   <button>글쓰기</button>
                   <button>수정</button>
                   <button>삭제</button>
               </span>
               <button>목록</button>
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
              info : {}
              , boardNo : "${map.boardNo}"
          	  , sessionId: "${sessionId}"    
          	  , sessionStatus : "${sessionStatus}"
            }
            , methods: {
            	// 커뮤니티 글 상세
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
     	                    self.info = data.info;
     	                    console.log(data.info);
     	                }
     	            });
     	
     	        }
            	// 댓글 리스트
                ,fnGetCommentList: function () {
                    var self = this;   		
            		var startNum = ((self.selectPage-1) * 10);
            		var nparmap = {};
                    $.ajax({
                        url: "/community/commentList.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                        	console.log(data.list);
                        	self.list = data.list;
                           self.cnt = data.cnt;
                           // self.pageCount = Math.ceil(self.cnt / 10);  

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
            	
            


            }
            , created: function () {
            	var self = this;
            	console.log(self.boardNo);
            	self.fnGetInfo();
            }
        });

</script>
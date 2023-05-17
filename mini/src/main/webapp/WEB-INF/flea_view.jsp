<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

    <style>
        /* style START */
        /* * {
            border: 1px dotted rgb(223, 60, 141);
        } */

        .container {
            width: 1200px;
            height: 100%;
            position: relative;
            margin: auto;
            border-radius: 15px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            box-sizing: border-box;
            padding: 24px 24px;
            margin-top: 30px;
        }

        .board_title {text-align: center;}
		
		.title_box {
            border: 1px solid #999999;
            border-radius: 10px;
            height: 140px;
            padding: 18px;
            display: flex;
  			flex-wrap: wrap;
        }
		
		.aa {display:flex;flex-wrap: wrap;}
		.bb {display:flex;flex-wrap: wrap;}
		
        .title_box h1 {
            margin-top: 5px;
            overflow : hidden;
        	text-overflow: ellipsis;
        	white-space  : nowrap;
        }
        
        .title_box span {
        	margin-top: 10px;
            font-size: 25px;
            
        }

        .sale_flg {width:150px;}

        .title { width: 950px;}
        
        .nick {width:150px;}
        
        .date {width:300px;}
        
        .hits {margin: auto 0 0 auto;}

        .content_box {
            border: 1px solid #999999;
            border-radius: 10px;
            margin-top: 30px;
            height: 700px;
            padding: 16px;
            font-size: 20px;
            display : flex;     
        }

        .content_box button {            
            border: none;
            width: 150px;
            height: 60px;
            border-radius: 20px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
            margin-top : auto;
        }

        .comment_header {            
            margin-top: 30px;
            height: 80px;
            padding: 20px;
        }

        .comment_box {
            border: 1px solid #999999;
            border-radius: 10px;
            margin-top: 10px;
            min-height: 100px;
            padding: 16px;
        }

        .comment_list {margin-top: 8px;}

        .commenter {
            font-size: 25px;
            font-weight : bold;
        }

        .commenter span {margin-right: 15px;}
        
        .commenter button {height : 40px;}

        .comment_content {
            font-size: 15px;    
            border-bottom : 1px solid black;        
        }
        
        .comment_content textarea {
        	width : 80%;
        	border: 1px solid #999999;
            border-radius: 10px;
            padding : 16px;
        }
        
        .recoBtnArea textarea {
        	width : 80%;
        	margin-top: 10px;
        	border: 1px solid #999999;
            border-radius: 10px;
            padding : 16px;
        }
        
        .comment_add {
        	margin-top: 30px;
        	display : flex;
        	justify-content : flex-end;
        	flex-wrap: wrap;      	
        }
        
        .comment_add textarea {
        	width : 100%;
        	border: 1px solid #999999;
            border-radius: 10px;
            padding : 16px;
        }
        
        .comment_add button {
        	width : 80px;
        	height : 35px;
        	margin-top : 5px;
        	border : none;
        	border-radius: 10px;
            background-color: #999999;
            color: white;
            font-weight: bold;
            cursor : pointer;
        }

        .btn_box {
            /* border: 1px dotted black; */
            margin-top: 30px;
            height: 100px;
            padding: 16px;
            display: flex;
            justify-content: flex-end;
        }

        .btn_box button {
            border: none;
            width: 150px;
            height: 60px;
            margin-left: 20px;
            border-radius: 20px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
			cursor : pointer;
        }
		
		#coContent {
			margin-top : 10px;
			font-size: 20px;
			cursor: pointer;
		}
		
		#reCoContent {margin-left : 50px;}

		
        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

                <div class="board_title">
                    <h1 id="board_title"></h1>
                </div>

                <div class="container">
                    
                        <div class="board_wrap">
                            <div class="title_box">
								<div class="aa">
									<h1 class="sale_flg" id="sale_flg">[{{info.boardKind2}}]</h1>                               
                                	<h1 class="title">{{info.title}}</h1>
								</div>
                            	<div class="bb">
                            		<span class="nick">{{info.nick}}</span>
                                	<span class="date">작성일 {{info.cdatetime2}}</span>
                                	<span class="hits"><i class="fa-solid fa-eye fa-lg"></i> {{info.hits}}</span>
                            	</div>		                            
                            </div>
                            <div class="content_box" v-html="info.content"></div>
                        </div>


                        <div class="comment_wrap">
                            <div class="comment_header">
                                <h1>댓글</h1>
                            </div>

                            <div class="comment_box">
                            	
                            	<div class="comment_list" v-for="(item, index) in list">
                               	
                                		<!-- 댓글 출력 영역 commentNo와 commentReno가 같으면 출력 -->
                                		<div  v-if="item.commentNo == item.commentReno">               		
                                			<div class="commenter"> <!-- 댓글작성자 댓글작성일 정보영역 -->
		                                        <span>{{item.nick}}</span>
    		                                    <span>{{item.cdatetime2}}</span>
        		                                <button @click="fnDeleteComment(item.commentNo)" v-if="sessionId == item.userId || sessionStatus == 'A'">삭제</button>
            		                            <button @click="fnEditComment(item)" v-if="sessionId == item.userId || sessionStatus == 'A'">수정</button>
                		                    </div>
                	                    
                    		                <div class="comment_content" v-if="editCoNo != item.commentNo"> <!-- 댓글내용 -->
                        		                <pre id="coContent" @click="fnRecommentBtn(item)" v-if="sessionId == item.userId || sessionStatus == 'A' || sessionId == info.userId">{{item.content}}</pre>
                        		                <pre v-else> 비밀 댓글입니다.</pre>
                            		        </div>
                            		        
                            		        <div class="comment_content" v-else> <!-- 댓글 수정버튼 영역 -->                         
                                        		<textarea rows = "5" v-model="commentInfo.content"></textarea>
                                        		<button @click="fnEditCommentFinish">수정</button>
                                        		<button @click="fnEditCommentClose">취소</button>
                                    		</div>
                            		        
                            		        <div class="recoBtnArea" v-if="editReCoNo == item.commentNo"> <!-- fnRecommentBtn 누르면 나오는 대댓글 작성 박스 -->
                	            	        	<textarea placeholder="댓글을 입력하세요." v-model="reContent"></textarea>
                    	    	               	<button @click="fnWriteReComment(item.commentNo)">입력</button>
                        		               	<button @click="fnRecommentclose">취소</button>
                            		        </div>             		       
                                		</div>
                                		<!-- 댓글 출력 영역 끝 -->
                                		
                                		<!-- 대댓글 출력 영역 commentNo와 commentReno가 다르면 출력 -->
                                		<div v-else>
                                			<div v-if="sessionId == item.userId || sessionStatus == 'A' || sessionId == info.userId">
                                				<div>{{item.nick}} [{{item.cdatetime2}}]</div>
                                				<pre style="margin-left : 20px;display:inline-block;">{{item.content}}</pre>
                                				<span @click="fnDeleteReComment(item.commentNo)"><a href="javaScript:;">삭제</a></span>
                                			</div>                               			
                                		</div>	
                                    	<!-- 대댓글 출력 영역 끝 -->
                                    	
                                    </template>
                                        
                                </div>
                            	
                                                                                               
                            </div>
                            <div class="comment_add">
                        		<textarea rows = "3" placeholder="댓글을 입력하세요." v-model="content"></textarea>
                        		<p></p>
                        		<button @click = "fnWriteComment">댓글등록</button>
                        	</div>
							
                        </div>
                        

                        <div class="btn_box">
                        	<button @click="fnFinishTrade" v-if="sessionId == info.userId || sessionStatus == 'A'">거래완료</button>
                            <button @click="fnEditFlea(boardNo)" v-if="sessionId==info.userId">수정</button>
                            <button @click="fnDeletePost" v-if="sessionId == info.userId || sessionStatus == 'A'">삭제</button>
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
                info: {}, // 게시글 정보
                list:[], // 댓글 리스트
                commentInfo: {}, // 댓글 수정용 정보
                boardNo: "${map.boardNo}",
                sessionId: "${sessionId}",
                sessionStatus: "${sessionStatus}",
                content : "", //댓글
                reContent : "", //대댓글
                editCoNo: "", //댓글트리거용
                editReCoNo: "" //대댓글트리거용
                
            },
            methods: {
                fnGetFlea: function () {
                    var self = this;
                    var nparmap = {
                        boardNo: self.boardNo
                    };
                    $.ajax({
                        url: "/fleamarket/view.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.info = data.info;
                            console.log(data.info);
                            self.fnGetFleaComment();
                        }
                    });
                }
            	
            	// 댓글 리스트
            	, fnGetFleaComment: function () {
                    var self = this;
                    var nparmap = {
                        boardNo : self.boardNo
                    };
                    $.ajax({
                        url: "/fleamarket/comment.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.list = data.list;
                            console.log(data.list);
                        }
                    });
                }
            	
            	// 게시글 삭제            	
            	, fnDeletePost: function() {
            		var self = this;
            		if (!confirm("게시글을 삭제하시겠습니까?")) {
            			return;
            		};
            		var nparmap = {
                            boardNo : self.boardNo
                        };
            		$.ajax({
                    	url: "/fleamarket/deleteFlea.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("삭제완료");
                    		location.href="/flea.do"
                    	}
                	});
            	}
            	
            	// 게시글 수정
            	, fnEditFlea: function(boardNo) {
            		var self = this;            		
            		self.pageChange("./edit.do", {boardNo : boardNo});
            	}
            	
            	// 댓글입력
            	, fnWriteComment: function () {
            		var self = this;
            		if (self.content == "") {
            			alert("글을 입력하세요");
            			return;
            		}
            		
            		if (self.sessionId == "") {
            			if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {            				
            				location.href="/login.do"
            				return;
            			} else {
            				return;
            			}            			
            		}
            		
            		var nparmap = {
                        boardNo : self.boardNo,
                        sessionId : self.sessionId,
                        content : self.content
                    };
            		$.ajax({
                    	url: "/fleamarket/addcomment.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("등록 완료");
                    		self.content = "";
                    		self.fnGetFlea();
                    	}
                });
            	}
            	
            	// 거래완료 버튼
            	, fnFinishTrade: function () {
            		var self = this;
            		if (self.info.finishYn == "Y") {
            			alert("이미 종료된 거래입니다");
            			return;
            		}
            		console.log(self.info.hits);
            		if (!confirm("거래를 완료하시겠습니까?")) {
            			return;
            		};
            		var nparmap = {
                            boardNo : self.boardNo
                        };
            		$.ajax({
                    	url: "/fleamarket/finishFlea.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("거래완료");
                    		self.fnGetFlea();
                    	}
                	});
            	}
            	
            	// 댓글 삭제
            	, fnDeleteComment: function(commentNo) {
            		var self = this;
            		if (!confirm("댓글을 삭제하시겠습니까?")) {
            			return
            		}
            		var nparmap = {commentNo : commentNo};
            		$.ajax({
                    	url: "/fleamarket/removecomment.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("삭제 완료");
                    		self.fnGetFleaComment();
                    	}
                	});
            		
            	}
            	
            	// 댓글 수정 활성
            	, fnEditComment: function(item) {
            		var self = this;            		
            		self.editCoNo = item.commentNo;
            		self.commentInfo = item;  
            		console.log(self.commentInfo);
            	}
            	
            	// 댓글 수정 확인
            	, fnEditCommentFinish: function() {
            		var self = this;
            		if (!confirm("댓글을 수정하시겠습니까?")) {
            			return
            		}
            		var nparmap = self.commentInfo;
            		$.ajax({
                    	url: "/fleamarket/editcomment.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("수정완료");
                    		self.editCoNo = "";
                    		self.commentInfo = "";
                    		self.fnGetFlea();
                    	}
                	});
            		
            	}
            	
            	// 댓글 수정 취소버튼
            	, fnEditCommentClose: function() {
            		var self = this;
            		self.editCoNo = "";	
            	}           	
            	            	
                // 대댓글 할성 버튼
            	, fnRecommentBtn: function(item) {
            		var self = this;
            		self.editReCoNo = item.commentNo;
            		console.log(self.editReCoNo);
            	}
            	
            	// 대댓글 활성 취소
            	, fnRecommentclose: function() {
            		var self = this;
            		self.editReCoNo = "";
            	}
            	
            	// 대댓글 작성
            	, fnWriteReComment: function(commentNo) {
            		var self = this;
            		var nparmap = {commentNo : commentNo,
            						content : self.reContent,
            						sessionId : self.sessionId,
            						boardNo : self.boardNo
            						};
            		$.ajax({
                    	url: "/fleamarket/addrecomment.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("등록완료");
                    		self.editReCoNo = "";
                    		self.reContent = "";
                    		self.fnGetFleaComment();
                    	}
                	});
            		
            	}
            	
            	// 대댓글 삭제
            	, fnDeleteReComment: function(commentNo) {
            		var self = this;
            		if (!confirm("댓글을 삭제하시겠습니까?")) {
            			return
            		}
            		var nparmap = {commentNo : commentNo};
            		$.ajax({
                    	url: "/fleamarket/removerecomment.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("삭제완료");
                    		self.fnGetFleaComment();
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
            ,
            created: function () {
                var self = this;
                self.fnGetFlea();
            }
        });
    </script>
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

        .board_title {
            text-align: center;
        }

        .board_wrap {}

        .title_box {
            border: 1px solid #999999;
            border-radius: 10px;
            height: 80px;
            padding: 18px;
            display: flex;
            justify-content: space-between;
        }

        .title_box h1 {
            margin-top: 5px;
        }

        .sale_flg {
            width: 150px;
        }

        .title {
            width: 730px;
        }

        .title_box span {
            margin-top: 10px;
            font-size: 25px;
        }

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

        .comment_list {
            margin-top: 8px;
            border-bottom: 1px solid #999999;
        }

        .commenter {
            font-size: 20px;
        }

        .commenter span {
            margin-right: 15px;
        }

        .comment_content {
            font-size: 15px;            
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

		
        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

                <div class="board_title">
                    <h1 id="board_title">중고판매/중고나눔</h1>
                </div>

                <div class="container">
                    
                        <div class="board_wrap">
                            <div class="title_box">
                                <h1 class="sale_flg" id="sale_flg">{{info.finishYn}}</h1>                               
                                <h1 class="title">{{info.title}}</h1>
                                <span>{{info.cdatetime2}}</span>
                                <span><i class="fa-solid fa-eye fa-lg"></i> {{info.hits}}</span>
                            </div>

                            <div class="content_box">
                               {{info.content}}                           
                            </div>
                        </div>


                        <div class="comment_wrap">
                            <div class="comment_header">
                                <h1>댓글</h1>
                            </div>

                            <div class="comment_box">
                                <div class="comment_list" v-for="(item, index) in list">
                                    <div class="commenter">
                                        <span>{{item.nick}}</span>
                                        <span>{{item.cdatetime2}}</span>
                                    </div>
                                    <div class="comment_content">
                                        <span>{{item.content}}</span>
                                    </div>
                                </div>                                                               
                            </div>
                            <div class="comment_add">
                        		<textarea rows = "5" placeholder="댓글을 입력하세요." v-model="content"></textarea>
                        		<p></p>
                        		<button @click = "fnWriteComment">댓글등록</button>
                        	</div>
							
                        </div>
                        

                        <div class="btn_box">
                        	<button>거래완료</button>
                            <button>수정</button>
                            <button>삭제</button>
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
                info: {},
                list:[],
                boardNo: "${map.boardNo}",
                sessionId: "${sessionId}",
                content : ""

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
                            if (data.info.boardKind == "T_LAN") {
                            	if (data.info.finishYn == 'N') {
                            		sale_flg.innerHTML = "[판매중]"
                            	} else {
                            		sale_flg.innerHTML = "[판매완료]"
                            	}
                            } else {
                            	if (data.info.finishYn == 'N') {
                            		sale_flg.innerHTML = "[나눔중]"
                            	} else {
                            		sale_flg.innerHTML = "[나눔완료]"
                            	}
                            }
                            
                            if (data.info.boardKind == "T_LAN") {
                            	board_title.innerHTML = "중고판매"
                            } else {
                            	board_title.innerHTML = "중고나눔"
                            }
						
                        }
                    });
                }
            	
            	// 랜선장터 댓글 리스트
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
            	
            	// 랜선장터 댓글입력
            	, fnWriteComment: function () {
            		var self = this;
            		if (self.content == "") {
            			alert("글을 입력하세요");
            			return;
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
                    		alert("댓글 등록 완료");
                    		self.content = "";
                    		self.fnGetFleaComment();
                    	}
                });
            	}


            }
            ,
            created: function () {
                var self = this;
                self.fnGetFlea();
                self.fnGetFleaComment();
            }
        });
    </script>
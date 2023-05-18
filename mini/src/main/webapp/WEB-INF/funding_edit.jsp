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
            position: relative;
            margin: auto;
            padding: 24px;
        }

        h1 {
            text-align: center;
        }

        .input_form {
            border: 1px solid #999999;
            border-radius: 10px;
            width: 1100px;
            margin: 50px auto;
            padding: 26px;
            border-radius: 15px;
            border: none;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .input_form div {
            margin-top: 16px;
        }

        .input_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }

        .input_box span {
            display: inline-block;
            width: 15%;
            font-size: 18px;
        }

        .input_box input {
            border: 1px solid #999999;
            border-radius: 10px;
            height: 40px;
        }

        .title,
        .summary {
            width: 80%;
        }

        .file_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }

        .content_box,
        .file_box p {
            font-size: 18px;
        }

        .content {
            width: 100%;
            border: 1px solid #999999;
            border-radius: 10px;
            padding : 16px;
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

        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">
                <div class="container">

                    <div>
                        <h1 v-if="fundingNo==''">랜선펀딩 등록</h1>
                        <h1 v-else>랜선펀딩 수정</h1>
                    </div>

                    <div class="input_form">

                        <div class="input_box">

                            <div class="title_box">
                                <span>제목</span> <input class="title" type="text" v-model="info.fundingName">
                            </div>

                            <div class="summmary_box">
                                <span>요약설명</span> <input class="summary" type="text" v-model="info.fundingSummary">
                            </div>

                            <div class="goal_box">
                                <span>펀딩목표수</span> <input class="goal" type="number" min="0" v-model="info.fundingGoalCnt">
                            </div>

                            <div class="open_date_box">
                                <span>펀딩시작일</span> <input class="open_date" type="datetime-local" v-model="info.fundingStartDt">
                            </div>

                            <div class="end_date_box">
                                <span>펀딩종료일</span> <input class="end_date" type="datetime-local" v-model="info.fundingEndDt">
                            </div>

                            <div class="price_box">
                                <span>가격</span> <input class="price" type="number" min="0" v-model="info.fundingPrice">
                            </div>

                        </div>

                        <div class="file_box">

                            <div class="thumb_box">
                            	<p>썸네일 이미지</p>
                                <input type="file" id="file1" name="file1">
                                <p>상세 이미지</p>
                                <input type="file" id="file2" name="file2" multiple>
                                 <vue-editor v-model="info.content"></vue-editor>
                            </div>
                            

                        </div>

                        <div class="btn_box">
                            <button @click="fnAddFunding" v-if="fundingNo==''">등록</button>
                            <button @click="fnEditFunding" v-else>수정</button>
                        </div>



                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">     
    	console.log(Vue);
    	Vue.use(Vue2Editor);
    	const VueEditor = Vue2Editor.VueEditor;
    	
        var app = new Vue({
            el: '#app',
            data: {
                info: {
                		fundingName: "",
                		fundingSummary: "",
                		fundingGoalCnt: "",
                		fundingStartDt: "",
                		fundingEndDt: "",
                		fundingPrice: "",
                		content:""
                	
                },
                imgInfo: [],
                sessionId: "${sessionId}",
                fundingNo: "${map.fundingNo}"

            }
            , components: {VueEditor}
            , methods: {
            	//수정용 펀딩 정보
            	fnGetFunding: function () {
                    var self = this;
                    console.log(self.fundingNo);
                    //fundingNo 있으면 수정페이지 없으면 등록페이지
                    if(self.fundingNo == "") {
                    	return;
                    }
                    var nparmap = {
                        fundingNo: self.fundingNo
                    };
                    $.ajax({
                        url: "/funding/view.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.info = data.info;
                            self.imgInfo = data.imgInfo;
                            console.log(data.info);
                            console.log(data.imgInfo);

                        }
                    });
                }
            	
            	//  펀딩 등록
                , fnAddFunding: function () {
                    var self = this;
                    if(!confirm("등록 하시겟습니까?")) {
                    	return;
                    }   
                    if(self.info.fundingName == "") {
                    	alert("글제목을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingSummary == "") {
                    	alert("상품 요약글을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingGoalCnt == "") {
                    	alert("최소 펀딩 신청자 수를 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingStartDt == "") {
                    	alert("펀딩 시작일을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingEndDt == "") {
                    	alert("펀딩 종료일을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingPrice == "") {
                    	alert("상품 가격을 입력하세요.");
                    	return;
                    }
                    console.log(self.info);
                    var nparmap = self.info
                    $.ajax({
                        url: "/funding/add.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            alert("등록되었습니다.");
                            console.log($("#file1")[0].files);
                            console.log($("#file2")[0].files);
                            
                            // 썸네일 이미지
                            var form = new FormData();
                            form.append( "file1",  $("#file1")[0].files[0] );								
							form.append( "fundingNo",  data.fundingNo);// pk
							self.upload(form);
                            
							// 상세 이미지
                            for(var i = 0; i<$("#file2")[0].files.length; i++) {
								//append는 이어붙이는 명령어라 첫번째 파일을 보내고 다시 폼을 만들어 두번째 파일을 보내줘야함
								var form = new FormData(); 
								form.append( "file2",  $("#file2")[0].files[i] );								
								form.append( "fundingNo",  data.fundingNo);// pk
								self.upload2(form);
							}                            
        	       	     	
                           	location.href = "/funding.do";
                            
                        }
                    });
                }
                
             	// 게시글 수정
            	, fnEditFunding: function() {
            		var self = this;
            		if (!confirm("펀딩을 수정하시겠습니까?")) {
            			return;
            		};
            		if(self.info.fundingName == "") {
                    	alert("글제목을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingSummary == "") {
                    	alert("상품 요약글을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingGoalCnt == "") {
                    	alert("최소 펀딩 신청자 수를 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingStartDt == "") {
                    	alert("펀딩 시작일을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingEndDt == "") {
                    	alert("펀딩 종료일을 입력하세요.");
                    	return;
                    }
                    if(self.info.fundingPrice == "") {
                    	alert("상품 가격을 입력하세요.");
                    	return;
                    }
            		console.log(self.info.finishYn);
            		var nparmap = {
                            fundingNo : self.fundingNo,
                            fundingName : self.info.fundingName,
                            fundingSummary : self.info.fundingSummary,
                            fundingGoalCnt : self.info.fundingGoalCnt,
                            fundingStartDt : self.info.fundingStartDt,
                            fundingEndDt :self.info.fundingEndDt,
                            fundingPrice :self.info.fundingPrice,
                            content : self.info.content
                        };
            		$.ajax({
                    	url: "/funding/edit.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("수정완료");
                    		location.href="/funding.do"
                    	}
                	});
            	}
             	
            	// 썸네일용 업로드
            	, upload : function(form){
	    			var self = this;
	         		$.ajax({
	            	 	url : "/fileUpload2.dox"
	           		, type : "POST"
	           		, processData : false
	           		, contentType : false
	           		, data : form
	          	 	, success:function(response) { 
	        	   	
	          		 }
	           
	       			});
				}
            	
            	// 상세이미지용 업로드
            	, upload2 : function(form){
    	    		var self = this;
    	         	$.ajax({
    	             	url : "/fileUpload3.dox"
    	           	, type : "POST"
    	           	, processData : false
    	           	, contentType : false
    	           	, data : form
    	           	, success:function(response) { 
    	        	   	
    	          	 }
    	           
    	       		});
    			}
				
         		
             	
            }
            ,
            created: function () {
                var self = this;
                self.fnGetFunding();
            }
        });
    </script>
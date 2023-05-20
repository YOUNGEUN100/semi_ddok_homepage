<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


    <style>
        /* style START */
        h1 {
            text-align: center;
        }
		.box{display:flex;justify-content:center;flex-wrap: wrap}
        fieldset {
            width: 60%;
            height: auto;
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 10px;
            padding: 20px 30px;
            margin: 40px 0;
        }

        fieldset li {
            display: flex;
            flex-direction: column;
            margin: 20px 5px;
        }

        fieldset .enrol_re {
            float: left;
            width: 100px;
            font-weight: bold;
        }

        .recipe_file {
            display: flex;
        }

        fieldset>li>#boarde_name,
        #content {
            border-radius: 5px;
            width: 100%;
        }

        fieldset>li>#no_btn {
            border-radius: 5px;
            width: 15%;
        }
		.btn_box {width:60%;}
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

        .btn:hover {
            cursor: pointer;
        }
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div class="wrapper">
            <!-- wrap START -->
            <div id="app">
                <h1>생활백서 등록</h1>
                <div class="box">
                    <fieldset>
                        <li>
                            <label for="board_name" class="enrol_re">정보 이름</label>
                            <input id="boarde_name" name="board_name" type="text" v-model="cardName" required>
                        </li>
                        <li>
                        	<p>이미지 이름 형식 [imgName-슬라이드순서] 를 지켜주세요 (예 : slide-01.jpg)</p>
                        	<p>첫 번 째 이미지가 썸네일이 됩니다.</p>
                        </li>
                        <li>
                            <label for="file1" class="enrol_re">첨부파일</label>
                            <form action="">
                                <input type="file" id="file1" name="file1" multiple>
                            </form>
                        </li>

                    </fieldset>
					<div class="btn_box">
						<button class="btn" @click="fnEnroll()">등록</button>
					</div>  
                </div>

                


            </div>

            <!-- wrap END -->
        </div>
    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">

        var app = new Vue({
            el: '#app',
            data: {
            	cardName : "",
                info: {
                    boardNo: "${boardNo}"
                    , userId: "${sessionId}"
                },
                cnt: 1,
                content: "",
                boardNo: "${map.boardNo}",
                sessionStatus: "${sessionStatus}",
                sessionId: "{sessionId}"
            }
            // 4. 컴포넌트 추가

            , methods: {
                // 카드 등록
                fnEnroll: function () {
                    var self = this;
                    if(self.cardName == "") {
                    	alert("제목을 입력하세요");
                    	return;
                    }
                    var nparmap = {cardName : self.cardName};
                    $.ajax({
                        url: "/livingTip/add.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            console.log(data.cardNo);
                            for(var i = 0; i<$("#file1")[0].files.length; i++) {
								//append는 이어붙이는 명령어라 첫번째 파일을 보내고 다시 폼을 만들어 두번째 파일을 보내줘야함
								var form = new FormData(); 
								form.append( "file1",  $("#file1")[0].files[i] );								
								form.append( "cardNo",  data.cardNo);// pk
								
								self.upload(form);
							}

                            alert("등록되었습니다");
                            location.href = "/livingTip.do";
                        }
                    });
                }
                // 파일 업로드
                , upload: function (form) {
                    var self = this;

                    $.ajax({
                        url: "/livingTip/fileUpload.dox"
                        , type: "POST"
                        , processData: false
                        , contentType: false
                        , data: form
                        , success: function (response) {

                        }

                    });
                }
 
            } 
            , created: function () {
                var self = this;
            }
        });

    </script>
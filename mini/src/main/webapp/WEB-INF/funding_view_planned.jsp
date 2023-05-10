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

        }

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .box2 {
            width: 1200px;
            height: 1000px;
            margin-top: 80px;
            background-color: #ebebeb;
            max-height: 700px;
            overflow: hidden;
        }

        .fund_img {            
            float: left;            
        }
        
        .fund_img img {        
        	border: 1px solid #e7e6e6;
        	border-radius: 20px;
        	width: 500px;
            height: 500px;
        }

        .fund_content {
            border: 1px solid black;
            width: 650px;
            height: 400px;

            margin-right: 0px;
            padding: 40px 30px;
            border: none;
            border-radius: 20px;
            box-sizing: border-box;
            float: right;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .fund_summary {
            margin-top: 30px;
            font-size: 15px;
        }

        .fund_cnt {
            display: inline-block;
            margin-top: 30px;
            font-size: 15px;
        }

        .fund_progress {
            width: 589px;
            height: 20px;
        }

        .price_box {
            margin-top: 15px;
            font-size: 20px;
        }

        .fund_price {
            font-size: 30px;
            font-weight: bold;
            color: #fe7167;
        }

        .apply_button {
            width: 540px;
            height: 80px;
            margin-top: 20px;
            margin-left: 49px;
            border-radius: 15px;
            background-color: #fe7167;
            border: none;
            font-size: 20px;
            color: white;
            font-weight: bold;
        }

        .share_button {
            width: 85px;
            height: 80px;
            margin-top: 20px;
            margin-left: 26px;
            border-radius: 15px;
            float: right;
            background-color: white;
            border: none;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            color: #fe7167;
            cursor: pointer;
        }

        .show_button {
            width: 1200px;
            height: 60px;
            margin-top: 20px;
            border-radius: 15px;
            background-color: white;
            border: 1px solid #5ea152;

        }

        #button_box1 {
            display: block;
        }

        #button_box2 {
            display: none;
        }

        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

                <div class="container">

                    <div class="box1">
                        <div class="fund_img"><img :src="info.imgPath"></div>

                        <div class="fund_content" v-for>
                            <h1 class="fund_name">{{info.fundingName}}</h1>
                            <p class="fund_summary">{{info.fundingSummary}}</p>
                            <span class="fund_cnt">최소 {{info.fundingGoalCnt}}명</span>
                            <span class="fund_cnt" style="float: right;">{{info.sDay}}{{info.dow}}
                                                {{info.sTime}}시 오픈예정</span>
                            <p></p>
                            <progress :value="info.cnt" :max="info.fundingGoalCnt" class="fund_progress"></progress>
                            <div class="price_box">
                                <span>펀딩예정가</span>
                                <span class="fund_price">{{info.fundingPrice2}}원</span>
                            </div>
                        </div>

                        <div>
                            <button class="apply_button"><i class="fa-regular fa-clock"></i>{{remainTime}}</button>
                            <button class="share_button" @click="fnClip"><i class="fa-solid fa-share-nodes fa-2xl"></i></button>
                        </div>
                    </div>

                    <div class="box2" id="detail_box">
                        <img
                            :src="info.imgPathDetail">
                    </div>

                    <div id="button_box1">
                        <button onclick="show()" class="show_button">펼쳐보기</button>
                    </div>

                    <div id="button_box2">
                        <button onclick="fold()" class="show_button">접기</button>
                    </div>



                </div>
            </div>
        </div>

    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">
    function show() {
        document.getElementById('detail_box').style.overflow = 'visible';
        document.getElementById('button_box1').style.display = 'none';
        document.getElementById('button_box2').style.display = 'block';
    }

    function fold() {
        document.getElementById('detail_box').style.overflow = 'hidden';
        document.getElementById('button_box1').style.display = 'block';
        document.getElementById('button_box2').style.display = 'none';
    }
    
    
    var app = new Vue({
		el : '#app',
		data : {    			
			info : {},
			fundingNo : "${map.fundingNo}",
			sDate : "",
			remainTime : "2",
			sessionId : "${sessionId}"
		},
		methods : {
			fnGetFunding : function() {
				var self = this;
				var nparmap = {
					fundingNo : self.fundingNo
				};
				$.ajax({
					url : "/funding/view2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.info;
						self.sDate = data.info.startDate;
						self.fnTimeDiff();
						self.fnCountDown();
						
					}
				});
			}
		
		  , fnClip: function() {
         		navigator.clipboard.writeText(window.location.href);
        		alert("복사되었습니다.");
        	}
		  
		  , fnTimeDiff: function() {
			  var self = this;
		      var endTime = new Date(self.sDate);
		      var todayTime = new Date();
		      
		      var diff = endTime - todayTime;
		      
		      var diffDay = Math.floor(diff / (1000*60*60*24));				
		      var diffHour = Math.floor((diff / (1000*60*60)) % 24);
		      var diffMin = Math.floor((diff / (1000*60)) % 60);
		      var diffSec = Math.floor(diff / 1000 % 60);
		      
		      self.remainTime =  "오픈까지 " + diffDay + "일 " + diffHour + "시간 " + diffMin + "분 " + diffSec + "초 남음";  
		  }
		  
		  , fnCountDown: function() {
			  
			  setInterval(this.fnTimeDiff, 1000);
		  }	  
			   
	
		}
		,
		created : function() {
			var self = this;
			self.fnGetFunding();
		}
	});
    </script>
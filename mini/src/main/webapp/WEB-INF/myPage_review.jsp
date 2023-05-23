<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>
<script src="https://unpkg.com/vue-star-rating/dist/VueStarRating.umd.min.js"></script>

<style>
	.myArea{
         background-color: #fff;
         margin: 0 auto;
         padding: 30px 80px; 
         display: flex; flex-direction: column; justify-content: center;
         align-items: center;
        }

      .myArea .userBox{
           width: 20%; height: 100%;
           border:0; 
           text-align: center;  
       }
      .myArea .userBox div{color: black;}
      .myArea .userBox img{width: 60px; height: 60px; }
      .myArea .userBox .edit{
         margin-bottom: 20px; font-size: 1.2em;
      }
      .myArea .userBox .edit:hover{color: #5EA152; cursor: pointer;}

      .myArea .contentBox{
          width: 80%;  display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
      }
      
      .myArea .contentBox .menuBox{
          width: 100%; display: flex; flex-flow: row nowrap; 
          justify-content: center;
      }
      .myArea .contentBox .menuBox .menu{
          width: 25%; text-align: center; padding: 10px;
          box-shadow: 0 0 4px 0 #ccc; cursor: pointer;
      }
      .myArea .contentBox .menuBox .menu:first-child{
          border-top-left-radius: 5px; 
          border-bottom-left-radius: 5px;
          box-shadow: -2px 0 5px 0 #ccc;
      }
      .myArea .contentBox .menuBox .menu:last-child{
          border-top-right-radius: 5px; 
          border-bottom-right-radius: 5px;
          box-shadow: 2px 0 5px 0 #ccc;
      }
      .myArea .contentBox .menuBox .menu:hover{
          background-color: #eee; color: black;
      }
      .myArea .contentBox .menuBox .menu:visited{
          background-color: #ccc; color: black;
      }


      .myArea .contentBox .reviewBox{
          width: 100%; box-shadow: 0 0 5px #ccc; 
          border-radius: 20px; padding-right:40px;
          margin-top: 30px;
      }
      .myArea .contentBox .reviewBox .reviewTop{
          display: flex; flex-direction: row; justify-content: space-between;
          margin: 10px; font-size: 0.85em; padding: 10px 30px;
      }
      .myArea .contentBox .reviewBox .reviewCenter{
          width: 100%; margin: 0 auto;
          display: flex; flex-direction: row; flex-wrap: nowrap; align-items: center;
          margin-bottom: 30px; justify-content: space-between;
      }
      .myArea .contentBox .reviewBox .reviewCenter img{
          width: 25%; height: 25%; margin: 10px 30px; cursor: pointer;
      }
      .myArea .contentBox .reviewBox .reviewCenter .detail{
          text-align: center; margin: 0 30px; cursor: pointer;
      }
      .myArea .contentBox .reviewBox .reviewCenter .detail div:first-child{
          text-align: center; cursor: pointer; font-size: 1.3em;
          margin-bottom:10px; font-weight:bold;
      }
      .myArea .contentBox .reviewBox .reviewCenter p{
          text-align: center; margin-top: 10px;
      }
      .myArea .contentBox .reviewBox .reviewBtn{
          padding: 5px;
          margin-top: 15px;
          background-color: #5EA152;
          color: #fff; border: 0; border-radius: 8px; width: 110px; 
          font-size: 0.9em; font-weight: bold; 
      }
      .myArea .contentBox .reviewBox .starAvg{
         font-weight:700;
      }
      .myArea .contentBox .reviewBox .star{
         text-align:center;
      }
      .myArea .contentBox .reviewBox .starBox{
          display: flex; flex-direction: column; align-items: center; width:30%;
      }
      .myArea .contentBox .reviewBox .starTitle{
        	text-align: center;
      }
      
      .star-ratings {
		  color: #aaa9a9; 
		  position: relative;
		  unicode-bidi: bidi-override;
		  width: max-content;
		  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
		  -webkit-text-stroke-width: 1.5px;
		  -webkit-text-stroke-color: #eddc7d;
		}
		 
		.star-ratings-fill {
		  color: #fff58c;
		  padding: 0;
		  position: absolute;
		  z-index: 1;
		  display: flex;
		  top: 0;
		  left: 0;
		  overflow: hidden;
		  -webkit-text-fill-color: gold;
		}
		 
		.star-ratings-base {
		  z-index: 0;
		  padding: 0;
		}


      .star-rating {
          display: flex;
          flex-direction: row-reverse;
          font-size: 1.5em;
          line-height: 2.0rem;
          justify-content: space-around;
          padding: 0 0.2em;
          text-align: center;
          width: 5em; overflow:hidden; white-space:nowrap;
      }
      .star-rating input {
          display: none;
      }
      
    
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="app" class="myArea">
            <div class="userBox"> <!--위-->
                <img src="/./images/Sample_User_Icon.png">
                <a href="/modify.do" class="edit" title="회원정보 수정은 여길 누르세요" @click="fnUserEdit()">{{sessionName}}님 환영합니다</a>
                
            </div>
            <div class="contentBox"> <!--아래-->
                <div class="menuBox"> <!--메뉴버튼-->
                    <a class="menu" id="order" href="/myPage.do">주문내역</a>
                    <a class="menu" id="recipe" href="/myPage/recipe.do">찜한 레시피</a>
                    <a class="menu" id="funding" href="/myPage/funding.do">펀딩내역</a>
                    <a class="menu" id="review" href="/myPage/review.do">리뷰관리</a>
                </div>  
                
                <div class="reviewBox" id="reviewBox" v-for="(item, index) in list"><!-- 리뷰관리 -->
                    <div class="reviewTop">
                        <div> 배송완료</div><div>주문번호 : {{item.orderNo}}</div>
                    </div>
                    <div class="reviewCenter">
                        <img :src="item.imgPath" name="상품이미지">
                        <div class="detail">
                            <div>{{item.productName}}</div>
                            <div>{{item.productPrice2}}원 (100{{item.productWeight}}당 {{item.perPrice}}원)</div>
                            <div>수량 : {{item.orderCnt}}개</div>
                            <div>총 결제금액 : {{item.orderPrice2}}원</div>
                        </div>
						<div class="starTitle" v-if="item.starAvg > 0">총 평점
	                       	<div class="star-ratings">
	                       		<div class="star-ratings-fill space-x-2 text-lg" v-if="item.starAvg == 5">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<div  class="star-ratings-fill space-x-2 text-lg" v-else-if="item.starAvg > 4">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<div class="star-ratings-fill space-x-2 text-lg" v-else-if="item.starAvg > 3">
									<span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<div class="star-ratings-fill space-x-2 text-lg" v-else-if="item.starAvg > 2">
									<span>★</span><span>★</span><span>★</span>
								</div>
								<div  class="star-ratings-fill space-x-2 text-lg" v-else-if="item.starAvg > 1">
									<span>★</span><span>★</span><span>★</span>
								</div>
								<div  class="star-ratings-fill space-x-2 text-lg" v-else>
									<span>★</span><span>★</span><span>★</span>
								</div>
								<div class="star-ratings-base space-x-2 text-lg" >
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
							</div>
							<div class="starAvg">{{item.starAvg}}점 / 5점</div>
						</div>
						

                        <div class="starBox" v-else>
                        	<div>
	                        <div class="star">
	                        	<span>상품만족도</span>
	                            <star-rating v-model="ratingProduct" v-bind:star-size="20" border-width="1.5" border-color="#eddc7d" inactive-color="#fff" ></star-rating>
	                        </div>
	                        <div class="star">
	                        	<span>재구매의사</span>
	                            <star-rating v-model="ratingRepurchase" v-bind:star-size="20" border-width="1.5" border-color="#eddc7d" inactive-color="#fff"></star-rating>
	                        </div>
	                        <div class="star">
	                        	<span>배송만족도</span>
	                            <star-rating v-model="ratingDelivery" v-bind:star-size="20" border-width="1.5" border-color="#eddc7d" inactive-color="#fff"></star-rating>
	                            <button class="reviewBtn" @click="fnReviewAdd(item.productNo)">등록하기</button>
	                        </div>
	                        </div>
                        </div>
                    </div>    
                </div>  
            </div>

        </div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>
<script type="text/javascript">

Vue.component('star-rating', VueStarRating.default);

var app = new Vue({ 

    el: '#app',
    data: {
    	list : []
		, sessionName : "${sessionName}"
		, sessionId : "${sessionId}"
		, orderNo : "${map.orderNo}"
		, productNo : "${map.productNo}"
		, ratingProduct : ""
		, ratingRepurchase : ""
		, ratingDelivery : ""
		
		
				
    }
    
    , methods : {
    	//리뷰
    	fnReview : function(){
            var self = this;
            var nparmap = {id : self.sessionId, orderNo : self.orderNo};
            $.ajax({
                url:"/myPage/review.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	if(self.sessionId == ''){
                		alert("로그인 해주세요");
                		location.href = "/login.do";
                	}else{
                    	self.list = data.list;
                    	console.log(self.list);
                    	
                	}  
                }
            });

        }
    	, fnReviewAdd : function(productNo){
    		var self = this;
	      	var nparmap = {id : self.sessionId, productNo:productNo, satisfactionGrade : self.ratingProduct, repurchaseGrade: self.ratingRepurchase, deliveryGrade : self.ratingDelivery};
	        $.ajax({
	            url:"/review/insert.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
	            	self.fnReview();
	            }
	        }); 
    		
   	 	}

    	//정보수정페이지 이동
    	, fnUserEdit : function(){
    		var self = this;
    		self.pageChange("/modify.do", {sessionId : self.sessionId});
    	},
    	
    	pageChange : function(url, param) {
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
    	self.fnReview();
    	
    	
	}
});
	
</script>
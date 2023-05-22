<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

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

       .myArea .contentBox .orderBox{
         width: 100%; box-shadow: 0 0 5px #ccc;
         border-radius: 20px; padding: 10px 30px;
          margin-top: 30px; 
       }
       .myArea .contentBox .orderBox h1{font-size: 1.4em; margin:20px; padding: 5px; }
       .myArea .contentBox .orderBox .orderContent{padding: 15px; box-shadow: 0 0 5px #ccc; border-radius: 20px;}
       .myArea .contentBox .orderBox #orderTop{
	        display: flex; flex-direction: row; justify-content: space-between; 
	        margin: 20px; border-bottom: 1px solid black; padding: 10px;
       }
       .myArea .contentBox .orderBox .orderCenter{display: flex; flex-direction: row; flex-wrap: nowrap; justify-content: space-between; 
        	align-items: center; margin:0 auto;  padding: 5px; margin-left: 20px;}
       .myArea .contentBox .orderBox .orderCenter img{
        	width: auto; height: 200px; margin: 20px;
     	}
       .myArea .contentBox .orderBox .orderCenter .orderDetail{text-align: center; width: 70%;}
       .myArea .contentBox .orderBox .orderCenter .orderDetail div:first-child{font-size: 1.4em; font-weight: bold;}

       .myArea .contentBox .orderBox .orderBottom .orderHistory div{ padding: 10px;}
       .myArea .contentBox .orderBox .orderBottom .orderHistory .orderHistoryList{padding: 10px; box-shadow: 0 0 5px #ccc; border-radius: 20px; }

       .myArea .contentBox .orderBox .payMent div{padding: 5px; } 
       .myArea .contentBox .orderBox .payMent .orderPayment{padding: 15px; box-shadow: 0 0 5px #ccc; border-radius: 20px; margin-bottom: 30px;}
      
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="app" class="myArea">
            <div class="userBox"> <!--위-->
                <img src="/./images/Sample_User_Icon.png">
                 <div class="edit" title="회원정보 수정은 여길 누르세요" @click="fnUserEdit()">{{sessionName}}님 환영합니다</div>
            </div>
            
            <div class="contentBox"> <!--아래-->
                <div class="menuBox"> <!--메뉴버튼-->
                    <a class="menu" id="order" href="/myPage.do">주문내역</a>
                    <a class="menu" id="recipe" href="/myPage/recipe.do">찜한 레시피</a>
                    <a class="menu" id="funding" href="/myPage/funding.do">펀딩내역</a>
                    <a class="menu" id="review" href="/myPage/review.do">리뷰관리</a>
                </div>  
                
                <div class="orderBox" >
                        <div><h1>주문 상세 내역</h1></div>
                    <div class="orderContent">
                        <div id="orderTop">
                        <div>{{info.orderDate}} 주문</div><div>주문번호 {{info.orderNo}}</div><div>{{info.status}} </div>
                        </div>  
                    
                    <div class="orderCenter" v-for="(item, index) in list" >
                        <img :src="info.imgPath" name="상품이미지">
                        <div class="orderDetail">
                            <div>{{info.productName}}</div>
                            <div>{{info.productPrice2}}원 (100{{info.productVolume}}당 {{info.perPrice}}원)</div>
                            <div>수량 : {{info.orderCnt}}개</div>
                            <div>총 결제금액 : {{info.orderPrice2}}원</div>
                        </div>
                    </div>
                    </div>

                    <div class="orderBottom">
                        <div class="orderHistory">
                            <h1>받는 사람 정보</h1>
                            <div class="orderHistoryList">
                                <div>받는 사람 : {{info.userName}}</div>
                                <div>연락처 : {{info.hp}}</div>
                                <div>받는 주소 : {{info.addr}}&ensp;{{info.addr2}}</div>
                            </div>
                        </div>

                        <div class="payMent">
                            <h1>결제정보</h1>
                            <div class="orderPayment">
                                <div>결제 수단 : {{info.payment}}</div>
                                <div>총 결제금액 : {{info.orderPrice2}}원</div>
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

//버튼 누를때 알맞은 화면보이기

var app = new Vue({ 
    el: '#app',
    data: {
    	list : [],
    	info : {},
    	sessionName : "${sessionName}",
    	sessionId : "${sessionId}",
    	orderNo : ""
    }
    , methods : {
    	
    	//주문 상세 내역
    	fnOrderDetail : function(){
            var self = this;
            var nparmap = {orderNo : self.info.orderNo};
            $.ajax({
                url:"/order/detail.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(self.info);
                	console.log(self.info.orderNo);
                	if(self.sessionId == ''){
                		alert("로그인 해주세요");
                		location.href="/login.do";
                	} else{
                		self.info = data.info;	
                	}
                }
            });

        },
    	
    		
    	//회원정보 수정페이지 연결
    	fnUserEdit : function(){
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
    	self.fnOrderDetail();
	}
});
	
</script>
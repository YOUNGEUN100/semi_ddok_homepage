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
      .myArea .contentBox .orderBox .orderTop{
          display: flex; flex-direction: row; justify-content: space-between;
          margin: 10px; font-size: 0.85em; padding: 10px 60px;
      }
      .myArea .contentBox .orderBox .orderCenter{
          width: 80%; margin: 0 auto;
          display: flex; flex-direction: row; flex-wrap: nowrap; align-items: center;
          margin-bottom: 20px; justify-content: space-between;
      }
      .myArea .contentBox .orderBox .orderCenter img{
          width: auto; height: 200px; margin: 10px 20px; cursor: pointer;
      }
      .myArea .contentBox .orderBox .orderCenter .detail{
          text-align: center; margin: 0 20px; cursor: pointer;
      }
      .myArea .contentBox .orderBox .orderCenter .connection{
          font-size: 1.2em; cursor: pointer; font-weight: bold;
          margin-bottom: 20px;
      }
      .myArea .contentBox .orderBox .orderCenter div{
          cursor: auto; 
         
      }
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="app" class="myArea">
            <div class="userBox"> <!--위-->
                <img src="images/Sample_User_Icon.png">
                <div class="edit" title="회원정보 수정은 여길 누르세요" @click="fnUserEdit()">{{sessionName}}님 환영합니다</div>
                
            </div>
            <div class="contentBox"> <!--아래-->
                <div class="menuBox"> <!--메뉴버튼-->
                    <a class="menu" id="order" href="/myPage.do">주문내역</a>
                    <a class="menu" id="recipe" href="/myPage/recipe.do">찜한 레시피</a>
                    <a class="menu" id="funding" href="/myPage/funding.do">펀딩내역</a>
                    <a class="menu" id="review" href="/myPage/review.do">리뷰관리</a>
                </div>  
                
                <div class="orderBox" v-for="(item, index) in list"><!-- 주문내역 요약 -->
                        <div class="orderTop">
                            <div class="order">{{item.orderDate}} {{item.name}}</div><a class="order" href="/myPage/order.do">주문상세보기 >></a>
                        </div>
                        <div class="orderCenter">
                            <a href="/market/view.do"><img :src="item.imgPath" name="상품이미지" ></a>
                            <div class="detail">
                                <a  href="/market/view.do"><div class="connection">{{item.productName}}</div></a>
                                <div>{{item.productPrice2}}원 (100{{item.productVolume}}당 {{item.perPrice}}원)</div>
                                <div>수량 : {{item.orderCnt}}개</div>
                                <div>총 결제금액 : {{item.orderPrice2}}원</div>
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
    	list : []
		, sessionName : "${sessionName}"
		, sessionId : "${sessionId}"

		
    }
    , methods : {
    	
    	//회원정보수정 이동
    	fnUserEdit : function(){
    		var self = this;
    		self.pageChange("/modify.do", {sessionId : self.sessionId});
    	},
    	//주문내역
    	fnOrderProduct : function(){
            var self = this;
            var nparmap = {id : self.sessionId};
            $.ajax({
                url:"/order/product.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(data);
                	if(self.sessionId == ''){
                		alert("로그인을 해주세요");
                		location.href="/login.do";
                		return;
                	}
                	else{
                		self.list = data.list;
                	}
                	
                    
                }
            });

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
    	self.fnOrderProduct();
	}
});
	
</script>
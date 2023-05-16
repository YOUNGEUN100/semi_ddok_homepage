<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


<style>
	<!--스타일 입력 --> 
            .wrapper{
                width: 1200px;
                height: 2600px;
                
                /*background-image: url("./images/order.png");*/
                background-position: center;
                opacity: 0.8;
                background-repeat: no-repeat;
                background-position: right top;            
                
                
            }
            .wrapper .cart{
                width: 1198px;
                height: 80px;
                
                
            }

            #cart_font{
                font-weight: bold;
                font-size: 30px;
                margin-left: 50px;
                margin-top: 20px;
                
                width: 250px;                
            }
            .wrapper .line{
                height: 8px;
                width: 1100px;
                text-align: center;
                margin: auto;
            }
            .wrapper .line .hr{
                border: 0;
                height: 2px;
                background: #ccc;
            }

            .wrapper .line .hr2{
                border: 0;
                height: 2px;
                width: 1100px;
                background: red;
            }

            .wrapper .empt{
                height: 10px;
            }

            .wrapper .buyer{
                width: 1100px;
                height: 160px;
                
                margin: auto;
            }

            .wrapper .buyer .buyer_font{
                font-weight: bold;
                font-size: 20px;                
            }

            .wrapper .delivery{
                width: 1100px;
                height: auto;
                
                margin: auto;
            }
            .wrapper .delivery .delivery_font{
                font-weight: bold;
                font-size: 20px;                
            }            

            .wrapper .delivery .delivery_content{
                width: 950px;
                height: 100px;

                margin-left: 20px;
            }

            table, td, th{
                
                font-size: 15px;
                text-align: center;
                border-collapse: collapse;
                padding: 5px;
                margin: 5px;                 
            }
            #tr1{
                border-top: 2px solid #ccc;
            }
            #tr2{
                border-top: 1px solid #ccc;
                border-bottom: 1px solid #ccc;
            }

            #td1{
                width: 150px;
                border-right: 1px solid #ccc;
            }
            #td2{
                width: 800px;
            }
          #img_size{
              width: 100px;
          }            

            .wrapper .payment_info{
                width: 1100px;
                height: 280px;
                
                margin: auto;
            }
            .wrapper .payment_info .payment_font{
                font-weight: bold;
                font-size: 20px;                
            } 

            .wrapper .payment_info .table1 .payment_method{
                text-align: left;
            }
            .wrapper .payment_info .table1 .payment_method_title{
                width: 800px;
                height: 75px;
                
                border: 2px solid #ccc;
                margin-top: 5px;
                text-align: left;
                padding-left: 10px; 
                line-height: 30px;
            }
            #td2{
                text-align: left;
                padding-left: 20px;
            }

            .wrapper .payment{
                width: 1100px;
                height: 50px;
                
                margin: auto;
                text-align: center;
            }


            .wrapper .payment #btn_buy{
                width: 150px;
                height: 50px;                
                font-weight: bold;
                font-size: 20px;

            }


          #tr11{
              border-top: 1px solid #ccc;
              border-bottom: 1px solid #ccc;
          }

          #td11{
              width: 50px;
          }
          #td12{
              width: 100px;
          }

          #td13{
              width: 570px;
          }
          #td14{
              width: 80px;
              border-left: 1px solid #ccc;
              border-right: 1px solid #ccc;
          }
          #td15{
              width: 120px;
              border-right: 1px solid #ccc;
          }
          #td16{
              width: 80px;
              font-weight: bold;
          }
          
          .wrapper .cart_product_payment{
              width: 1198px;
              height: 100px;
          }
          .wrapper .cart_product_payment_val{
              width: 890px;
              height: 60px;
              border: 3px solid gray;
              text-align: center;
              display: inline-block;
              margin-top: 25px;
              margin-left: 90px;
              line-height: 60px;
              font-weight: bold;
          }
          .wrapper .cart_product_deleteyn{
              height: 70px;
              width: 1050px;
              
              margin: auto;
          }                                          
        
</style>



        <div id="app">


            <!-- pageContent -- START -->
            <div id="pageContent">
                <div class="wrapper">
                    <!-- 작업한 본문 입력 -->
                    <div class="cart">
                        <div id="cart_font">주문/결제</div>
                        <div class="line"><hr class="hr"></div>
                    </div>
                    <div class="empt"></div>
                    <!-- 구매자 정보 -->
                    <div class="buyer">
                        <span class="buyer_font">구매자 정보</span>
                        <div class="empt"></div>
                        <table class="table1">
                            <tr id="tr1">
                                <td id="td1">이름</td>
                                <td id="td2">{{info.name}}</td>	
                            </tr>
                            <tr id="tr2">
                                <td id="td1">이메일</td>
                                <td id="td2">{{info.email}}</td>
                            </tr>
                            <tr id="tr2">
                                <td id="td1">휴대폰</td>
                                <td id="td2">{{info.hp}}</td>
                            </tr>
                        </table>
                    </div>
                    <!-- 받는사람 정보 -->
                    <div class="buyer">
                        <span class="buyer_font">받는사람 정보</span>
                        <div class="empt"></div>
                        <table class="table1">
                            <tr id="tr1">
                                <td id="td1">이름</td>
                                <td id="td2">{{info.name}}</td>
                            </tr>
                            <tr id="tr2">
                                <td id="td1">주소</td>
                                <td id="td2">{{info.addr}}{{info.addr2}}</td>
                            </tr>
                            <tr id="tr2">
                                <td id="td1">연락처</td>
                                <td id="td2">{{info.hp}}</td>
                            </tr>
                        </table>
                    </div>

                    <!-- 배송정보 정보 -->
                    <div class="delivery">
                        <span class="delivery_font">배송 1건중 1</span>
                        <div class="empt"></div>
                        
							<div class="delivery_content" v-for="(item, index) in list">
	                            <table class="table11" >
	                                <tr id="tr11">
	                                    <td id="td11" rowspan="2"><input type="checkbox" :value="item" v-model="selectedItems" @click="fncheckChange(item)"></td>	
	                                    <td id="td12" rowspan="2"><img :src="item.imgPath" id="img_size"></td>
	                                    <td id="td13">{{item.productName}}</td>
	                                    <td id="td14" rowspan="2"><input type="text" id="item.cartNo" :value="item.productPrice*item.productCnt | numberFormat()" size="5" disabled></td>
	                                    <td id="td15" rowspan="2">2500원</td>
	                                    <td id="td16" rowspan="2"><button @click="fnRemove(item)" >삭제</button></td>
	                                </tr>
	                                <tr id="tr11">
	                                    <td>{{item.productPrice*item.productCnt | numberFormat()}}원  
	                                    	<input type="number" size="5" min="1" max="5" v-model="item.productCnt" @input="fnsearchChange($event)">
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                        
	                    <div class="cart_product_deleteyn">
                            <table>
                                <tr>
                                    <td width="100"><input type="checkbox" v-model="selectAll">전체선택</td>
                                    <td width="200"><button @click="getSelectedItems">선택삭제</button></td>
                                </tr>
                            </table>
                        </div>
                        
                        <div class="cart_product_payment">
                            <div class="cart_product_payment_val"><span>상품가격 <input type="text" v-model="total_productPrice"> 원  + 배송비 0원 = 주문금액 4,900원</div>
                        </div>
                        <div class="line">
                            <hr>
                        </div>
                                                
                        
                    </div>

                    <!-- 결제 정보 -->
                    <div class="payment_info">
                        <span class="payment_font">결제 정보</span>
                        <div class="empt"></div>
                        <table class="table1">  
                            <tr id="tr1">
                                <td id="td1">총상품가격</td>
                                <td id="td2">홍길동</td>
                            </tr>
                            <tr id="tr2">
                                <td id="td1">배송비</td>
                                <td id="td2">서울 특별시 구로구 구로디지털로 100</td>
                            </tr>
                            <tr id="tr2">
                                <td id="td1">총결제금액</td>
                                <td id="td2">010-0000-0000</td>
                            </tr>
                            <tr id="tr2">
                                <td id="td1">결제방법</td>
                                <td id="td2">
                                    <div class="payment_method">
                                        <input type="radio">신용/체크카드 <input type="radio">휴대폰
                                    </div>
                                    <div class="payment_method_title">
                                        <div >
                                            - 카드선택 : <input type="text">                                        
                                        </div>
                                        <div >
                                            - 할부기간 : <input type="text">
                                        </div>
                                    </div>
                                    
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="empt"></div>



                    <div class="payment">
                        <button id="btn_buy" @click="requestPay">결제하기</button>
                    </div>
                </div>
            </div>
            <!-- pageContent -- END -->            


        </div>    


<jsp:include page="/layout/tail.jsp"></jsp:include>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>

const userCode = "imp61877255";
IMP.init(userCode);


    var app = new Vue({ 
    el: '#app',
    data: {
        seen: true
        , list : []  
    	, info : {}
        , productNo : ""
        , productCnt : ""
        , sessionId : "${sessionId}"
        , selectedItems : []
        , selectAll: false
        , total_productPrice : 0

    }
    
    ,filters: {
        numberFormat: (value, numFix) => {
            value = parseFloat(value);
            if (!value) return '0';
            return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
        },
    } 
    
    ,
    watch: {
      selectAll(value) {
        if (value) {
          // 전체 선택 체크박스가 선택되었을 때 모든 항목을 선택합니다.
          this.selectedItems = this.list.map(item => item);	
        } else {
          // 전체 선택 체크박스가 해제되었을 때 모든 항목의 선택을 해제합니다.
          this.selectedItems = [];
        }
      }
    }
    
    , methods: {
    	fnGetList : function(){
    		var self = this;
    		var nparmap = {productNo : self.productNo, productCnt : self.productCnt};
    		
    		
    		//장바구니 리스트
    		$.ajax({
                url:"/cart-list.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(data.list);
                	//self.cnt = data.list.length;
                	self.list = data.list;
                }
            });
    		
    		
    	}
    
    	
    
    	//사용자 정보
	    ,fnUserinfo : function(){
			var self = this;
			var nparmap = {userid : self.sessionId};
			
			console.log(nparmap);
			
			$.ajax({
                url:"/userinfo.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(data);
                	self.info = data.info;
                }
            });
			  		
			
			
		}
    	
    	//, fnsearchChange : function(event){
    	//	console.log(event.target.value) // 상품의 갯수가 변경되는지 이벤트를 받아온다
    	//}
    	//갯수 변경 합계 구하기
    	, fnsearchChange : function(event){
    		var self = this;
			var cnt = 0;
			
			
    		console.log(event.target.value) // 상품의 갯수가 변경되는지 이벤트를 받아온다
		      
		      console.log(self.selectedItems);
		      cnt = self.selectedItems.length;

		      if(cnt > 0){
					for (var i = 0; i < cnt; i += 1) {
				    	  console.log(self.selectedItems[i].productPrice);
				    	  console.log(Number(self.selectedItems[i].productCnt));
				    	  self.total_productPrice = self.selectedItems[i].productPrice*Number(self.selectedItems[i].productCnt); 
				    	  
				    	}		    	  
		      }
		      
  	    		
    	}
    	
    	
    	//체크박스 체크
    	, fncheckChange : function(item){
    		var self = this;
			var cnt = 0;
			
			/* console.log(e) */
			
			  
	        console.log(self.selectedItems);
	        cnt = self.selectedItems.length;
	        console.log("test==", cnt);

	        /* if(cnt > 0){ */
				/* for (var i = 0; i < cnt; i += 1) { */
			    	  /* console.log(self.selectedItems[i].productPrice);
			    	  console.log(Number(self.selectedItems[i].productCnt)); */
    	  self.total_productPrice = self.total_productPrice + (item.productPrice*Number(item.productCnt)); 
    	  console.log("test2 == ", self.total_productPrice);
			    	/* } */		    	  
	       /* } */    		    		
    	}
    
    
		    	
		//선택삭제(전체삭제)
		,getSelectedItems() {
			var self = this;
			var cnt = 0;
			
		      //console.log(nparmap);
		      console.log(self.selectedItems);
		      
		      cnt = self.selectedItems.length;
		      
				for (var i = 0; i < cnt; i += 1) {
		    	  
		    	  var nparmap = {cartNo : self.selectedItems[i].cartNo};
		    	  //console.log(nparmap);
		    	  $.ajax({
	    	            url:"/cart-remove.dox",
	    	            dataType:"json",
	    	            type : "POST",
	    	            data : nparmap,
	    	            success : function(data) {
	    	            	self.fnGetList();
	    	            }
	    	      });
		    	}  	      
		      
		      
		      
		      
		   }
	
	  //장바구니 삭제
	    ,fnRemove : function(item){
	    	var self = this;
	        var nparmap = item;
	        
	        console.log(item);
	        if(!confirm("정말 삭제할까요?")){
	        	return;
	        }
	        
	        $.ajax({
	            url:"/cart-remove.dox",
	            dataType:"json",
	            type : "POST",
	            data : nparmap,
	            success : function(data) {
	            	alert("삭제되었습니다.");
	            	self.fnGetList();
	            }
	        });
	        
		}
  
	
	  
	  //쇼핑계속하기
	  ,fnMarket : function(){
		  location.href="/market.do";
	  }
	  
	  , requestPay: function () {
		  	var self = this;
		  	
		  	
	        IMP.request_pay({ // param
	            pg: "html5_inicis.INIBillTst",
	            pay_method: "card",
	            merchant_uid: "order_no_0001",
	            name: "주문자:결제테스트",
	            amount: 100,
	            buyer_email: "gildong@gmail.com",
	            buyer_name: "홍길동",
	            buyer_tel: "010-4242-4242",
	            buyer_addr: "서울특별시 강남구 신사동",
	            buyer_postcode: "01181"
	          }, 
	          rsp => { // callback
	            if (rsp.success) {
	              console.log(rsp);
	              // 결제 성공 시 로직,
	              
	            } else {
	            	console.log(rsp);
	              // 결제 실패 시 로직,
	              
	            }
	          });
	        }
    
    
    }
    
    
    
    , created: function () {
    	var self = this;
        self.fnGetList();	
        self.fnUserinfo();
        
	}
});
    
  
    
</script>
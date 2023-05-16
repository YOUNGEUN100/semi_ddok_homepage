<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


<style>
	<!--스타일 입력 --> 
	.wrapper{
            width: 1200px;
            height: 2600px;
            border: 1px solid #ccc;
            /*background-image: url(./images/smart_market_view.jpg);*/
            background-position: center;
            opacity: 1;
            clear:both;
            
        }

         .wrapper .cart{
              width: 1198px;
              height: 80px;
              
          }

          #cart_font{
              font-weight: bold;
              font-size: 30px;
              margin-left: 100px;
              margin-top: 20px;
              
              width: 250px;                
          }

          .wrapper .cart_menu{
              width: 1198px;
              height: 60px;
              
              display: flex;
              justify-content:space-between; /*좌우정렬*/
              align-items: center; /*상하정렬*/                
          }

          .wrapper .cart_menu .buy{
              width: 50%;
              height: 100%;   
              font-size: 23px;
              font-weight: bold;
              text-align: center;
              line-height: 50px; /* 텍스트 상하정렬*/
              border-top: 1px solid #ccc;
          }

          .wrapper .cart_menu .buy_empt{
              width: 50%;
              background-color: #ccc;
              height: 100%;   
              
          }

          .wrapper .cart_title_border{
              width: 1198px;
              height: 60px;
              
          }
          #table2{
              margin-left: 80px;
              font-weight: bold;
          }
          #tr2{
              border-top: 1px solid #ccc;
              border-bottom: 1px solid #ccc;
          }

          .wrapper .cart_title{
              width: 1198px;
              height: 60px;
              
          }

          .wrapper .cart_title #cart_title_font{
              
              width: 200px;
              height: 50px;
              line-height: 50px;
              margin-left: 120px;
              font-weight: bold;
              font-size: 17px;
          }

          .wrapper .cart_content{
              width: 1198px;
              height: auto;
              
          }

          .wrapper .cart_content .cart_product{
              height: auto;
              width: 1050px;
              
              margin: auto;
              margin-top: 10px;
          }

          table, td, th{
              
              font-size: 15px;
              text-align: center;
              border-collapse: collapse;
              padding: 5px;
              margin: 5px;                
          }
          
          tr{
              height: 52px;
          }
          
          #tr1{
              border-top: 1px solid #ccc;
              border-bottom: 1px solid #ccc;
          }

          #td1{
              width: 50px;
          }
          #td2{
              width: 100px;
          }
          #img_size{
              width: 100px;
          }
          #td3{
              width: 570px;
          }
          #td4{
              width: 80px;
              border-left: 1px solid #ccc;
              border-right: 1px solid #ccc;
          }
          #td5{
              width: 120px;
              border-right: 1px solid #ccc;
          }
          #td6{
              width: 80px;
              font-weight: bold;
          }

          .wrapper .cart_content .cart_product_payment{
              height: 70px;
              width: 1050px;
              
              margin: auto;
              text-align: right;                
          }

          .wrapper .cart_content .cart_product_payment .cart_product_payment_val{
              height: 40px;
              width: 500px;
              
              margin-right: 20px;
              display: inline-block;
              text-align: left;
              line-height: 40px;
              margin-top: 12px;
              
              
          }

          .wrapper .cart_content .line{
              height: 8px;
              width: 1050px;
              text-align: center;
              margin: auto;                
          }
          hr {
              background:#ccc;
              height:1px;
              border:0;
          }

          .wrapper .cart_content .cart_product_deleteyn{
              height: 70px;
              width: 1050px;
              
              margin: auto;
          }

          .wrapper .cart_pay{
              width: 1198px;
              height: 100px;
              
          }

          .wrapper .cart_pay .cart_payment{
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

          

          .wrapper .cart_shopping{
              width: 1198px;
              height: 100px;
              
              text-align: center;
              line-height: 100px;/*위의 height와 높이를 맞추면 가운데 정렬됨*/
          }

          .wrapper .cart_shopping #btn_shop{
              width: 200px;
              height: 60px;
              border-radius: 15px;
              background: #ccc;
              font-weight: bold;
              font-size: 20px;
          }

          .wrapper .cart_shopping #btn_buy{
              width: 200px;
              height: 60px;
              border-radius: 15px;
              background: #ccc;
              font-weight: bold;
              font-size: 20px;
          }
        
</style>


        <div id="app">


            <!-- pageContent -- START -->
            <div id="pageContent">
                <div class="wrapper">
                    <!-- 작업한 본문 입력 -->
                    <div class="cart">
                        <div id="cart_font"><!-- img src="./images/icons8-cart-64.png" width="10"--> 장바구니</div>
                    </div>
                    <div class="cart_menu">
                        <div class="buy">구매목록</div>
                        <div class="buy_empt"></div>
                    </div>
                    <div class="cart_title_border">
                        <table id="table2">
                            <tr id="tr2">
                                <td width="110">전체선택</td>
                                <td width="600">상품정보</td>
                                <td width="80">상품금액</td>
                                <td width="100">배송비</td>
                            </tr>
                        </table>                       
                    </div>
                    <div class="cart_title">
                        <div id="cart_title_font">판매자 배송상품</div>
                    </div>
                    <div class="cart_content">
                        <div class="cart_product" v-for="(item, index) in list">
                            <table class="table1" >
                                <tr id="tr1">
                                    <td id="td1" rowspan="2"><input type="checkbox" :value="item.cartNo" v-model="selectedItems" ></td>	
                                    <td id="td2" rowspan="2"><img :src="item.imgPath" id="img_size"></td>
                                    <td id="td3">{{item.productName}}</td>
                                    <td id="td4" rowspan="2">{{item.productPrice | numberFormat()}}</td>
                                    <td id="td5" rowspan="2">2500원</td>
                                    <td id="td6" rowspan="2"><button @click="fnRemove(item)" >삭제</button></td>
                                </tr>
                                <tr id="tr1">
                                    <td>{{item.productPrice | numberFormat()}}원  <input type="number" size="5" min="1" max="5" v-model="item.productCnt"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="cart_product_payment">
                            <div class="cart_product_payment_val"><span>상품가격 4,900원  + 배송비 0원 = 주문금액 4,900원</span></div>
                        </div>
                        <div class="line">
                            <hr>
                        </div>
                        <div class="cart_product_deleteyn">
                            <table>
                                <tr>
                                    <td width="100"><input type="checkbox" v-model="selectAll">전체선택</td>
                                    <td width="200"><button @click="getSelectedItems">선택삭제</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="cart_pay">
                        <div class="cart_payment">
                            <span>총 상품가격 4,900원  + 총 배송비 0원 = 총주문금액 4,900원</span>
                        </div>
                    </div>
                    <div class="cart_shopping">
                        <button id="btn_shop">계속쇼핑하기</button>
                        <button id="btn_buy">구매하기</button>
                    </div>
                </div>
            </div>
            <!-- pageContent -- END -->            


        </div>      


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script>
    var app = new Vue({ 
    el: '#app',
    data: {
        seen: true
        , list : []  
        , productNo : ""
        , productCnt : ""
        , sessionId : "${sessionId}"
        , selectedItems : []
        , selectAll: false
         
        
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
          this.selectedItems = this.list.map(item => item.cartNo);	
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
    
    	,getSelectedItems() {
    		var self = this;
    		var number_picked = [];
    		var cnt = 0;
    		var cartNo2 = 0;
    		
    	      console.log(nparmap);
    	      console.log(self.selectedItems);
    	      
    	      cnt = self.selectedItems.length;
    	      
    	      
    	      for (var i = 0; i < cnt; i += 1) {
    	    	  
    	    	  var picked = self.selectedItems.pop();
    	    	  
    	    	
    	    	  var nparmap = {cartNo : picked};
    	    	  console.log(nparmap);
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
    
    
    }
    
    
    
    , created: function () {
    	var self = this;
        self.fnGetList();		
	}
});
</script>
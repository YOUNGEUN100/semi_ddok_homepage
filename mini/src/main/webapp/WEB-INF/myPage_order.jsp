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
          width: 25%; height: 25%; margin: 10px 30px; cursor: pointer;
      }
      .myArea .contentBox .orderBox .orderCenter .detail{
          text-align: center; margin: 0 30px; cursor: pointer;
      }
      .myArea .contentBox .orderBox .orderCenter div:first-child{
          font-size: 1.2em; cursor: pointer; font-weight: bold;
          margin-bottom: 20px;
      }
      
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="app" class="myArea">
            <div class="userBox"> <!--위-->
                <img src="/./images/Sample_User_Icon.png">
                <div class="edit" title="회원정보 수정은 여길 누르세요">{{sessionName}}님 환영합니다</div>
                
            </div>
            <div class="contentBox"> <!--아래-->
                <div class="menuBox"> <!--메뉴버튼-->
                    <div class="menu" id="order" >주문내역</div>
                    <div class="menu" id="recipe" >찜한 레시피</div>
                    <div class="menu" id="funding" >펀딩내역</div>
                    <div class="menu" id="review" >리뷰관리</div>
                </div>  
                
                <div class="orderBox" id="orderBox"><!-- 주문내역 요약 -->
                       
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
    	sessionName : "${sessionName}"	
    }
    , methods : {
    		
		   	 
	}	
    , created: function () {
    
	}
});
	
</script>
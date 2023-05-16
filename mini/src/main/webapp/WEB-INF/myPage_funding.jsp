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

      .myArea .contentBox .fundingBox{
          width: 100%; box-shadow: 0 0 5px #ccc;
          display: flex; flex-direction: row; border-radius: 20px;
          justify-content: space-between; align-items: center; margin-top: 30px
      }
      .myArea .contentBox .fundingBox img{
          width: 100%; border: 1px solid #ccc;
          border-radius: 50%; margin: 5px; cursor: pointer;
      }
      .myArea .contentBox .fundingBox .fundContent{
          width: 70%;
      }
      .myArea .contentBox .fundingBox .fundContent h1{
          font-size: 1.8em; margin-bottom: 20px; cursor: pointer; margin-top:15px;
      }
      .myArea .contentBox .fundingBox .fundDetail{
          width: 90%;
          font-size: 0.8em; display: flex; flex-direction: row; justify-content: space-between;
          padding: 10px 0;
      }
      .myArea .contentBox .fundingBox progress{
          width: 90%;
          font-size: 1.5em;
          margin-bottom: 10px;
      }
      .myArea .contentBox .fundingBox .fundPrice p{
          display: inline-block; margin-right: 20px; margin-bottom:15px;
      }
      .myArea .contentBox .fundingBox .fundPrice p:last-child{
          font-size: 1.4em; font-weight: bold; color: #5EA152;
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
                    <a class="menu" id="order" href="/myPage.do">주문내역</a>
                    <a class="menu" id="recipe" href="/myPage/recipe.do">찜한 레시피</a>
                    <a class="menu" id="funding" href="/myPage/funding.do">펀딩내역</a>
                    <a class="menu" id="review" href="/myPage/review.do">리뷰관리</a>
                </div>  
          
                <div class="fundingBox" id="fundingBox"><!-- 참여한 펀딩내역 요약 -->
                    <div class="fundImg">
                        <img src="images/f_toilet.png">
                    </div>
                    <div class="fundContent">
                        <h1>크리넥스 3겹 데코 앤 소프트 수딩플러스 화장지 27m 팩, 24롤</h1>
                        <div class="fundnIfo">코튼과 알로에베라 로션으로 피부에 더 편안하고 부드러운 마무리의 도톰한 3겹 제품</div>
                        <div class="fundDetail"><p>100명 중 13명</p><p>금일 10시 종료</p></div>
                        <div>
                            <progress max="100" value="13"></progress>
                        </div>
                        <div class="fundPrice"><p>공구가</p><p>19,900원</p></div>
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
    	sessionName : "${sessionName}"	
    }
    , methods : {
    		
		   	 
	}	
    , created: function () {
    
	}
});
	
</script>
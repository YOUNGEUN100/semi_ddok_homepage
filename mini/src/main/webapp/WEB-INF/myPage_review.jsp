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
          margin-top: 15px;
          padding: 5px;
          margin-bottom: 20px;
          background-color: #5EA152;
          color: #fff; border: 0; border-radius: 8px; width: 110px; 
          font-size: 0.8em; font-weight: bold; 
      }
      .myArea .contentBox .reviewBox .star{
          display: flex; flex-direction: column; align-items: center;
      }

      .star-rating {
          display: flex;
          flex-direction: row-reverse;
          font-size: 2.25rem;
          line-height: 2.5rem;
          justify-content: space-around;
          padding: 0 0.2em;
          text-align: center;
          width: 5em;
      }
      .star-rating input {
          display: none;
      }
      .star-rating label {
          -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
          -webkit-text-stroke-width: 2.3px;
          -webkit-text-stroke-color: #2b2a29;
          cursor: pointer;
      }
      .star-rating :checked ~ label {
          -webkit-text-fill-color: gold;
      }
      .star-rating label:hover,
      .star-rating label:hover ~ label {
          -webkit-text-fill-color: #fff58c;
      }
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="app" class="myArea">
            <div class="userBox"> <!--위-->
                <img src="images/Sample_User_Icon.png">
                <div class="edit" title="회원정보 수정은 여길 누르세요">님 환영합니다</div>
                
            </div>
            <div class="contentBox"> <!--아래-->
                <div class="menuBox"> <!--메뉴버튼-->
                    <div class="menu" id="order" >주문내역</div>
                    <div class="menu" id="recipe" >찜한 레시피</div>
                    <div class="menu" id="funding" >펀딩내역</div>
                    <div class="menu" id="review" >리뷰관리</div>
                </div>  
                </div>
                <div class="reviewBox" id="reviewBox"><!-- 리뷰관리 -->
                    <div class="reviewTop">
                        <div class="review">2023.05.12 배송완료</div><div class="review">주문번호 : 14513325</div>
                    </div>
                    <div class="reviewCenter">
                        <img src="images/product_apple_thumb.jpg" name="상품이미지">
                        <div class="detail">
                            <div>첫 출하 빨간 가정용 햇 사과 5KG</div>
                            <div>19,900원(100g당 398원)</div>
                            <div>수량 : 3개</div>
                            <div>총 결제금액 : 59,700원</div>
                        </div>
                        <div class="star">
                            <div class="star-rating space-x-4 mx-auto">
                                <input type="radio" id="5-stars" name="rating" value="5" />
                                <label for="5-stars" class="star pr-4">★</label>
                                <input type="radio" id="4-stars" name="rating" value="4" />
                                <label for="4-stars" class="star">★</label>
                                <input type="radio" id="3-stars" name="rating" value="3" />
                                <label for="3-stars" class="star">★</label>
                                <input type="radio" id="2-stars" name="rating" value="2" />
                                <label for="2-stars" class="star">★</label>
                                <input type="radio" id="1-star" name="rating" value="1"  />
                                <label for="1-star" class="star">★</label>
                            </div>
                            <p>점/5점</p>
                            <button class="reviewBtn">등록하기</button>
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
    		
    }
    , methods : {
    		
		   	 
	}	
    , created: function () {
    
	}
});
	
</script>
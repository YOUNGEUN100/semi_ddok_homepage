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


      .myArea .contentBox .recipeBox{
          width: 100%; display: flex; flex-direction: row; justify-content: space-between;
          margin-top: 30px; margin-bottom: 20px; 
      }
      .myArea .contentBox .recipeBox .recipeImg{
          width: 95%; height: 90%; cursor: pointer;
      }
      .myArea .contentBox .recipeBox .recipeDetail{
          font-size: 1.1em; font-weight: bold; cursor: pointer; 
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
                <div class="recipeBox" ><!-- 찜한 레시피 요약 -->
                    <div>
                        <img  name="레시피이미지" class="recipeImg">
                        <div>{{info.hashtag}}</div>
                        <div class="recipeDetail"></div>    
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">

var app = new Vue({ 
    el: '#app',
    data: {
    	info : {}
    	, sessionName : "${sessionName}"
    	, sessionId : "${sessionId}"
  	    , recipeNo : "${map.recipeNo}"
    }
    , methods : {
    	
    	fnLikeRecipe : function(recipeNo){
            var self = this;
            var nparmap = {recipeNo : self.recipeNo};
            // 레시피 설명
            $.ajax({
                url:"/recipe/like.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(data);
                    self.info = data.info;
                    console.log(data.info);
                }
            });

        }
		   	 
	}	
    , created: function () {
    
	}
});
	
</script>
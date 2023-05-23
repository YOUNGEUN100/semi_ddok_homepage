<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	.myArea{ background-color: #fff;  margin: 0 auto;  padding: 30px 40px;  display: flex; flex-direction: column; justify-content: center; align-items: center; }
    .myArea .userBox{ width: 20%; height: 100%;  border:0; margin-bottom:20px;text-align: center;display: flex; flex-direction: column; justify-content: center; align-items: center;   }
    .myArea .userBox div{color: black;}
    .myArea .userBox img{width: 60px; height: 60px; }
    .myArea .userBox .edit{margin-bottom: 20px; font-size: 1.2em;  }
    .myArea .userBox .edit:hover{color: #5EA152; cursor: pointer;}
    .myArea .contentBox{ width: 80%;  display: flex; flex-direction: column; justify-content: center;  align-items: center; }
    .myArea .contentBox .menuBox{ width: 100%; display: flex; flex-flow: row nowrap; justify-content: center;    }
    .myArea .contentBox .menuBox .menu{ width: 25%; text-align: center; padding: 10px; box-shadow: 0 0 4px 0 #ccc; cursor: pointer;  }
    .myArea .contentBox .menuBox .menu_recipe {background-color:var(--base-colorBasicGray);}
    .myArea .contentBox .menuBox .menu:first-child{border-top-left-radius: 5px; border-bottom-left-radius: 5px;box-shadow: -2px 0 5px 0 #ccc; }
    .myArea .contentBox .menuBox .menu:last-child{ border-top-right-radius: 5px;  border-bottom-right-radius: 5px; box-shadow: 2px 0 5px 0 #ccc;}
    .myArea .contentBox .menuBox .menu:hover{ background-color: #eee; color: black;  }
    .myArea .contentBox .menuBox .menu:visited{ background-color: #ccc; color: black;  }
    .myArea .contentBox .recipeBox{ width: 100%; display: grid; grid-template-columns: repeat(3,1fr); grid-template-rows: repeat(4,270px); row-gap: 50px; column-gap: 15px; margin-top: 30px; margin-bottom: 50px; }
    .myArea .contentBox .recipeBox .recipeImg{ width: 95%; height: auto; cursor: pointer;   }
    .myArea .contentBox .recipeBox .recipeDetail{font-size: 1.1em; font-weight: bold; cursor: pointer; }
    .myArea .contentBox .recipeBox .recipeItem img {width:100%;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="myRecipe" class="myArea">
            <div class="userBox"> <!--위-->
                <img src="/./images/Sample_User_Icon.png">
                <a href="/modify.do" class="edit" title="회원정보 수정은 여길 누르세요" @click="fnUserEdit()">{{sessionName}}님 환영합니다</a>       
            </div>
            <div class="contentBox"> <!--아래-->
                <div class="menuBox"> <!--메뉴버튼-->
                    <a class="menu" id="order" href="/myPage.do">주문내역</a>
                    <a class="menu menu_recipe" id="recipe" href="/myPage/recipe.do">찜한 레시피</a>
                    <a class="menu" id="funding" href="/myPage/funding.do">펀딩내역</a>
                    <a class="menu" id="review" href="/myPage/review.do">리뷰관리</a>
                </div>  
                <div class="recipeBox itemList"><!-- 찜한 레시피 요약 -->
                    <div class="recipeItem" v-for="(item, index) in list" @click="fnRecipeView(item.recipeNo)">
                        <img :src="item.imgPath"  name="레시피이미지" class="recipeImg">
                        <div>{{item.hashtag}}</div>
                        <div class="recipeDetail">{{item.recipeName}}</div>    
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">

var myRecipe = new Vue({ 
    el: '#myRecipe',
    data: {
    	list : []
    	, sessionName : "${sessionName}"
    	, sessionId : "${sessionId}"
  	    
    }
    , methods : {
    	//찜한레시피
    	fnLikeRecipe : function(){
            var self = this;
            var nparmap = {userId : self.sessionId};
            $.ajax({
                url:"/recipe/like.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(self.sessionId);
                	self.list = data.list;
                	console.log(data.list);
                	console.log(self.list);
                    
                }
            });

        },
        fnUserEdit : function(){
    		var self = this;
    		self.pageChange("/modify.do", {sessionId : self.sessionId});
    	},
    	// 레시피 상세 페이지 이동
		fnRecipeView : function(recipeNo) {
			var self = this;	
			console.log(recipeNo);
	    	self.pageChange("/recipe/view.do", {recipeNo : recipeNo});
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
    	self.fnLikeRecipe();
	}
});
	
</script>
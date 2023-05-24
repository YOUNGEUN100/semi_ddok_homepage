<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	.myArea {background-color: #fff; margin: 0 auto; padding: 30px 80px;    display: flex; flex-direction: column; justify-content: center;   align-items: center;}

    .myArea .userBox {width: 20%; height: 100%;border:0;   text-align: center; }
    .myArea .userBox div {color: black;}
    .myArea .userBox img {width: 60px; height: 60px; }
    .myArea .userBox .edit { margin-bottom: 20px; font-size: 1.2em;}
    .myArea .userBox .edit:hover {color: #5EA152; cursor: pointer;}
    .myArea .contentBox {width: 80%;  display: flex; flex-direction: column; justify-content: center;  align-items: center; }
    .myArea .contentBox .menuBox {width: 100%; display: flex; flex-flow: row nowrap;   justify-content: center;}
    .myArea .contentBox .menuBox .menu {width: 25%; text-align: center; padding: 10px; box-shadow: 0 0 4px 0 #ccc; cursor: pointer; }
    .myArea .contentBox .menuBox .menu_funding {background-color:var(--base-colorBasicGray);}
    .myArea .contentBox .menuBox .menu:first-child {border-top-left-radius: 5px; border-bottom-left-radius: 5px;  box-shadow: -2px 0 5px 0 #ccc; }
    .myArea .contentBox .menuBox .menu:last-child {border-top-right-radius: 5px;  border-bottom-right-radius: 5px;  box-shadow: 2px 0 5px 0 #ccc;}
    .myArea .contentBox .menuBox .menu:hover {background-color: #eee; color: black; }
    .myArea .contentBox .menuBox .menu:visited {background-color: #ccc; color: black; }
    .myArea .contentBox .fundingBox {width: 100%; box-shadow: 0 0 5px #ccc;display: flex; flex-direction: row; border-radius: 20px;  margin-top: 30px; }
    .myArea .contentBox .fundingBox img {width: 80%; border: 1px solid #ccc; border-radius: 50%; margin: 5px; cursor: pointer; }
    .myArea .contentBox .fundingBox .fundContent {width: 70%; margin-left:20px;  }
    .myArea .contentBox .fundingBox .fundContent h1 {font-size: 1.8em; margin-bottom: 20px; cursor: pointer; margin-top:15px; }
    .myArea .contentBox .fundingBox .fundDetail {width: 90%; font-size: 0.8em; display: flex; flex-direction: row; justify-content: space-between;  padding: 10px 0;  }
    .myArea .contentBox .fundingBox progress {width: 90%; font-size: 1.5em;   margin-bottom: 10px;  }
    .myArea .contentBox .fundingBox .fundPrice p {display: inline-block; margin-right: 20px; margin-bottom:15px;}
    .myArea .contentBox .fundingBox .fundPrice p:last-child {font-size: 1.4em; font-weight: bold; color: #5EA152; }
	.myArea .contentBox .fundingBox .funImg {text-align : center;}
    
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="myFunding" class="myArea">
            <div class="userBox"> <!--위-->
                <img src="/./images/Sample_User_Icon.png">
                <div class="edit" title="회원정보 수정은 여길 누르세요" @click="fnUserEdit()">{{sessionName}}님 환영합니다</div>
                
            </div>
            <div class="contentBox"> <!--아래-->
                <div class="menuBox"> <!--메뉴버튼-->
                    <a class="menu" id="order" href="/myPage.do">주문내역</a>
                    <a class="menu" id="recipe" href="/myPage/recipe.do">찜한 레시피</a>
                    <a class="menu menu_funding" id="funding" href="/myPage/funding.do">펀딩내역</a>
                    <a class="menu" id="review" href="/myPage/review.do">리뷰관리</a>
                </div>  
          
                <div class="fundingBox" v-for="(item, index) in list"><!-- 참여한 펀딩내역 요약 -->
                
                    <div class="fundImg">
                        <a @click="fnViewFunding(item)"><img :src="item.imgPath"></a>
                    </div>
                    <div class="fundContent">
                        <a @click="fnViewFunding(item)"><h1>{{item.fundingName}}</h1></a>
                        <div class="fundnIfo">{{item.fundingSummary}}</div>
                        <div class="fundDetail"><p>{{item.fundingGoalCnt}}명 중 {{item.cnt}}명</p><p>{{item.dDay}}일 남음</p></div>
                        <div>
                            <progress max="100" value="13"></progress>
                        </div>
                        <div class="fundPrice"><p>공구가</p><p>{{item.fundingPrice2}}원</p></div>
                    </div>
                
               	</div> 
            </div>

        </div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">

var myFunding = new Vue({ 
    el: '#myFunding',
    data: {
    	list : [],
    	sessionName : "${sessionName}",
    	sessionId : "${sessionId}"	
    }
    , methods : {
    	
    	fnAttendFunding : function(){
            var self = this;
            var nparmap = {userId : self.sessionId};
            $.ajax({
                url:"/funding/attend.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
                	console.log(data.list);
                	
                    
                }
            });

        },
        fnUserEdit : function(){
    		var self = this;
    		self.pageChange("/modify.do", {sessionId : self.sessionId});
    	},
        // 오픈중 펀딩 상세페이지로
        fnViewFunding: function(item) {
        	var self = this;
        	console.log(item.fundingNo);
        	console.log(item.fundingKind);
        	var todayTime = new Date();
        	console.log(todayTime);
        	if(item.fundingKind == "O") {
        		self.pageChange("../funding/view/open.do", {fundingNo : item.fundingNo});	
        	} else {
        		self.pageChange("../funding/view/planned.do", {fundingNo : item.fundingNo});	
        	}
        	
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
    	self.fnAttendFunding();
	}
});
	
</script>
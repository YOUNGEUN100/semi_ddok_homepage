<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	 .findArea{ 
        width: 600px; margin: -10px auto;
        background-color: #fff;}

	    .findArea .idBox{
	        box-shadow: -2px 0 5px 0 #ccc; padding: 15px;   
	        border-top-left-radius: 10px; display: inline-block; width: 49.1%;
	        border-bottom-left-radius: 10px; font-size: 1.2em; 
	        font-weight: bold; text-align: center; margin-left: 5px;
	        background-color: #fff; color: black;}
	    .findArea .pwBox{
	        box-shadow: 2px 0 5px 0 #ccc; padding: 15px;
	        border-top-right-radius: 10px; display: inline-block; width: 49.8%;
	        border-bottom-right-radius: 10px; font-size: 1.2em; 
	        font-weight: bold; text-align: center; margin-left: 1px;
	        background-color: #fff; color: black;}
	
	    .findArea .reultBox{
	        margin-top: 55px; box-shadow: 0 0 5px #ccc; border-radius: 20px;
	        padding: 50px 95px; font-weight: bold; font-size: 1.1em;
	        } 
        .findArea .reultBox .guideBox{
            text-align: center; font-size: 1.1em; margin-bottom: 40px;
            margin-top: -10px;
            }
        .findArea .reultBox .titleId{
            display: inline-block; width: 50%; text-align: end; 
            font-size: 0.9em; padding-right: 30px;
            }
        .findArea .reultBox .findId{
        display: inline-block; width: 50%; text-align: start; 
        font-size: 0.9em; color: #5EA152;
        }

	    .findArea .reultBox .findLoginBtn{
	        margin-top: 40px; background-color: #5EA152; color: #fff;
	        padding: 12px; border: 0; border-radius: 10px; width: 78%; margin-left: 50px;
	        font-weight: bold; font-size: 1.1em; margin-bottom: 5px; text-align: center; 
	    }
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		<!-- wrap START -->
    	<div id="app" class="findArea">
	        <div class="idBox">아이디 찾기 </div><div class="pwBox">비밀번호 찾기</div>
	        <div class="reultBox">
	            <div class="guideBox">고객님의 아이디는 아래와 같습니다.</div>
	            <div class="titleId">아이디</div><div class="findId">{{id}}</div>
	            <a class="findLoginBtn" href="/login.do">로그인 하기</a>
	        </div>
    	</div>

    </div>
    	<!-- wrap END -->

	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    		id : ""
    }
    , methods : {
		   	 fnFindId : function(data){
		 		var self = this;
		 		var nparmap ={};
		 		$.ajax({
		            url:"/user/findId.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {  
		            	console.log(data);
		            	
		            }
	        }); 
	 	}
    }	
    , created: function () {
    
	}
});	
</script>

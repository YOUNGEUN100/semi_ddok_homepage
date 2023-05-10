<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	.loginArea{
	     width: 400px; margin: 0 auto;
	     box-shadow: 0 0 10px #e6e5e5; border-radius: 10px;
	     padding: 70px;
	}
	
	.loginArea .loginBox{
		 display: flex; flex-direction: column; justify-items: center; 
		 align-items: center; 
	}
	.loginArea .loginBox input{
		 border: none; border-bottom: 1px solid black;
		 width: 100%; padding: 5px; margin-bottom: 20px; 
		 padding-left: 10px;
	} 
	.loginArea .loginBox input:last-child{
	 	margin-bottom: 40px;
	}
	.loginArea .loginBox input::placeholder{color: black; font-weight: bold; font-size: 0.9em;}
	
	
	.loginArea .btnBox .loginBtn{
		 background-color: #5EA152; border: none; color: #fff;
		 border-radius: 10px; padding: 10px; width: 100%;
		 font-weight: bold; font-size: 1em;
		 margin-bottom: 30px;
	}
	
	.loginArea .linkBox{
		 font-size: 0.8em; display: flex; flex-direction: row;
		 flex-wrap: nowrap; justify-content: space-between;
	}
</style>





<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
	
		<div id="app" class="loginArea">
	
	        <div class="loginBox">
	            <input type="text" placeholder="아이디" v-model="id">
	            <input type="password" placeholder="비밀번호" v-model="pw">
	        </div> 
	
	        <div class="btnBox">
	            <button class="loginBtn" @click="fnLogin">로그인</button>
	        </div>
	        <div class="linkBox">
	            <a href="join.do">혹시 똑똑이 처음이신가요?</a>
	            <a href="find.do">아이디/비밀번호 찾기</a>
	        </div>
	    </div>
    
	</div>
</div>
<!-- pageContent -- END -->

<script type="text/javascript">
	var app = new Vue({ 
	    el: '#app',
	    data: {
	    	id : ""
	    	, pw : ""
	    	, user : {}
	    }   
	    , methods: {
	    	fnLogin : function(){
	            var self = this;
	            var nparmap = {id : self.id, pw : self.pw};
	            $.ajax({
	                url:"/login.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	alert(data.message);
	                	console.log(data.message);
	                	if(data.result == "success"){
	                		location.href = "main.do"
	                	}
	                }
	            });
	   	 }
	    }   
	    , created: function () {
	    	
		}
	});
</script>

<jsp:include page="/layout/tail.jsp"></jsp:include>

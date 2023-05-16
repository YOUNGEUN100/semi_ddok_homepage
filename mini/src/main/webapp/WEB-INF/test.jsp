<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	  
<html>
    <head>
        
        <script src="js/jquery.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

        
        <style>
            .wrapper{
                width: 800px;
                height: 300px;                
                border: 2px solid #ccc;
                margin: auto;
            }

            .id{
                width: 500px;
                height: 50px;
                margin-left: 50px;
                margin-top: 30px;
            }

            .pass{  
                width: 500px;
                height: 50px;
                margin-left: 50px;

            }
            
            .btn{  
                width: 500px;
                height: 50px;
                margin-left: 50px;

            }
            

            
        </style>
    </head>
    <body>      
        <div id="app">
                <div class="wrapper">
                    <div class="id">아이디 : <input type="text" placeholder="아이디를 입력하세요" v-model="userid"> </div>
                    <div class="pass">패스워드 : <input type="password" placeholder="패스워드를 입력하세요" v-model="userpass"> </div>
                    <div class="btn"><button @click="fnLogin">로그인</button></div>
                </div>
                
        </div>      
    </body>
</html>



<script>




    var app = new Vue({ 
    el: '#app',
    data: {
        seen: true
        , list : []  
    	, info : {}
        , userid : ""
        , userpass : ""

    }
    
    
    , methods: {
    	fnLogin : function(){
    		var self = this;
    		
    		
    		if(self.userid==""){
    			alert("아이디를 입력하세요");
    			return;
    		}
    		
    		if(self.userass==""){
    			alert("패스워드를 입력하세요");
    			return;
    		}
    		
    		
    		var nparmap = {userid : self.userid, userpass : self.userpass};
    		
    		console.log(nparmap);
    		
    		//유저정보 가져오기
    		$.ajax({
                url:"/usertest-info.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(data);
                	//self.cnt = data.list.length;
                	//self.list = data.list;
                	
                	if(data.result=="success"){
                		alert("로그인 성공");
                	}else{
                		alert("로그인 실패");
                	}
                }
            });
    		
    		
    		
    		
    	}
    
		
    
    
    }
    
    
    
    , created: function () {
    	var self = this;
        //		
	}
});
    
  
    
</script>
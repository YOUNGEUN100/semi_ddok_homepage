<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


	<style>
        .slidewrap {
        	position:relative;
            max-width: 1200px;
            margin:0 auto;
            overflow:hidden;
        }        
        .PreBtn {position:absolute;top:50%;left:3%;}
        .NextBtn {position:absolute;top:50%;right:3%;}
        .slidelist {
            width:100%;
            white-space: nowrap;
            padding:0;
            font-size: 0;
            transition: all .5s;
        }
        .slidelist li {
            display:inline-block;
            vertical-align:middle;
            width:100%;
            
        }
        .slidelist a {
            display:block;
            position:relative;
        }
        .slidelist img {
            width:100%;
        }  
    </style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <div id="app">
		  	<div class="slidewrap" >
            	<ul class="slidelist">
                	<li class="lili" v-for="(item, index) in list">
                    	<a>
                        	<img :src="item.imgPath">
                    	</a>                        
                	</li>                 
             	</ul>
             	<div class="PreBtn" @click="fnPreBtn"><i class="fa-solid fa-chevron-left fa-2xl"></i></div>
		  		<div class="NextBtn" @click="fnNextBtn"><i class="fa-solid fa-chevron-right fa-2xl"></i></div>
             </div>
		  		
		  	
		 	
		 </div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
/* $(function() {
    $("#btn1").on("click",function(){
        $(".slidelist").css("transform", "translateX(0%)");
    })
})
$(function() {
    $("#btn2").on("click",function(){
        $(".slidelist").css("transform", "translateX(-100%)");
    })
})
$(function() {
    $("#btn3").on("click",function(){
        $(".slidelist").css("transform", "translateX(-200%)");
    })
})
$(function() {
    $("#btn4").on("click",function(){
        $(".slidelist").css("transform", "translateX(-300%)");
    })
})
$(function() {
    $("#btn5").on("click",function(){
        $(".slidelist").css("transform", "translateX(-400%)");
    })
})
$(function() {
    $("#btn6").on("click",function(){
        $(".slidelist").css("transform", "translateX(-500%)");
    })
}) */

/* document.querySelector("#btn1").addEventListener('click', function () {
        document.querySelector(".slidelist").style.transform = "translateX(0%)";
    })
document.querySelector("#btn2").addEventListener('click', function () {
        document.querySelector(".slidelist").style.transform = "translateX(-100%)";
    })
document.querySelector("#btn3").addEventListener('click', function () {
        document.querySelector(".slidelist").style.transform = "translateX(-200%)";
    })
document.querySelector("#btn4").addEventListener('click', function () {
        document.querySelector(".slidelist").style.transform = "translateX(-300%)";
    })
document.querySelector("#btn5").addEventListener('click', function () {
        document.querySelector(".slidelist").style.transform = "translateX(-400%)";
    }) */

var app = new Vue({
	
    el: '#app',
    data: {
    	list : [],
    	sessionId : "${sessionId}",
    	cardNo : "${map.cardNo}",
    	num : "",
    	page: 0

    }
    , methods : {
    	
    	fnCardInfo : function(){
            var self = this;
            var nparmap = {cardNo : self.cardNo};
            $.ajax({
                url:"/livingTip/view.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
                	self.num = data.list.length;
                	console.log(self.num);
                	console.log(data.list);
                	
                    
                }
            });

        }
    
    , fnPreBtn: function() {
    	var self = this;
    	
    	if(self.page > 0) {
    		self.page--;
    		$(".slidelist").css("transform", "translateX(-" + self.page + "00%)");
    		console.log(self.page);
    	}
    }
    
    , fnNextBtn: function() {
    	var self = this;
    	if(self.page < self.num-1) {
    		self.page++;
    		$(".slidelist").css("transform", "translateX(-" + self.page + "00%)");
    		console.log(self.page);
    	}
    		  	    		
    }
     
    
    
    
    
    	
    
    	
    	    
	}	
    , created: function () {
    	var self = this;
    	self.fnCardInfo();
	}
});
</script>
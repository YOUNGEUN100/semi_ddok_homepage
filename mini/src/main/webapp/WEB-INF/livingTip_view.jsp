<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


	<style>
        .slidewrap {
            max-width: 1200px;
            margin:0 auto;
            overflow:hidden;
        }
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
              </div>
		  	
		  	<button id="btn1">1</button>
		  	<button id="btn2">2</button>
		  	<button id="btn3">3</button>
		  	<button id="btn3">4</button>
		  	<button id="btn3">5</button>
		  	<button id="btn3">6</button>
		  	
		 	
		 </div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
$(function() {   //jQuery = $
    $("#btn1").on("click",function(){
        $(".slidelist").css("transform", "translateX(0%)");
    })
})
$(function() {   //jQuery = $
    $("#btn2").on("click",function(){
        $(".slidelist").css("transform", "translateX(-100%)");
    })
})
$(function() {   //jQuery = $
    $("#btn3").on("click",function(){
        $(".slidelist").css("transform", "translateX(-200%)");
    })
})
$(function() {   //jQuery = $
    $("#btn4").on("click",function(){
        $(".slidelist").css("transform", "translateX(-300%)");
    })
})
$(function() {   //jQuery = $
    $("#btn5").on("click",function(){
        $(".slidelist").css("transform", "translateX(-400%)");
    })
})
$(function() {   //jQuery = $
    $("#btn6").on("click",function(){
        $(".slidelist").css("transform", "translateX(-500%)");
    })
})

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
    	cardNo : "${map.cardNo}"

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
                	console.log(data.list);
                	
                    
                }
            });

        }
    
    
    
    
    
    	
    
    	
    	    
	}	
    , created: function () {
    	var self = this;
    	self.fnCardInfo();
	}
});
</script>
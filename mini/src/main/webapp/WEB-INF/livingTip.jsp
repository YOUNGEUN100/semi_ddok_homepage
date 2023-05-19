<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	 .card_list {display: flex;flex-wrap: wrap;justify-content: space-between;}
	 .card_list .card {width:30%;margin:16px;}
	 .card_list img {cursor:pointer;}
</style>


<!-- pageContent -- START -->
<div id="app">
	<div id="pageContent">
		<div class="wrapper">
		 	<div id="app">
		 		<button @click="fnAddTip">등록</button>
		
		 		<div class="card_list" >
                	<div class="card" v-for="(item, index) in list">
                    	<img class="recipe-img" :src="item.imgPath" @click="fnViewCard(item.cardNo)">
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
    	list : [],
    	sessionId : "${sessionId}"

    }
    , methods : {
    	
    	fnCardList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/livingTip/list.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
                	console.log(data.list);
                	
                    
                }
            });

        }
    
    	, fnViewCard: function(cardNo) {
    		var self = this;
    		self.pageChange("./livingTip/view.do", {cardNo : cardNo});
    		
    	}
    
    	, pageChange : function(url, param) {
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
    	
    	, fnAddTip : function() {
    		var self = this;
    		location.href = "/livingTip/edit.do";
    	}
    	    
	}	
    , created: function () {
    	var self = this;
    	self.fnCardList();
	}
});
</script>
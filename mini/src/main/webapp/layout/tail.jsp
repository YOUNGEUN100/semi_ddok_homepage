<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/includeFooter.jsp"></jsp:include>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#gnbUser',
    data: {
      list : []
      , info : {}
      , sessionId : "${sessionId}"
      , sessionStatus : "${sessionStatus}"
      , sessionNick : "${sessionNick}"
      , logFlg : false
     
    }   
    , methods: {
         fnMain : function(){
             var self = this;
             var nparmap = {id : self.sessionId };
             $.ajax({
                 url:"/main/session.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) { 
                	console.log(data);
                	lacation.href = "main.do";
 	               /* self.list = data.bbslist;
 	                self.logFlg =  true;*/
                 }
             });
    	 },
    	 fnChange :function(){
    		 var self = this;
    		 if(sesstionId == null){
    			 self.logFlg = false;
    		 }
    		 else{
    			 self.logFlg = true;
    		 }
         	 
    	 },
    	 fnLogout : function(){
             var self = this;
             self.logFlg = !self.logFlg;
             self.sessionId = "";
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
    	
	}
});
</script>
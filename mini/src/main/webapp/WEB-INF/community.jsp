<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	<!--스타일 입력 --> 
	table { width : 100%;}
    table, td,th {
        border-collapse: collapse;
        padding: 16px;
        table-layout: fixed;
    }
    th {border-bottom:1px solid black;}
    button {
       font-size: medium;
       padding: 5px 10px;
       margin-right:10px;
       border-radius: 10px;
       border: 1px solid gainsboro;
       background-color: gainsboro;
       width: 80px;
       height: 40px;
       background-color: #E4DBD6;
    }
    button:hover {cursor: pointer;}
	.comlist {
		border: none;
        box-sizing: border-box;
        padding: 40px 40px;
        width: 1200px;
        margin-top: 20px;
        margin-bottom : 20px;
        border-radius: 20px;
        box-shadow: 0px 0px 20px 5px #e7e6e6;
	}
	.comlist .center{text-align:center; }
	.comlist #title:hover{cursor: pointer;}
	#no{width:10%; }
	#title{width:50%;text-align:left;}
	#writer{width:10%;}
	#date{width:20%;}
	#view{width:10%;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <!-- 작업한 본문 입력 -->
	<div id="app">
       
        <select>
         <option value = "recent">최신순</option>
         <option value = "view">조회수</option>
        </select>
      
          <div class="comlist">
             <table>                            
             	<thead>
             		<tr>
             			<th>연번</th>
             			<th>제목</th>
             			<th>작성자</th>
             			<th>작성일</th>
             			<th>조회수</th>
             		</tr>
             	</thead>
             	
             	<tbody>
	              	<tr class="center" v-for="(item, index) in list" >
                        <td id="no">{{index}}</td>
                        <td id="title" @click="fnViewCom(item.boardNo)">{{item.content}}</td>
   	                    <td id="writer">{{item.userId}}</td>
       	                <td id="date">{{item.cdatetime}}</td>
               	        <td id="view">{{item.hits}}</td>
	                  </tr>                                 
              </tbody>        	                       
             </table>
           </div>
                        
		
           <button>글쓰기</button>
 
	</div>
	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
 // 자바 스크립트 입력 
  var app = new Vue({
            el: '#app',
            data: {
              list : [],
              cnt : 0
            }
            , methods: {
            	// 커뮤니티 리스트
                fnGetComList: function () {
                    var self = this;   		
            		var startNum = ((self.selectPage-1) * 10);
            		var nparmap = {};
                    $.ajax({
                        url: "/community/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                        	console.log(data.list);
                        	self.list = data.list;
                           self.cnt = data.cnt;
                           // self.pageCount = Math.ceil(self.cnt / 10);  

                        }
                    });
                }
            		<!-- 페이징 추가 7-->
        		, fnSearch : function(pageNum){
        			var self = this;
        			self.selectPage = pageNum;
        			var startNum = ((pageNum-1) * 10);
        			console.log(pageNum);
        			console.log(startNum);
        			var nparmap = {startNum : startNum};
        			$.ajax({
        				url : "/community/list.dox",
        				dataType : "json",
        				type : "POST",
        				data : nparmap,
        				success : function(data) {
        					self.list = data.list;
        					self.cnt = data.cnt;
        					self.pageCount = Math.ceil(self.cnt / 10);
        				}
        			});
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
            	
            	// 커뮤니티 글보기
            	, fnViewCom: function(boardNo) {
            		var self = this;
            		self.pageChange("/community/view.do", {boardNo : boardNo});            		
            	}
            	
            	// 커뮤니티 글쓰기
            	, fnAddCom: function() {
            		var self = this;
            		if (self.sessionId == "") {
            			if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {            				
            				location.href="/login.do"
            				return;
            			} else {
            				return;
            			}            			
            		}
            		location.href = "/community/edit.do";
            	}


            }
            , created: function () {
            	var self = this;
                self.fnGetComList();
            }
        });
</script>
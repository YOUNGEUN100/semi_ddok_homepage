<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	.wrapper .qbtn {  font-size: medium; padding: 5px 10px; margin-right:10px; border-radius: 10px;border: 1px solid gainsboro; background-color: gainsboro;width: 80px; height: 40px; background-color: #E4DBD6;}
    .wrapper .qbtn:hover {cursor: pointer;}
	.comlist table { width : 100%; table-layout:fixed;}
    .comlist table, td,th {  border-collapse: collapse; padding: 16px; table-layout: fixed; }
    .comlist th {border-bottom:1px solid black;}
	.comlist {display: flex; flex-direction: column;border: none;box-sizing: border-box;padding: 40px 40px;margin-top: 20px;margin-bottom : 20px;border-radius: 20px;box-shadow: 0px 0px 20px 5px #e7e6e6;}
	.comlist .center{text-align:center; }
	.comlist .title:hover{cursor: pointer;}
	.comlist .title{text-align:left;}
	.comlist .complete {color: var(--main-colorGreen); border:1px solid var(--main-colorGreen); padding: 1px;}
	.comlist .progress {color: var(--main-colorRed); border:1px solid var(--main-colorRed); padding: 1px;}
	
	.pagination { margin:24px;display: inline-flex;}
    ul { text-align: center; }
	.pagination li {min-width:32px;padding:4px 8px; text-align:center;margin:0 3px; border-radius: 6px; border:1px solid #eee;color:#666; display : inline;}
	.pagination li:hover {background: #E4DBD6;}
	.page-item a {color:#666;text-decoration: none;}
	.pagination li.active {background-color : #E7AA8D;color:#fff;}
	.pagination li.active a {color:#fff;}
	#page {text-align:center;} 
	
	.qnaBtnBox {text-align:center;}
	.qnaBtn {width:150px;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper" id="qnaList">
		<!-- 사용고려중_ display:none 으로 줌 -->
	 	<select v-model = "order" @change = "fnChangeOrder()" style="display:none;">
	        <option value = "" selected disabled>정렬</option>
	         <option value = "recent">최신순</option>
	         <option value = "view">조회수</option>
        </select>
        
        <div class="qnaBtnBox">
        	<button class="qnaBtn"  @click="fnqOrder(2)">자주 묻는 질문</button>
        	<button class="qnaBtn" @click="fnqOrder(1)">회원 문의</button>
        </div>
      
        <div class="comlist">
           <table>                            
	          	<thead>
	          		<tr>
	          			<th>글번호</th>
	          			<th colspan=3>제목</th>
	          			<th>작성자</th>
	          			<th>작성일</th>
	          			<th>조회수</th>
	          		</tr>
	          	</thead>
	          	<tbody>
	            	<tr class="center" v-for="(item, index) in list" >
	                     <td class="no">{{index+1}}</td>
	                 	<template>
	                      <td colspan=3 class="title" v-if="item.status=='A'" @click="fnViewCom(item.boardNo)"><strong>{{item.title}}</strong></td>
	                      <template v-if="item.status=='C'">
	                        	<td colspan=3 class="title"  v-if="item.commentNo > 0" @click="fnViewCom(item.boardNo)"><span class="complete">답변완료</span> {{item.title}} </td>
	                        	<td colspan=3 class="title" v-if="item.commentNo == 0" @click="fnViewCom(item.boardNo)"><span class="progress">답변대기</span> {{item.title}}</td>
	                      </template>
	                    
	                     </template>
	                    <td class="writer">{{item.nick}}</td>
    	                <td class="date">{{item.cdatetime}}</td>
            	        <td class="view">{{item.hits}}</td>
	                </tr>                                 
            	</tbody>        	                       
           </table>
         </div>
         
         <button class="qbtn" @click="fnAddCom()">문의하기</button>
           
          <!-- 페이징 추가3 -->
          <div id="page">
	          <template >
				  <paginate id="page"
				    :page-count="pageCount"
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch"
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
			</template>         
		</div>
		 

	</div>
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)

var qnaList = new Vue({
          el: '#qnaList',
          data: {
            list : [],
            cnt : 0,
            cnt1 : 0,
            cnt2: 0,
            // 페이징 추가5
   		 selectPage : 1,
   		 pageCount : 1,
   	     sessionId: "${sessionId}",    
   		 sessionStatus : "${sessionStatus}",
   		 order : "recent",
   		 category : ""
          }
          , methods: {
          	// 커뮤니티 리스트
              fnGetQnaList: function () {
                var self = this;   
      			var startNum = ((self.selectPage-1) * 10);
          		var nparmap = {startNum : startNum, order : self.order, category : self.category};
          		//console.log(self.order);
                  $.ajax({
                      url: "/qna/list.dox",
                      dataType: "json",
                      type: "POST",
                      data: nparmap,
                      success: function (data) {
                      	//console.log(data.list);
                      	self.list = data.list;
                         self.cnt = data.cnt;
                         self.cnt1 = data.cnt1;
                         self.cnt2 = data.cnt2;
                         	if (self.category == 1) {
                         		self.pageCount = Math.ceil(self.cnt1 / 10);
                         	} else if (self.category == 2) {
                         		self.pageCount = Math.ceil(self.cnt2 / 10);
                         	} else {
                         		self.pageCount = Math.ceil(self.cnt / 10);
                         	}
                      }
                  });
              }
	            , fnChangeOrder: function () {
	                var self = this;                    
	                self.fnGetQnaList();
	            }
	            ,fnqOrder : function (num) {
	            	var self = this;
	            	if (num == 1) {self.category = 1; self.selectPage = 1;}
	            	if (num == 2) {self.category = 2; self.selectPage = 1;}
	            	self.fnGetQnaList();
	            }
          	<!-- 페이징 추가 7-->
      		, fnSearch : function(pageNum){
      			var self = this;
      			self.selectPage = pageNum;
      			var startNum = ((pageNum-1) * 10);
      			var nparmap = {startNum : startNum, order : self.order, category : self.category};
      			$.ajax({
      				url : "/qna/list.dox",
      				dataType : "json",
      				type : "POST",
      				data : nparmap,
      				success : function(data) {
      					//console.log(data.list);
                      	self.list = data.list;
                         self.cnt = data.cnt;
                         self.cnt1 = data.cnt1;
                         self.cnt2 = data.cnt2;
                         //console.log(self.cnt);
                         	if (self.category == 1) {
                         		self.pageCount = Math.ceil(self.cnt1 / 10);
                         	} else if (self.category == 2) {
                         		self.pageCount = Math.ceil(self.cnt2 / 10);
                         	} else {
                         		self.pageCount = Math.ceil(self.cnt / 10);
                         	}
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
          		self.pageChange("/qna/view.do", {boardNo : boardNo});            		
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
          		location.href = "/qna/edit.do";
          	}


          }
          , created: function () {
          	var self = this;
              self.fnGetQnaList();
          }
      }); 
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
	<!--스타일 입력 --> 
	.comTable { width : 100%;}
    .comTable, td,th {
        border-collapse: collapse;
        padding: 16px;
        table-layout: fixed;
    }
    .comTable .myboard {color: var(--main-colorGreen);font-weight:bold}
    th {border-bottom:1px solid black;}
    .comBtn {
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
    .comBtn:hover {cursor: pointer;}
	.comlist {
		display: flex;
	    flex-direction: column;
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
	.comlist .title:hover{cursor: pointer; text-decoration: underline;}
	.comlist .title{text-align:left;}
	
	/* 페이징 추가2 */
	.pagination { margin:24px;display: inline-flex;}
    ul { text-align: center; }
	.pagination li {
	    min-width:32px;
	    padding:4px 8px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {background: #E4DBD6;}
	.page-item a {color:#666;text-decoration: none;}
	.pagination li.active {background-color : #E7AA8D;color:#fff;}
	.pagination li.active a {color:#fff;}
    /* 페이징 추가 끝 */
	#page {text-align:center;}
	
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <!-- 작업한 본문 입력 -->
	<div id="communityList">
       
        <select v-model = "order" @change = "fnChangeOrder()">
        <option value = "" selected disabled>정렬</option>
         <option value = "recent">최신순</option>
         <option value = "view">조회수</option>
        </select>
      
          <div class="comlist">
             <table class="comTable">                            
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
                        <td class="no">{{item.boardNo}}</td>
	                   <template>
	                         <td colspan=3 class="title" v-if="item.status=='A'" @click="fnViewCom(item.boardNo)"><strong>{{item.title}} <i v-if="item.filePath" class="fa-regular fa-folder fa-xs"></i></strong></td>
	                         <template v-if="item.status=='C'">
	                       		  <td colspan=3 class="title myboard" v-if="item.userId==sessionId" @click="fnViewCom(item.boardNo)">{{item.title}} <i v-if="item.filePath" class="fa-regular fa-folder fa-xs"></i> </td>
	                       		  <td colspan=3 class="title"  v-else @click="fnViewCom(item.boardNo)">{{item.title}} <i v-if="item.filePath" class="fa-regular fa-folder fa-xs"></i></td>
	                         </template>
                        </template>
                       
   	                    <td class="writer">{{item.nick}}</td>
       	                <td class="date">{{item.cdatetime}}</td>
               	        <td class="view">{{item.hits}}</td>
	                  </tr>                                 
              </tbody>        	                       
             </table>
           </div>
           
           <button class="comBtn" @click="fnAddCom()">글쓰기</button>
           
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
</div>
<!-- pageContent -- END -->


<jsp:include page="/layout/tail.jsp"></jsp:include>

<script type="text/javascript">
 // 자바 스크립트 입력 
 Vue.component('paginate', VuejsPaginate)
 
  var communityList = new Vue({
            el: '#communityList',
            data: {
              list : [],
              cnt : 0,
              // 페이징 추가5
     		 selectPage : 1,
     		 pageCount : 1,
     	     sessionId: "${sessionId}",    
     		 sessionStatus : "${sessionStatus}",
     		 order : "recent"
            }
            , methods: {
            	// 커뮤니티 리스트
                fnGetComList: function () {
                    var self = this;   
                 // 페이징 추가6
        			var startNum = ((self.selectPage-1) * 10);
            		var nparmap = {startNum : startNum, order : self.order};
            		console.log(self.order);
                    $.ajax({
                        url: "/community/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                        	console.log(data.list);
                        	self.list = data.list;
                            self.cnt = data.cnt;
                            console.log("게시글의 개수는 :" + self.cnt);
      					 	self.pageCount = Math.ceil(self.cnt / 10);
                        }
                    });
                }
	            , fnChangeOrder: function () {
	                var self = this;                    
	                self.fnGetComList();
	            }
            	<!-- 페이징 추가 7-->
        		, fnSearch : function(pageNum){
        			var self = this;
        			self.selectPage = pageNum;
        			var startNum = ((pageNum-1) * 10);
        			console.log(startNum);
        			var nparmap = {startNum : startNum, order : self.order};
        			$.ajax({
        				url : "/community/list.dox",
        				dataType : "json",
        				type : "POST",
        				data : nparmap,
        				success : function(data) {
        					self.list = data.list;
        					console.log(self.list);
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
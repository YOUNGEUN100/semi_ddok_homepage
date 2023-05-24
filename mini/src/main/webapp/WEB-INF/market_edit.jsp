<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>    

    <style>
        /* style START */
        /* * {
    border: 1px dotted rgb(223, 60, 141);
} */

        .container {
            width: 1200px;
            position: relative;
            margin: auto;

        }

        h1 {
            text-align: center;
        }

        .input_form {
            border: 1px solid #999999 ;
            border-radius: 10px;
            width: 1100px;
            margin: 50px auto;
            padding: 26px;
            border-radius: 15px;
            border: none;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .input_form div {
            margin-top: 16px;
        }

        .input_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }

        .input_box span {
            display: inline-block;
            width: 15%;
            font-size: 18px;
        }

        .input_box input {
            border: 1px solid #999999;
            border-radius: 10px;
            height: 40px;
        }

        .title,
        .summary {
            width: 50%;
        }

        .file_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }

        .content_box,
        .file_box p {
            font-size: 18px;
        }

        .content {
            width: 100%;
            border: 1px solid #999999;
            border-radius: 10px;
            padding : 16px;
        }

        .btn_box button {
            border: none;
            width: 100px;
            height: 40px;
            margin-left: 16px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">
                <div class="container">
                    <div class="input_form">
                        <div class="input_box">
                            <div class="title_box">
                                <span>상품종류</span>
                                <select class="sel" name="productKind" id="productKind" v-model="info.productKind">
                                	<option value="" selected="selected">:::상품종류선택:::</option>
								    <option v-for="(info, index) in codeList" :value="info.code">{{info.name}}</option>								    
								</select>
                            </div>
                            <div class="title_box">
                                <span>상품명</span> <input class="title" type="text" v-model="info.productName"> ex) 국내산 로메인 (텍스트)
                            </div>
                            <div class="weight_box">
                                <span>상품 무게</span> <input class="title" type="number" v-model="info.productWeight"> ex) 2000 (숫자만)/ 단위: g, ml등
                            </div>
                            <div class="ea_box">
                                <span>상품 개수</span> <input class="title" type="number" v-model="info.productEa"> ex) 5 (숫자)
                            </div>
                            <div class="volume_box">
                                <span>상품 용량</span> 
                                <select class="sel" name="productVolume" id="productVolume" v-model="info.productVolume">
                                	<option value="" selected>::: 용량선택 :::</option>								    								    
                                	<option value="g" >그램(g)</option>
                                	<option value="ml" >밀리리터(ml)</option>
								</select>                                 
                            </div>
                            <div class="product_title_box">
                                <span>상품명 타이틀설명</span> <input class="title" type="text" v-model="info.title">
                            </div>
                            <div class="price_box">
                                <span>상품 가격</span> <input class="title" type="number" min="0" v-model="info.productPrice"> ex) 3000 (숫자 : 컴마없이 숫자만)
                            </div>
                            <div class="stock_box">
                                <span>상품 재고수량</span> <input class="title" type="number" min="0" v-model="info.productStock"> ex) 5 (숫자)
                            </div>
                            <div class="open_date_box">
                                <span>할인여부</span>
                                <select class="sel" name="discountYN" id="discountYN" v-model="info.discountYN">
                                	<option value="" selected>::: 선택 :::</option>								    								    
                                	<option value="Y" >예</option>
                                	<option value="N" >아니요</option>
								</select>
                                
                            </div>
                            <div class="price_box">
                                <span>상품 상세내용</span> 
                                <vue-editor v-model="info.content"></vue-editor>
                            </div>

                        </div>

                        <div class="file_box">

                            <div class="thumb_box">
                            	<p>썸네일 이미지</p>
                                <input type="file" id="file1" name="file1">
                                <p>상세 이미지</p>
                                <input type="file" id="file2" name="file2" multiple>                                 
                            </div>
                            

                        </div>

                        <div class="btn_box">
                            <button @click="fnaddProduct">등록</button>
                            <button @click="upload">파일등록</button>
                            <button>수정</button>
                        </div>



                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>

    <script type="text/javascript">     
    	console.log(Vue);
    	Vue.use(Vue2Editor);
    	const VueEditor = Vue2Editor.VueEditor;
    	
        var app = new Vue({
            el: '#app',
            data: {
                info: {
                		productNo: "",
                		productName: "",
                		productKind: "",
                		productWeight: "",
                		productEa: "",
                		productVolume: "",
                		title:"",
                		content:"",
                		productPrice:"",
                		productStock:"",
                		productCnt:"",
                		discountYN:"",
                		deleteYN:""
                	
                },                
                sessionId: "${sessionId}",
                codeList : ${map.codeList}        		
        	}
            , components: {VueEditor}
            , methods: {
            	fnGetList : function(){
            		var self = this;
            		var nparmap = {product_kind : self.product_kind};
            		
            		
            		//상품리스트
            		$.ajax({
                        url:"/smartmarket-list.dox",
                        dataType:"json",
                        type : "POST",
                        data : nparmap,
                        success : function(data) {
                        	console.log(data.list);
                        	self.cnt = data.list.length;
                        	self.list = data.list;
                        }
                    });

            	}
	           	 //상품등록
	            ,fnaddProduct : function(info){
	    	    	var self = this;
	    	        var nparmap = self.info;
	    	        //console.log("test===",nparmap);
	    	        $.ajax({
                        url:"/addProduct.dox",
                        dataType:"json",
                        type : "POST",
                        data : nparmap,
                        success : function(data) {
                        	console.log("=============2222결과 : ",data.productNo);
                        	//self.list = data.list;
                        	

                        	// 썸네일 이미지
                            var form = new FormData();
                            form.append( "file1",  $("#file1")[0].files[0] );								
							form.append( "productNo",  data.productNo);// pk							
							self.upload(form);
                            
							// 상세 이미지
                            for(var i = 0; i<$("#file2")[0].files.length; i++) {
								//append는 이어붙이는 명령어라 첫번째 파일을 보내고 다시 폼을 만들어 두번째 파일을 보내줘야함
								var form = new FormData(); 
								form.append( "file2",  $("#file2")[0].files[i] );								
								form.append( "productNo",  data.productNo);// pk
								self.upload2(form);
							}                              	
                        	
                            location.href = "/market.do";
                        	
                        }
                    });
	    		}
	            , upload : function(form){
	    			var self = this;
	         		$.ajax({
	            	 	url : "/fileUpload_product2.dox"
	           		, type : "POST"
	           		, processData : false
	           		, contentType : false
	           		, data : form
	          	 	, success:function(response) { 
	        	   	
	          		 }
	           
	       			});
				}
            
            	, upload2 : function(form){
    	    		var self = this;
    	         	$.ajax({
    	             	url : "/fileUpload_product3.dox"
    	           	, type : "POST"
    	           	, processData : false
    	           	, contentType : false
    	           	, data : form
    	           	, success:function(response) { 
    	        	   	
    	          	 }
    	           
    	       		});
    			}
            }
                ,
                created: function () {
                    var self = this;
                	self.fnGetList();
                }
            });
    </script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
#result {text-align:center;}
.imgBox {width:300px; height:300px; border-radius:50%; background:var(--base-colorBasicGray); margin:1em auto 2em;}
.replayBtn {font-weight:600;}
.replayBtn i {margin-right:0.2em;}
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div id="app">
		<div class="wrapper">
		<jsp:include page="/layout/includeLoading.jsp"></jsp:include>
			<div id="result">
	 			<h3 class="resultTitle">
					오늘 <span>닭갈비</span> 어때요?
				</h3>
				<div class="imgBox">
					<img src="" alt="">
				</div>
				<a class="replayBtn" href="/todayEat/recipe.do"><i class="fa-solid fa-reply"></i> 다시 추천받기</a>
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
        info: {}
    },
    methods: {
        fnGetRecipe: function () {
            var self = this;
            var nparmap = self.info;
            };
            $.ajax({
                url: "",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.info = data.info;
                    console.log(data.info);
                }
            });
        }
        ,
        created: function () {
            var self = this;
            self.fnGetRecipe();
        }
    });
</script>
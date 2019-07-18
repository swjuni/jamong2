<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="incs/topSearch.jsp" %>
<script type="text/javascript">
	$(function(){
		$("input[name=left]").click(function(){
			$(this).parent().parent().siblings(".roll:last").animate({"margin-left": '-=227'},1000,function(){
				$(this).append("<div class='case-box cateM'>"+$(this).children('div:first').html()+"</div>");
				$(this).children('div:first').remove();
				$(this).attr("style","margin-left: 130px;");
			});
		});
		
		$("input[name=right]").click(function(){
			$(this).parent().parent().siblings(".roll:first").animate({"margin-left": '+=227'},1000,function(){
				$(this).prepend("<div class='case-box cateM'>"+$(this).children('div:last').html()+"</div>");
				$(this).children('div:last').remove();
				$(this).attr("style","margin-left: 130px;");
			});
			
		});
	})
</script>
<style type="text/css">
	.case-box{
		padding: 0;
		width: 200px;
		height:130px;
		float: left;
		margin-left: 17px;
   		margin-right: 10px;
	}
	
	.section-title {
    	margin-bottom: 20px;
	}
	
	.categorySection {
 	   margin-bottom: 84px;
	}
	
	.container .case-box p {
    	z-index: 1;
    	position: absolute;
    	color: white;
    	padding-left:15px;
    	background: linear-gradient( to top, #00000085, #fffafa00);
    	width: 100%;
    	height: 34px;
   		margin-top: -34px;
	}
	
	input.btn.btn-transparent {
   		padding: 0px 8px;
    	background: white;
    	color: #f57b65;
	}
	
	input.btn.btn-transparent:active {
		background: #f57b65;
		color: white;
	}
	
	input.btn.btn-transparent:focus{
		outline: none;
	}

	.categorySection .container {
    	width: 1700px;
    	margin-left: 130px;
	}
	
	.firs ,.sec{
		width: 376px;
		background-color: white;
		z-index: 2;
		position:absolute;
		padding: 0;
		height:130px;
		float: left;
	}
	
	.firs{
		margin-left: 0px;
	}
	.sec {
		margin-left: 1516px;
    	margin-top: -130px;
    	width: 405px;
	}
	
	.roll>div:last-child{
		float: right;
	    margin-top: -130px;
	    margin-right: -134px;
	}
	
	.section1{
		padding-bottom: 45px;
	}
	
	.round{
		border-radius: 70px;
		-moz-border-radius: 70px;
		-khtml-border-radius: 70px;
		-webkit-border-radius: 70px;
	}
</style>
<section class="section section1">
	<c:forEach begin="0" var="vo" end="1" items="${list }">
	<div class="categorySection">
		<div class="section-title text-center">
		<small>
			<input name="left" type="button" class="btn btn-transparent" value="&lt;">
				&nbsp;&nbsp;&nbsp;${vo.categoryNameL } 카테고리 둘러보기&nbsp;&nbsp;&nbsp;
			<input name="right" type="button" class="btn btn-transparent" value="&gt;">
		</small>
		</div>
		<div class="firs"></div>
		<div class="container roll">
			<c:import url="/main/showCategoryMimg.do?no=${vo.categoryNo }"/>
		</div>
		<div class="sec"></div>
	</div>
	</c:forEach>
</section>
<section class="section">
	<div class="container">
		<div class="row">
			<c:if test="${empty adsList }">
			<div class="col-md-5" style="height: 500px; width: 560px;; margin-top: -100px; border: 1px solid #ea5035c9; border-radius: 20px;">
				<small>진행중인 광고가 없습니다.</small>
			</div>
			</c:if>
			<c:if test="${!empty adsList }">
			<div class="col-md-5" style="height: 500px; width: 560px;; margin-top: -100px;">
				<c:forEach var="map" items="${adsList }">
					<div style="height:150px; padding: 26px 32px; margin: 25px 0px; background: #f7b66d24;">
						<img alt="" src="<c:url value='/upload/ads/${map["FILE_NAME"] }'/>" style="width: 100px; height: 100px;float: left; margin-right: 32px; "class="round">
						<small class="section-title" style="margin-bottom:0px;"><strong>${map['ID'] }</strong></small>
						<p><small>${map['INTRODUCTION'] }</small></p>
					</div>
				</c:forEach>
			</div>
			</c:if>
			<div class="col-md-5" style="height: 500px; width: 500px; margin-top: -75px; border: 1px solid #ea5035c9; border-radius: 20px; float: right;">
				실시간 평가<br>
				
			</div>
		</div>
	</div>
</section>
<%@include file="incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="incs/topSearch.jsp" %>
<script type="text/javascript">
	$(function(){
		$("input[name=left]").click(function(){
			if($(this).parent().parent().siblings(".roll").children(".inside").is(":animated")){
				return;
			}else{
				$(this).parent().parent().siblings(".roll").children(".inside").animate({"margin-left": '-=220'},700,function(){
					$(this).append("<div class='case-box cateM'>"+$(this).children('div:first').html()+"</div>");
					$(this).children('div:first').remove();
					$(this).attr("style","text-align: center;");
				});
			}
		});
		
		$("input[name=right]").click(function(){
			if($(this).parent().parent().siblings(".roll").children(".inside").is(":animated")){
				return;
			}else{
				var box="<div class='case-box cateM'>"+$(this).parent().parent().siblings(".roll").children(".inside").children('div:last').html()+"</div>"
				$(this).parent().parent().siblings(".roll").children(".inside").prepend(box);
				$(this).parent().parent().siblings(".roll").children(".inside").children('div:last').remove();
				$(this).parent().parent().siblings(".roll").children(".inside").children("div:first").attr("style","margin-left:-220px;");
				$(this).parent().parent().siblings(".roll").children(".inside").children("div:first").animate({"margin-left": '+=220'},700,function(){
					$(this).attr("style","text-align: center;");
				});
			}
		});
	})
</script>
<style type="text/css">
	.case-box{
		padding: 0;
		width: 196.08px;
		height:100%;
		float: left;
   		margin-right: 1.2%;
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
    	width: 1073px;
    	text-align: center;
    	height: 130px;
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

    .inside {
		overflow: hidden;
	    height: inherit;
	    width: 2000px;
	}
	.roll{ 
		padding-left: 0 !important;
		padding-right: 0 !important;
	    height: 130px;
    	overflow-x: hidden;
	}
	
	iframe {
		width: 50%;
	    height: 550px;
	    margin-left: 2%;
	    margin-top: -10%;
	    border: none;
	}
	
	.backimg{
	height:100%;
	}
	
	.cccenter{
		display:table; margin-left:auto; margin-right:auto;
		PADDING-TOP: 38%;
    	FONT-SIZE: x-large;
    	FONT-WEIGHT: bold;
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
		<div class="container roll">
			<div class="inside">
				<c:import url="/main/showCategoryMimg.do?no=${vo.categoryNo }"/>
			</div>
		</div>
	</div>
	</c:forEach>
</section>
<section class="section">
	<div class="container">
		<div class="row">
			<c:if test="${empty map }">
			<div class="col-md-5" style="height: 500px; width: 560px;; margin-top: -100px; border: 1px solid #ea5035c9; border-radius: 20px;">
				<small>순위권에 든 전문가가 없습니다</small>
			</div>
			</c:if>
			<c:if test="${!empty map }">
			<div class="col-md-5" style="height: 530px; width: 560px;; margin-top: -100px; border-radius: 20px;">
			<div style="background-image: url(<c:url value='/resources/images/금메달2.PNG'/>);" class="backimg">
			<div style="width: 100%;height: 100%">
				<span class="cccenter">연간 최우수 전문가 : ${map['USERID'] }</span>
				<span class="cccenter" style="padding-top: 5%;color:red;">총 수익금 : ${map['PRICESUM'] } 원 </span>
			</div>
			</div>
			</div>
			</c:if>
			
			<iframe src="<c:url value='/main/evalUpdate.do'/>" scrolling="no"></iframe>
		</div>
	</div>
</section>
<%@include file="incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="incs/topSearch.jsp" %>
<script type="text/javascript">
	$(function(){
		var $flag = 0;
		$("input[name=left0]").click(function(){
			if ($flag == 0) {
				$flag=1;	//연속 클릭 이벤트 중복 방지 플레그
				$("#rollTar0 .inside div").last().parent().prependTo("#rollTar0 .inside");
				$("#rollTar0 .inside div").first().attr("style","margin-left: -200px;");
				$("#rollTar0 .inside div").first().animate({"margin-left": '+=200'},"slow", function(){
					$("#rollTar0 .inside div").attr("style","margin-left: 4px;");
					$flag=0;
				});
			}
		});
		
		$("input[name=right0]").click(function(){
			if ($flag == 0) {
				$flag=1;	//연속 클릭 이벤트 중복 방지 플레그
				$("#rollTar0 .inside div").first().animate({"margin-left": '-=200'},"slow", function(){
					$("#rollTar0 .inside div").first().appendTo("#rollTar0 .inside");
					$("#rollTar0 .inside div").attr("style","margin-left: 4px;");
					$flag=0;
				});
			}
		});
		
		$("input[name=left1]").click(function(){
			if ($flag == 0) {
				$flag=1;	//연속 클릭 이벤트 중복 방지 플레그
				$("#rollTar1 .inside div").last().parent().prependTo("#rollTar1 .inside");
				$("#rollTar1 .inside div").first().attr("style","margin-left: -200px;");
				$("#rollTar1 .inside div").first().animate({"margin-left": '+=200'},"slow", function(){
					$("#rollTar1 .inside div").attr("style","margin-left: 4px;");
					$flag=0;
				});
			}
		});
		  
		$("input[name=right1]").click(function(){
			if ($flag == 0) {
				$flag=1;	//연속 클릭 이벤트 중복 방지 플레그
				$("#rollTar1 .inside div").first().animate({"margin-left": '-=200'},"slow", function(){
					$("#rollTar1 .inside div").first().appendTo("#rollTar1 .inside");
					$("#rollTar1 .inside div").attr("style","margin-left: 4px;");
					$flag=0;
				});
			}
		});	

	})
</script> 
<style type="text/css">
	.case-box{ 
		padding: 0;
		width: 179px;
		height:130px;
		float: left;
		margin-left: 4px;
   		margin-right: 4px;
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
    	height: 130px;
    	overflow: hidden;
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

	.firs{
		width: 179px;
		height:130px;
		z-index: 2;
		position:absolute;
		float: left;
		background-color: transparent;
	}
	.sec{
		width: 179px;
		height:130px;
		z-index: 2;
		position:relative;
		float: right;
		background-color: transparent;
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

</style>

<section class="section section1">
	<c:set var="i" value="0"/>
	<c:forEach begin="0" var="vo" end="1" items="${list }">
	<div class="categorySection">
		<div class="section-title text-center">
		<small>
			<input name="left${i }" type="button" class="btn btn-transparent" value="&lt;">
				&nbsp;&nbsp;&nbsp;${vo.categoryNameL } 카테고리 둘러보기&nbsp;&nbsp;&nbsp;
			<input name="right${i }" type="button" class="btn btn-transparent" value="&gt;">
		</small>
		</div>
		<div class="container roll" id="rollTar${i }">
<!-- 			<div class="firs"></div>
			<div class="sec"></div> -->
			<div class="inside">
				<c:import url="/main/showCategoryMimg.do?no=${vo.categoryNo }"/>
			</div>
		</div>
	</div>
	<c:set var="i" value="${i+1 }"/>
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
					<div class="service-box" style="height:150px; padding: 26px 32px; margin: 25px 0px;">
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
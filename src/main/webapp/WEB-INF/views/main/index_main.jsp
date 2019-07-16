<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="incs/topSearch.jsp" %>
<script type="text/javascript">
	$(function(){
		$("input[name=left]").click(function(){
			$(".cateM:eq(0)").animate({"margin-left": '-=227'},1000,function(){
				$(".cateM:eq(0)").remove();
			});
		});
		
		$("input[name=right]").click(function(){
			$(".cateM:eq(5)").remove();
			$(".cateM:eq(0)").animate({"margin-left": '+=227'},1000, function(){
				$(".cateM:eq(4)").remove();
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
    	margin-left: 60px;
	}
	
	.firs ,.sec{
		background-color: white;
		z-index: 2;
	}
	
	.case-box.sec {
    	margin-left: 1379px;
    	margin-top: -130px;
	}
</style>
<section class="section">
	<c:forEach begin="0" var="vo" end="1" items="${list }">
	<div class="categorySection">
		<div class="section-title text-center">
		<small>
			<input name="left" type="button" class="btn btn-transparent" value="&lt;">
				&nbsp;&nbsp;&nbsp;${vo.categoryNameL } 카테고리 둘러보기&nbsp;&nbsp;&nbsp;
			<input name="right" type="button" class="btn btn-transparent" value="&gt;">
		</small>
		</div>
		<div class="container">
			<div class="case-box firs"></div>
			<c:import url="/main/showCategoryMimg.do?no=${vo.categoryNo }"/>
			<div class="case-box sec"></div>
		</div>
	</div>
	</c:forEach>
		<!-- 
	select * from category_m
	where category_no_l=1 and category_no_m<15 and rownum=1
	order by category_no_m desc -->
</section>
<%@include file="incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="incs/topSearch.jsp" %>
<script type="text/javascript">
	$(function(){
		
	})
</script>
<style type="text/css">
	.case-box{
		padding: 0;
		width: 200px;
		height:130px;
		float: left;
		margin-left: 59px;
	}
	
	.section-title {
    	margin-bottom: 20px;
	}
	
	.categorySection {
 	   margin-bottom: 84px;
	}
	
	p {
    	z-index: 1;
    	position: absolute;
    	color: white;
    	padding-left:7px;
    	background-color: #1b1a1a52;
    	width: 100%;
	}
</style>
<section class="section">
	<c:forEach begin="0" var="vo" end="1" items="${list }">
	<div class="categorySection">
		<div class="section-title text-center">
			<small>${vo.categoryNameL } 카테고리 둘러보기</small>
		</div>
		<div class="container">
			<c:import url="/main/showCategoryMimg.do?no=${vo.categoryNo }"/>
		</div>
	</div>
	</c:forEach>
</section>
<%@include file="incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->

</body>
</html>
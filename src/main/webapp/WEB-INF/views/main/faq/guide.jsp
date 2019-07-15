<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<!-- 각 화면별 내용 코딩-->
<script type="text/javascript">	

</script>
<style type="text/css">

</style>
<!-- 화면 디자인 -->
		<section class="section normalhead bgcolor ptop180">
			<div class="container">
				<div class="row">	
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="color: white;">${vo.pageName }</h2>  
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
                    
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 mb30">
					${vo.content }
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->


<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
 
</body>
</html>
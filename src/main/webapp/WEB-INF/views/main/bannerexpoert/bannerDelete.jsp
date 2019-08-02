<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../incs/top_mypage.jsp" %>
<c:import url="/mypage/sideMypage.do"/>
<style type="text/css">
</style>

<!-- 각자가 분담해서 디자인할 바디 태그 -->
<div class="content-wrap">
	<div class="main">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>
								배너 <span>관리화면</span>
							</h1>
						</div>
					</div>
				</div>
				<!-- /# column -->
				<div class="col-lg-4 p-l-0 title-margin-left">
					<div class="page-header">
						<div class="page-title">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
								<li class="breadcrumb-item active">Table-Export</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /# column -->
			</div>
			<!-- /# row -->

			<section id="main-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-title">
								<h4>배너 삭제</h4>
							</div>
							<div class="card-body">
								<div class="basic-form">
									<form name="frmWrite" method="post"
										action="<c:url value='/admin/bannerexpoert/bannerDelete.do?adsNo=${vo.adsNo }&fileName=${vo.fileName }'/>"
										enctype="multipart/form-data">

										<div>
											<span class="sp">${vo.adsNo }번 배너(을)를 삭제하시겠습니까?</span> <br>
											<br>
										</div>
										<div class="center">
											<input type="submit" value="삭제" class="btn btn-primary"
												onclick="submitContents(frmWrite)" />&nbsp;&nbsp; 
											<input type="button" value="취소" class="btn btn-primary"
												onclick="location.href='<c:url value='/admin/bannerexpoert/bannerDetail.do?adsNo=${vo.adsNo }'/>'">
										</div>
									</form>
								</div>

							</div>
						</div>
						<!-- /# card -->
					</div>
					<!-- /# column -->
				</div>
			</section>
		</div>
	</div>
</div>



<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
	
	<!-- jquery vendor -->
    <script src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/jquery.nanoscroller.min.js'/>"></script>
    <!-- nano scroller -->
    <script src="<c:url value='/assets/js/lib/preloader/pace.min.js'/>"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->

    <script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="<c:url value='/assets/js/scripts.js'/>"></script>
    <!-- scripit init-->

</body>
</html>

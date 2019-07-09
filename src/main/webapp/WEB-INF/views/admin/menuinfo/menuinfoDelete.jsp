<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp"%>
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
								카테고리 <span>관리화면</span>
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
								<h4>카테고리 삭제</h4>
							</div>
							<div class="card-body">
								<div class="basic-form">
									<form name="frmWrite" method="post"
										action="<c:url value='/admin/menuinfo/menuinfoDelete.do?productNo=${vo.productNo }'/>"
										enctype="multipart/form-data">

										<div>
											<span class="sp">${vo.productName }(을)를 삭제하시겠습니까?</span> <br>
											<br>
										</div>
										<div class="center">
											<input type="submit" value="삭제" class="btn btn-primary"
												onclick="submitContents(frmWrite)" />&nbsp;&nbsp; <input
												type="button" value="취소" class="btn btn-primary"
												onclick="location.href='<c:url value='/admin/menuinfo/menuinfoDetail.do?productNo=${vo.productNo }'/>'">
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



<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp"%>

<!-- 화면별 고유 scripit init -->


<%@include file="../inc/admin_bottom.jsp"%>

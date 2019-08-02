<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp"%>
<!-- 각자가 분담해서 디자인할 바디 태그 -->
<script type="text/javascript">
	$(document).ready(function(){
		$('.slide-one-item').owlCarousel({
		    center: false,
		    items: 1,
		    loop: true,
				stagePadding: 0,
		    margin: 0,
		    smartSpeed: 1500,
		    autoplay: true,
		    pauseOnHover: false,
		    dots: true,
		    nav: true,
		    navText: ['<span class="icon-keyboard_arrow_left">', '<span class="icon-keyboard_arrow_right">']
		  });
	});

</script>
<div class="col-lg-6" style="margin: auto;width:100%;height:500px;">
				<div class="card">
					<c:if test="${empty list }">
					<div class="owl-carousel slide-one-item">

						<div class="site-section-cover overlay img-bg-section"
							style="height:500px;">
							
							<div class="container">
								<div class="row align-items-center justify-content-center">
									<div class="col-md-12 col-lg-7 text-center">
										<h1>여러분의 광고를 등록하세요 !</h1>
										<p>ProBanner 101</p>
										<p>
											<a href="#" class="btn btn-white-outline border-w-2 btn-md"></a>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					</c:if>
					<c:if test="${!empty list }">
                    <c:forEach var="vo" items="${list }">
					<div class="owl-carousel slide-one-item">

						<div class="site-section-cover overlay img-bg-section"
							style="background-image: url(<c:url value='/resources/images/${vo.fileName }'/>); height:500px;">
							
							<div class="container">
								<div class="row align-items-center justify-content-center">
									<div class="col-md-12 col-lg-7 text-center">
										<h1></h1>
										<p></p>
										<p>
											<a href="#" class="btn btn-white-outline border-w-2 btn-md"></a>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					</c:forEach>
					</c:if>
				</div>
				<!-- /# card -->

			</div>
<!-- /# column -->

<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp"%>


<%@include file="../inc/admin_bottom.jsp"%>

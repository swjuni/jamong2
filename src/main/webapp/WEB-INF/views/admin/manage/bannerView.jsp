<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<div class="col-lg-6" style="margin: auto;">
	<div class="card" >
	
		<div class="owl-carousel slide-one-item">
		
      <div class="site-section-cover overlay img-bg-section" style="background-image: url('https://www.google.co.kr/images/branding/googlelogo/2x/googlelogo_color_160x56dp.png'); " >
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center">
              <h1>이거슨 배너 이미지</h1>  
              <p>모두모두 신청하고 광고해보아요</p>
              <p><a href="#" class="btn btn-white-outline border-w-2 btn-md">요기는 태그</a></p>
            </div>
          </div>
        </div>
      </div>
      
      <div class="site-section-cover overlay img-bg-section" style="background-image: url('https://www.google.co.kr/images/branding/googlelogo/2x/googlelogo_color_160x56dp.png'); " >
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center">
              <h1>이거슨 배너 이미지</h1>  
              <p>모두모두 신청하고 광고해보아요</p>
              <p><a href="#" class="btn btn-white-outline border-w-2 btn-md">요기는 태그</a></p>
            </div>
          </div>
        </div>
      </div>
      
    </div>
    
	</div>
	<!-- /# card -->

</div>
<!-- /# column -->

<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp"%>


<%@include file="../inc/admin_bottom.jsp"%>

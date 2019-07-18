<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<!-- 각 화면별 내용 코딩-->
<script type="text/javascript">	

</script>
<style type="text/css">

      #map, #pano {
        float: left;
        height: 100%;
        width: 50%;
      }
</style>
<!-- 화면 디자인 -->

		<section class="section transheader bgcolor ptop180">
			<div class="container">
				<div class="row">	
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>Contact Us</h2>
						<p class="lead">With high quality design Make your business more competitive</p>
					</div><!-- end col -->
				</div><!-- end row -->
			</div>
		</section>
		
		<section class="section">
			<div class="container">
				<div class="row contactv2 text-center">
					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-message"></i>
							<h4>Contact us today</h4>
							<small>Phone: +82 2-532-6500</small>
							<small>Twitter: @jamong</small>
							<p><a href="mailto:service@jamong.com">service@jamong.com</a></p>
						</div><!-- end small-box -->
					</div><!-- end col -->

					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-home-marker"></i>
							<h4>Visit Our Office</h4>
							<small>서울특별시 서초구 서초4동</small>
							<small>1303-37 서초W타워 13층</small>
						</div><!-- end small-box -->
					</div><!-- end col -->

					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-user"></i>
							<h4>office hours</h4>
							<small>평일 : 오전 8:30 ~ 오후 10:30</small>
							<small>휴일 : 오전 8:30 ~ 오후 07:00</small>
							<p><a href="mailto:service@jamong.com">취업문의</a></p>
						</div><!-- end small-box -->
					</div><!-- end col -->
				</div><!-- end contactv2 -->
					
				<div class="row">
					<div class="col-md-10 col-md-offset-1 mb30">
						<div id="map" style="height: 500px;"></div>
						<div id="pano" style="height: 500px;"></div>
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->


<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script>

      function initialize() {
        var fenway = {lat: 37.5024182, lng: 127.0246212};
        var map = new google.maps.Map(document.getElementById('map'), {
          center: fenway,
          zoom: 14
        });
        var panorama = new google.maps.StreetViewPanorama(
            document.getElementById('pano'), {
              position: fenway,
              pov: {
                heading: 34,
                pitch: 10
              }
            });
        map.setStreetView(panorama);
      }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjRBiwpB7Mu8eNfvouFvZkg6vkofWas1U&callback=initialize">
    </script>
<!-- MAP & CONTACT -->
<script src="<c:url value='/resources/js/map.js'/>"></script> 
</body>
</html>
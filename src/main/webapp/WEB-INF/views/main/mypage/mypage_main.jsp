<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp" %>

		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="seo-score">
							<div class="website-screen" style="text-align: center;">
								<img src="<c:url value='/resources/images/userinfo.png'/>" alt="" class="img-thumbnail" style="width: 200px; border-radius: 50%; ">
								<h4 style="margin: 20px 0;">이름</h4>
								<a href="#" class="btn btn-primary">전문가로 전환</a>
							</div><!-- end website-screen -->

							<div class="circle-detail">
								<div class="progress">
								 	<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="width:67%">
								    	<span>100</span>
								  	</div>
								</div>
							</div><!-- end circle -->
							<hr>

							<div class="seo-details">
								<div class="panel-group" id="accordion">
									<div class="panel panel-default">
									    <div class="panel-heading">
									        <h4 class="panel-title">
									            <a data-toggle="collapse" data-parent="#accordion" href="#collapseBuy">
									            	마이페이지
									            <i class="fa fa-angle-down"></i></a>
									        </h4>
									    </div>
									    <div id="collapseBuy" class="panel-collapse collapse">
									        <div class="panel-body">
												<ul style="list-style: none; padding-top: 10px; padding-left: 30px;">
					                    			<li><a href="#">구매관리</a></li>
					                    			<li><a href="#">결제내역</a></li>
					                    			<li><a href="#">즐겨찾기</a></li>
					                    			<li><a href="#">최근 본 서비스</a></li>
					                    			<li><a href="#">메시지</a></li>
					                    			<li><a href="#">자료실</a></li>
					                    			<li><a href="#">나의정보</a></li>
					                    			<li><a href="#">알림(신고)</a></li>
					                    		</ul>
									        </div>
									    </div>
									</div>
									<div class="panel panel-default">
									    <div class="panel-heading">
									        <h4 class="panel-title">
									            <a data-toggle="collapse" data-parent="#accordion" href="#collapseSell">
									            	전문가 메뉴
									            <i class="fa fa-angle-down"></i></a>
									        </h4>
									    </div>
									    <div id="collapseSell" class="panel-collapse collapse">
									        <div class="panel-body">
												<ul style="list-style: none; padding-top: 10px; padding-left: 30px;">
					                    			<li><a href="#">나의 서비스</a></li>
					                    			<li><a href="#">판매관리</a></li>
					                    			<li><a href="#">수익관리</a></li>
					                    			<li><a href="#">배너관리</a></li>
					                    			<li><a href="#">인증(프로필)정보</a></li>
					                    			<li><a href="#">일정표</a></li>
					                    		</ul>
									        </div>
									    </div>
								    </div>
								</div>
							</div>
						</div><!-- end score -->
					</div><!-- end col -->

					<c:import url="/mypage/userInfo.do"/>
										
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>
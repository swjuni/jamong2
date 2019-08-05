<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp" %>
<c:import url="/mypage/sideMypage.do"/>

<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<style>
	.col-md-9{
	display: contents;
	}
</style>
						<div class="seo-details">
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/mypage/registExpert.do?state=expert'/>">
									<i class="flaticon-presentation"></i>
									<h4>나의 서비스</h4>
									<p>전문가 상품 목록/등록 </p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<a href="<c:url value='/mypage/orders/sellList.do'/>">
									<i class="flaticon-crown"></i>
									<h4>판매 관리</h4>
									<p>고객 주문 요청 관리</p>
									</a>
								</div>
								<!-- end service-box -->
							</div>
							<!-- end col -->
					
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/'/>">
									<i class="flaticon-responsive"></i>
									<h4>수익 관리</h4>
									<p>결제완료 내용 통계</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<a href="<c:url value='/main/bannerexpoert/bannerAdd.do'/>">
									<i class="flaticon-content"></i>
									<h4>배너 관리</h4>
									<p>사이트 광고 신청</p>
									</a>
								</div>
								<!-- end service-box -->
							</div>
							<!-- end col -->
					
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/mypage/registExpert.do?state=expert'/>">
									<i class="flaticon-message"></i>
									<h4>프로필 정보</h4>
									<p>전문가 정보 관리</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<a href="<c:url value='/mypage/mypage.do'/>">
									<i class="flaticon-presentation-1"></i>
									<h4>마이페이지</h4>
									<p>회원 기본 마이페이지</p>
									</a>
								</div>
								<!-- end service-box -->
							</div>
							
						</div>
						
						<!-- end details -->




<!--아래는 mypage 공통 사용 코드  -->
			
					</div><!-- end col -->
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
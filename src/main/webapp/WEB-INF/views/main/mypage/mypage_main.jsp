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
									<a href="<c:url value='/mypage/orders/buyList.do'/>">
									<i class="flaticon-presentation"></i>
									<h4>구매관리</h4>
									<p>구매 한 목록을 관리</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<a href="<c:url value='/mypage/payList/payList.do'/>">
									<i class="flaticon-crown"></i>
									<h4>결제 내역</h4>
									<p>상품 결제 내역을 확인</p>
									</a>
								</div>
								<!-- end service-box -->
							</div>
							<!-- end col -->
					
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/mypage/bookmark.do'/>">
									<i class="flaticon-responsive"></i>
									<h4>즐겨찾기</h4>
									<p>즐겨찾기를 한 상품을 조회</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<a href="<c:url value='/mypage/reportedExpert.do'/>">
									<i class="flaticon-content"></i>
									<h4>알림(신고)</h4>
									<p>부적절한 전문가를 신고</p>
									</a>
								</div>
								<!-- end service-box -->
							</div>
							<!-- end col -->
					
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/main/mypage/message.do'/>">
									<i class="flaticon-message"></i>
									<h4>메시지</h4>
									<p>상대 회원과 메시지를 주고 받기</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<a href="<c:url value='/main/mypage/filesExUser.do'/>">
									<i class="flaticon-presentation-1"></i>
									<h4>자료실</h4>
									<p>내 자료들을 확인하고 받기</p>
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
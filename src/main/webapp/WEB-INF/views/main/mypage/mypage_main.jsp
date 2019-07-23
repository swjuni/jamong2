<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp" %>
<%@include file="../incs/side_mypage.jsp" %>

<!-- 아래부터 mypage 각자 코딩내용 작성 -->

						<div class="seo-details">
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<i class="flaticon-presentation"></i>
									<h4>구매관리</h4>
									<p>The SEO toolset that's got it all: keyword research, link
										building, site audits.</p>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<i class="flaticon-crown"></i>
									<h4>결제 내역</h4>
									<p>We provide SEO training with professional trainers. Learn
										more about</p>
								</div>
								<!-- end service-box -->
							</div>
							<!-- end col -->
					
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/mypage/bookmark.do'/>">
									<i class="flaticon-responsive"></i>
									<h4>즐겨찾기</h4>
									<p>Monitor what people are saying about your brand</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<i class="flaticon-domain"></i>
									<h4>최근 본 서비스</h4>
									<p>We are doing the domain competition analysis service on a
										sectoral basis.</p>
								</div>
								<!-- end service-box -->
							</div>
							<!-- end col -->
					
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/main/mypage/message.do'/>">
									<i class="flaticon-message"></i>
									<h4>메시지</h4>
									<p>Manage all of your SEO with these nifty plugins and toolbars
										that help you do your.</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<i class="flaticon-presentation-1"></i>
									<h4>자료실</h4>
									<p>The SEO toolset that's got it all: keyword research, link
										building, site audits.</p>
								</div>
								<!-- end service-box -->
							</div>
							
							<div class="col-md-3 col-sm-6">
								<div class="service-box">
									<a href="<c:url value='/main/mypage/myInfo.do'/>">
									<i class="flaticon-translation-and-localization"></i>
									<h4>나의 정보</h4>
									<p>Manage all of your SEO with these nifty plugins and toolbars
										that help you do your.</p>
									</a>
								</div>
								<!-- end service-box -->
								<div class="service-box nmb">
									<i class="flaticon-content"></i>
									<h4>알림(신고)</h4>
									<p>The SEO toolset that's got it all: keyword research, link
										building, site audits.</p>
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
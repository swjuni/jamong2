<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<style type="text/css">
	.col-md-3{
		width: 290px;
    	margin-right: -40px;
	}
	
	.col-md-9{
		margin-left: 42px;
		margin-top: 5px;
	}
	
	.mb30 {
		margin-top: 12px;
	    width: 250px;
	    height: 1000px;
	}

	.col-md-5 {
		margin-top: 9px;
	    width: 665px;
	    height: 1000px;
	}
	
	.agreement{
		width: 685px;
	    height: 390px;
	    margin-left: -205px;
	    margin-top: 95px;
	}
	
	.form-group {
		margin-bottom: 35px;
	}
	
	.contact-details li{
   		margin-bottom: 42px;
   	 	border-bottom: none;
	}
	
	button{
		margin-left: 70px;
	}
	
	.service-list .col-md-4 {
	    width: 241px;
	}
	
	h4{
		font-size: 18px;
		padding: 0;
	}
	li div{
		margin-left:16px;
		width: 100%;
	}
	
	iframe{
		margin-left: 16px;
	}
	
	.section{
		padding-bottom:40rem;
	}
</style>
<%@include file="../incs/side_mypage.jsp"%>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<div class="row service-list text-center">
					<div class="col-md-4 col-sm-12 col-xs-12 first">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-competition"></i>
							<div class="service-details">
								<h4><a 
								<c:if test="${param.state=='expert' }">
									style="color:#f47664;"
								</c:if>
								 href="<c:url value='/registExpert/registExpert.do?state=expert&userNo=${sessionScope.userNo }'/>">전문가 등록</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-content"></i>
							<div class="service-details">
								<h4><a style="cursor: inherit;"
								<c:if test="${param.state=='profile' }">
									style="color:#f47664;"
								</c:if>
								>프로필 작성</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12 last">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-html"></i>
							<div class="service-details">
								<h4><a href="<c:url value='/registExpert/service.do?expertNo=${param.expertNo }'/>">서비스 등록</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->
				</div>
				
					<!-- end contact details -->
				<div class="col-md-5">
				<iframe src="<c:url value='/registExpert/profile.do?userNo=${sessionScope.userNo }'/>" id="the_iframe" name="WrittenPublic" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; height: 100%;"></iframe>
				</div>
					<!--아래는 mypage 공통 사용 코드  -->
			</div>
<!-- end col -->
		</div>
<!-- end row -->
	</div>
<!-- end container -->
</section>
<!-- end section -->

<%@include file="../incs/bottom_main.jsp"%>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/parallax.js'/>"></script>
<script src="<c:url value='/resources/js/animate.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>
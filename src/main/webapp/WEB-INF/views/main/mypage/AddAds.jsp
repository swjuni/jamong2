<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../incs/top_mypage.jsp" %>
<%@include file="../incs/side_mypage.jsp" %>


<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<link href="<c:url value='/assets/css/style2.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/css/lib/themify-icons.css'/>" rel="stylesheet">
<style>
.header{
	margin-left: 0px;
}
</style>
		
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
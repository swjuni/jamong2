<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp" %>
<%@include file="../incs/side_mypage.jsp" %>

<!-- 아래부터 mypage 각자 코딩내용 작성 -->
			<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
					<div class="col-md-6 col-sm-6">
						<div class="ebook-details copybox row">
							<div class="col-md-4">
								<img src="/jamong/resources/upload/copy_01.png" alt="" class="img-responsive">
							</div>
							<div class="col-md-8">
								<div class="book-details">
									<small>대표카테고리 1개 나중에 추가</small>
									<h3>${map['ID'] }</h3>
									<p>${map['INTRODUCTION'] }</p>
									<a href="#" class="btn btn-transparent">View All</a>
									<input type="checkbox" name="chkDel" id="chkDel" style="float: right;">
								</div><!-- end details -->
							</div><!-- end col -->
						</div><!-- end ebook-details -->
					</div><!-- end col -->
				</c:forEach>
			</c:if>
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
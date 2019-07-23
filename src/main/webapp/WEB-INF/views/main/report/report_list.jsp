<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
	function pageFunc(curPage){
		 document.frmSearch.currentPage.value = curPage;
		 document.frmSearch.submit();
	}
</script>
<style type="text/css">
	#underTitle:hover {
		text-decoration: underline !important;
	}
</style>
<%@include file="../incs/side_mypage.jsp"%>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
				<div style="font-size:30px;  font-weight:bolder; margin-bottom: 30px;">상품 신고 목록</div>
				<div style="clear: both;"></div>
	
				<div class="content col-md-10">
					<c:if test="${empty list }">
						<div class="blog-box clearfix row">
							<div class="blog-desc col-md-12">
								<h3><a href="#" title="">데이터가 존재하지 않습니다.</a></h3>
							</div><!-- end blog-desc -->
						</div><!-- end blogbox -->
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="vo" items="${list }">
							<div class="blog-box clearfix row">
								<div class="media-box col-md-3">
									<a href="<c:url value='#'/>" title=""><img src="/jamong/assets/images/bookingSystem/2.png" alt=""
									 	class="img-responsive img-thumbnail"></a>
								</div><!-- end media-box -->
								<div class="blog-desc col-md-9">
									<div style="float: right; bottom: 10px;"><fmt:formatDate value="${vo.reportDate }" pattern="yyyy-MM-dd"/></div>
									<h3><a href="<c:url value='#'/>" title="" id="underTitle">${vo.id }</a></h3>
									<p>${fn:substring(vo.reportDesc,0, 60)}...</p>
									<a class="readmore" href="<c:url value='#'/>">Read more</a>
									<c:if test="${empty vo.delflag }">
										<div style="font-size: 0.9em; color: blue;">신고 접수 처리 중</div>
									</c:if> 
								</div><!-- end blog-desc -->
							</div><!-- end blogbox -->
						</c:forEach> 
					</c:if>
	
					<div class="pagination-wrapper row text-center">
					 	<ul class="pagination col-md-12">
							<!-- 이전블럭으로 이동하기 -->
							<c:if test="${pagingInfo.firstPage>1 }">
								<li><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">&lt;</a></li>
							</c:if>
							
							<!-- 페이지 번호 추가 -->		
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
	
							<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
								<c:if test="${i==pagingInfo.currentPage }">
									<li class="active"><a href="#" style="color:red;" >${i}</a></li>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">
									<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
								</c:if>
							</c:forEach>
							<!--  페이지 번호 끝 -->
							
							<!-- 다음 블럭으로 이동하기 -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
								<li><a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">&gt;</a></li>
							</c:if>
						</ul>
					</div><!-- ne dpagi -->
				</div><!-- end content -->

				<!--아래는 mypage 공통 사용 코드  -->
			</div><!-- end col -->
		</div><!-- end row -->
	</div><!-- end container -->
</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp"%>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/parallax.js'/>"></script>
<script src="<c:url value='/resources/js/animate.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>
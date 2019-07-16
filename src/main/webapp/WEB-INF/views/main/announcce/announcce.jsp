<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<!-- 각 화면별 내용 코딩-->
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

		<section class="section transheader bgcolor ptop180">
		<!-- <section class="section transheader parallax" data-stellar-background-ratio="0.5" style="background-image:url('/jamong/resources/upload/bg_01.jpg');"> -->
			<div class="container">
				<div class="row">	
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>공 지 사 항</h2>
						<p class="lead">We publish latest Jamong news, tips and tricks for our dear customers.</p>
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<section class="section">
			<div class="container">
				<div class="row">
					<div class="content col-md-8">
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
									<div class="media-box col-md-4">
										<a href="<c:url value='/main/announcce/countUpdate.do?announceNo=${vo.announceNo }'/>" title=""><img src="/jamong/upload/announcce/${vo.fileName }" alt="" class="img-responsive img-thumbnail"></a>
									</div><!-- end media-box -->
									<div class="blog-desc col-md-8">
										<h3><a href="<c:url value='/main/announcce/countUpdate.do?announceNo=${vo.announceNo }'/>" title="" id="underTitle">${vo.title }</a>
											<c:if test="${vo.newImgTerm<24 }">
												<img src="<c:url value='/resources/images/new.gif'/>" alt="new 이미지">
											</c:if>
										</h3>
										<p>${fn:substring(vo.content,0, 60)}...</p>
											<%-- <p><c:out value='${fn:substring(vo.content.replaceAll("\\\<.*?\\\>"," "),0, 70)}'
											 escapeXml="false"/>...</p> --%>
										<a class="readmore" href="<c:url value='/main/announcce/countUpdate.do?announceNo=${vo.announceNo }'/>">Read more</a>
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

                    <div class="sidebar col-md-4 col-sm-4">
                    	<div class="widget clearfix">
                    		<h4 class="widget-title">공지사항 검색</h4>
                    		<div class="newsletter-widget">
                    			<p>내용에서 검색할 단어를 입력하세요</p>
		                        <form class="form-inline" role="search" name="frmSearch" method="post" action="<c:url value='/main/announcce/announcceServiceList.do'/>">
		                            <div class="form-1">
								   		<!-- 현재 페이지 hidden에 넣기 -->
								   		<input type="hidden" name="currentPage" value="1">
								   		<input type="hidden" name="searchCondition" value="content">
		                              	<input type="text" class="form-control" placeholder="검색어 입력" name="searchKeyword" value="${param.searchKeyword}">
										<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
		                            </div>
								</form>
							    
								<c:if test="${!empty param.searchKeyword}">
									<p>
										검색어 : ${param.searchKeyword }, ${pagingInfo.totalRecord}건 검색되었습니다.
									</p>
								</c:if>
                    		</div><!-- end newsletter -->
                    	</div><!-- end widget -->

                    	<div class="widget clearfix">
                    		<h4 class="widget-title">ADVERTISING</h4>
                    		<div class="category-widget">
                    			<img src="/jamong/resources/images/banner.gif" alt="" class="img-responsive img-thumbnail">
                    		</div><!-- end category -->
                    	</div><!-- end widget -->

                    </div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->

</body>
</html>
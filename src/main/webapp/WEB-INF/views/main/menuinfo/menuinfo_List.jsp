<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<!-- 각 화면별 내용 코딩-->
<script type="text/javascript">
</script>
<style type="text/css">
.section{
	padding-top: 10px;
}
.hrLine{
	border-top: 2px solid orange;
}
.hrSubLine{
	margin: 10px 0;
}
.catLine{
	margin-left: 20px;
}
.forFont{
	font-size: 0.9em;
	font-weight: bold;
}
.col-lg-3, .col-md-4, .col-sm-4, .col-xs-6{
    margin: 10px 0;
    padding: 0;
}
.case-boxUser{
    height: 310px;
    width: 220px;
    padding: 0;
    color: black;
}

.lightcasestudiesUser .case-boxUser{
    background-color: #ffffff;
    border-radius: 8px;
    border: 1px solid #ededed;
    position: relative;
}
.lightcasestudiesUser .case-boxUser h4 {
    color: #232323;
}

.lightcasestudiesUser .case-boxUser small {
    color: #787878;
}
.case-info { 
    position: relative;
    padding: 0 10px;
}
.case-boxUser:hover{
	background: -webkit-linear-gradient(45deg, #3ac5c8 1%, #0b509e 100%);
}
</style>
  
		<section class="section">
			<div class="container">
				<div class="row lightcasestudiesUser">
					<div class="col-md-2">
						<h3>카테고리명</h3> 
						<hr class="hrLine">
						<div class="catLine">
							<p><b>카테고리</b></p>
							<hr class="hrSubLine">
							<div class="forFont">카테고리 for위치</div>
						</div>
						<hr class="hrLine">
						<div class="catLine">
							<p><b>필터</b></p>
							<hr class="hrSubLine">
							<div class="forFont">필터 for위치</div>
						</div>
						<hr class="hrLine">
						<div class="catLine">
							<p><b>전문가 등급</b></p>
							<hr class="hrSubLine">
							<div class="forFont">등급 for위치</div>
						</div>
						<br><br>
					</div>
					
					
					
					
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-12">
								<p>상단 카테고리 디렉토리 구조 보여주는 곳</p>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6">
								<div class="case-boxUser">
									<img src="/jamong/resources/upload/case_04.jpg" alt="" class="img-responsive" style="width: 100%; height: 45%;">
									<div class="case-info clearfix" style="height:40% ;border-bottom: 1px solid #ededed;">
										<div>
											<h4>판매자 ID</h4>
											<span>상품명</span><br>
											<div style="float: right; bottom: 5px;">가격 1,000,000원</div> 
										</div> 
									</div><!-- end case-info -->
									<div class="case-info clearfix">
										<div>평점 하트 위치</div> 
									</div>
								</div><!-- end case-box -->
							</div><!-- end col -->
							<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6">
								<div class="case-boxUser">
									<img src="/jamong/resources/upload/case_04.jpg" alt="" class="img-responsive" style="width: 100%; height: 45%;">
									<div class="case-info clearfix" style="height:40% ;border-bottom: 1px solid #ededed;">
										<div>
											<h4>판매자 ID</h4>
											<span>상품명</span><br>
											<div style="float: right; bottom: 5px;">가격 1,000,000원</div> 
										</div> 
									</div><!-- end case-info -->
									<div class="case-info clearfix">
										<div>평점 하트 위치</div> 
									</div>
								</div><!-- end case-box -->
							</div><!-- end col -->
							<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6">
								<div class="case-boxUser">
									<img src="/jamong/resources/upload/case_04.jpg" alt="" class="img-responsive" style="width: 100%; height: 45%;">
									<div class="case-info clearfix" style="height:40% ;border-bottom: 1px solid #ededed;">
										<div>
											<h4>판매자 ID</h4>
											<span>상품명</span><br>
											<div style="float: right; bottom: 5px;">가격 1,000,000원</div> 
										</div> 
									</div><!-- end case-info -->
									<div class="case-info clearfix">
										<div>평점 하트 위치</div> 
									</div>
								</div><!-- end case-box -->
							</div><!-- end col -->
							<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6">
								<div class="case-boxUser">
									<img src="/jamong/resources/upload/case_04.jpg" alt="" class="img-responsive" style="width: 100%; height: 45%;">
									<div class="case-info clearfix" style="height:40% ;border-bottom: 1px solid #ededed;">
										<div>
											<h4>판매자 ID</h4>
											<span>상품명</span><br>
											<div style="float: right; bottom: 5px;">가격 1,000,000원</div> 
										</div> 
									</div><!-- end case-info -->
									<div class="case-info clearfix">
										<div>평점 하트 위치</div> 
									</div>
								</div><!-- end case-box -->
							</div><!-- end col -->
						</div>
						
						
						<!-- 페이징 처리 -->
						<div class="row">
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
							</div>
						</div><!-- end 페이징 처리 -->
						
					</div><!-- end col-md-10 -->
				</div><!-- end row lightcasestudies -->
			</div><!-- end container -->
		</section><!-- end section -->



<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->

</body>
</html>
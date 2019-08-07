<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<!-- 각 화면별 내용 코딩-->
<script type="text/javascript">
	function pageFunc(curPage){
		 document.frmSearch.currentPage.value = curPage;
		 document.frmSearch.submit();
	}
</script>
<script type="text/javascript">/* 배너광고 */
	$(document).ready(function(){
		$('.slide-one-item').owlCarousel({
		    center: false,
		    items: 1,
		    loop: true,
				stagePadding: 0,
		    margin: 0,
		    smartSpeed: 1500,
		    autoplay: true,
		    pauseOnHover: false,
		    dots: true,
		    nav: true,
		    navText: ['<span class="icon-keyboard_arrow_left">', '<span class="icon-keyboard_arrow_right">']
		  });
	});

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
    transition: all .1s ease-in-out;
}
.case-boxUser a{
    color: black;
}
.case-boxUser a:hover{
    color: black;
}
.forFont a{
	color: black;
}
.forFont a:hover{
	color: #337ab7;
}
.case-boxUser:hover{
    -ms-transform: scale(1.05, 1.05);
    /* IE 9 */
    -webkit-transform: scale(1.05, 1.05);
    /* Safari */
    transform: scale(1.05, 1.05);
    cursor: pointer;
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
 
.row{
    margin-right: 0px;
    margin-left: 0px;
}
.heartDiv{
    line-height: 31px;
    text-align: right;
    font-size: 0.9em;
}
.moneyDiv{
    position: absolute;
    bottom: 5px;
    right: 5px;
	font-size: 20px;
}
.gig-profile{
	position: absolute;
	right: 10px;
	top: 110px;
	display: block;
}
.gig-profile .gig-user-profile{
	width: 60px;
	height: 60px;
	padding: 1px;
	border: solid #E6E6E6 1px;
	background-color: #fff;
	position: relative;
	z-index: 1;
	border-radius: 500px !important;
}
.owl-stage-outer{
	height:150px;
}
</style>
  
		<section class="section">
			<div class="container">
				<div class="row lightcasestudiesUser">
					<c:import url="/main/menuinfo/menuListCategoryM.do?categoryNoL=
					${menuInfoSearchVO.categoryNoL }&categoryNoM=${menuInfoSearchVO.categoryNoM }&expertNo=${menuInfoSearchVO.expertNo }"/>
					
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-12">
								<p style="font-size: 0.9em;"><b>HOME &nbsp; > &nbsp;${epName }${cNameL } &nbsp; > &nbsp; ${cNameM }</b></p>
							</div>
						</div>
				
				<!-- 배너광고 -->
				<div class="col-lg-6" style="margin: auto;width:100%;height:150px;">
				<div class="card">
					<div class="owl-carousel slide-one-item">
					<c:if test="${empty adlist }">

						<div class="site-section-cover overlay img-bg-section"
							style="height:500px;">
							
							<div class="container">
								<div class="row align-items-center justify-content-center">
									<div class="col-md-12 col-lg-7 text-center">
										<h1>여러분의 광고를 등록하세요 !</h1>
										<p>ProBanner 101</p>
										<p>
											<a href="#" class="btn btn-white-outline border-w-2 btn-md"></a>
										</p>
									</div>
								</div>
							</div>
						</div>

					</c:if>
					<c:if test="${!empty adlist }">
                    <c:forEach var="vo" items="${adlist }">
					

						<div class="site-section-cover overlay img-bg-section"
							style="background-image: url(<c:url value='/upload/banner/${vo.fileName }'/>); height:500px;">
							
							<div class="container">
								<div class="row align-items-center justify-content-center">
									<div class="col-md-12 col-lg-7 text-center" style="height: 150px">
										<h1></h1>
										<p></p>
										<p>
											<a href="#" class="btn btn-white-outline border-w-2 btn-md"></a>
										</p>
									</div>
								</div>
							</div>
						</div>

					
					</c:forEach>
					</c:if>
					</div>
				</div>
				<!-- /# card -->

			</div>
	<!-- /# 배너광고 끝 -->
						<div class="row">
							<c:if test="${!empty list }">
								<c:forEach var="vo" items="${list }">
									<c:if test="${vo.activation=='Y' }">
										<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6">
											<div class="case-boxUser" >
												<a href="<c:url value='/main/menuinfo/menuinfo_Detail.do?productNo=${vo.productNo }'/>" onclick="addCookie('${vo.productNo}')">
													<img src="<c:url value='/upload/image/${vo.fileName }'/>" 
														alt="" class="img-responsive" style="width: 100%; height: 45%;">
													<div class="gig-profile">
														<img class="gig-user-profile" src="<c:url value='/upload/expert/${vo.expertFileName }'/>"
															onerror="this.onerror=null;this.src='/jamong/upload/expert/2.png'">
													</div>
													<div class="case-info clearfix" style="height:45% ;border-bottom: 1px solid #ededed;">
														<div>
															<h4>${vo.id }</h4>
															<span>${vo.productName }</span><br>
															<div class="moneyDiv"><b><fmt:formatNumber value="${vo.packPrice }" pattern="#,###"/></b>원</div> 
														</div>
													</div><!-- end case-info -->
													<div class="case-info clearfix  heartDiv">
														<div class="progress">
															<div class="progress-bar progress-bar-striped active" 
																role="progressbar" aria-valuenow="${vo.evalScore }" aria-valuemin="0" aria-valuemax="100"
																style="width:${vo.evalScore }%;">
															</div>
														</div>
													</div>
												</a>
											</div><!-- end case-box -->
										</div><!-- end col -->
									</c:if>
								</c:forEach>
							</c:if>
						</div>
						
						
						<!-- 페이징 처리 -->
						<form class="form-inline" role="search" name="frmSearch" method="post" action="<c:url value='/main/menuinfo/menuinfo_List.do'/>">
                            <div class="form-1">
						   		<!-- 현재 페이지 hidden에 넣기 -->
						   		<input type="hidden" name="currentPage" value="1">
						   		<input type="hidden" name="searchCondition" value="product_name">
						   		<input type="hidden" name="categoryNoL" value="${menuInfoSearchVO.categoryNoL }">
						   		<input type="hidden" name="categoryNoM" value="${menuInfoSearchVO.categoryNoM }">
						   		<input type="hidden" name="expertNo" value="${menuInfoSearchVO.expertNo }">
                            </div>
						</form>
						
						<div class="row">
							<div class="content">
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
												<li class="active"><a href="#" style="color:seashell;" >${i}</a></li>
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
							</div><!-- end 페이징 처리 -->
						</div>
					</div><!-- end col-md-10 -->
				</div><!-- end row lightcasestudies -->
			</div><!-- end container -->
		</section><!-- end section -->



<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/addCookie.js'/>"></script>
</body>
</html>
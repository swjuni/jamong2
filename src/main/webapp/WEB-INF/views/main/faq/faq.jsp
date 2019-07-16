<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<!-- 각 화면별 내용 코딩-->
<script type="text/javascript">	

</script>
<style type="text/css">
	.linkFaq:hover{
	width:103%;
	cursor: pointer;
	opacity: 0.6; 
	}
	.col-md-4{
		padding-top: 30px;
	}
</style>
<!-- 화면 디자인 -->
		<section class="section transheader bgcolor ptop180">
			<div class="container">
				<div class="row">	
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="color: white;">FAQS</h2>  
						<p class="lead" style="color: white;">To answer all of your questions, read frequently asked questions.</p>
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
                    
		<section class="section">
			<div class="container">
				<div class="row contactv2 text-center">
					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-chat linkFaq" onclick="location.href='<c:url value='/main/faq/faqServiceList.do?faqCateNo=${catList[0].faqCateNo }'/>'"></i>
							<h4>${catList[0].faqName }</h4>
						</div><!-- end small-box -->
					</div><!-- end col -->

					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-responsive linkFaq" onclick="location.href='<c:url value='/main/faq/faqServiceList.do?faqCateNo=${catList[1].faqCateNo }'/>'"></i>
							<h4>${catList[1].faqName }</h4>
						</div><!-- end small-box -->
					</div><!-- end col --> 
 
					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-user linkFaq" onclick="location.href='<c:url value='/main/faq/faqServiceList.do?faqCateNo=${catList[2].faqCateNo }'/>'"></i>
							<h4>${catList[2].faqName }</h4>
						</div><!-- end small-box -->
					</div><!-- end col -->
				</div><!-- end contactv2 -->
				<div class="row contactv2 text-center">
					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-handshake linkFaq" onclick="location.href='<c:url value='/main/faq/faqServiceList.do?faqCateNo=${catList[3].faqCateNo }'/>'"></i>
							<h4>${catList[3].faqName }</h4>
						</div><!-- end small-box -->
					</div><!-- end col -->

					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-crown linkFaq" onclick="location.href='<c:url value='/main/faq/faqServiceList.do?faqCateNo=${catList[4].faqCateNo }'/>'"></i>
							<h4>${catList[4].faqName }</h4>
						</div><!-- end small-box -->
					</div><!-- end col -->

					<div class="col-md-4">
						<div class="small-box">
							<i class="flaticon-presentation-1 linkFaq" onclick="location.href='<c:url value='/main/faq/faqServiceList.do?faqCateNo=${catList[5].faqCateNo }'/>'"></i>
							<h4>${catList[5].faqName }</h4>
						</div><!-- end small-box -->
					</div><!-- end col -->
				</div><!-- end contactv2 -->

				<div class="row">
					<div class="col-md-10 col-md-offset-1 mb30">
						<div class="faqs-template">
						    <div class="panel-group" id="accordion">
				
						    	<!-- 반복문 시작 -->
						    	<c:if test="${empty cList }">
						    		<div class="panel panel-default">
									    <div class="panel-heading">
									        <h4 class="panel-title">
									            <a data-toggle="collapse" data-parent="#accordion" href="#collapseNon">
									            	해당 FAQ의 내용이 없습니다.
									            <i class="fa fa-angle-down"></i></a>
									        </h4>
									    </div>
									    <div id="collapseNon" class="panel-collapse collapse">
									        <div class="panel-body">
									            	내용이 없습니다.
									        </div>
									    </div>
									</div>
						    	</c:if>
								<c:if test="${!empty cList }">
									<c:set var="i" value="0"/>
									<c:forEach var="vo" items="${cList }">
										<div class="panel panel-default">
										    <div class="panel-heading">
										        <h4 class="panel-title">
										            <a data-toggle="collapse" data-parent="#accordion" href="#collapse${i }">
										            ${vo.faqTitle }
										            <i class="fa fa-angle-down"></i></a>
										        </h4>
										    </div>
										    <div id="collapse${i }" class="panel-collapse collapse">
										        <div class="panel-body">
										            ${vo.faqContent }
										        </div>
										    </div>
										</div>
										<c:set var="i" value="${i+1}"/>
									</c:forEach>
								</c:if>
						    	<!-- 반복문 끝 -->
						    </div>
						</div><!-- end faqs-template -->
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->


<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
 
</body>
</html>
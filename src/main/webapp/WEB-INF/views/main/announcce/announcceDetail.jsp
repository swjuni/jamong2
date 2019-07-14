<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<script type="text/javascript">	

</script>
<style type="text/css">
	#hoverList:hover{
	color: blue;
	text-decoration: underline !important; 
	} 
</style> 
		<section class="section normalhead lb bgcolor ptop180">
			<div class="container">
				<div class="row">	
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 class="lead" style="color: white;">${vo.title }</h2>
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<section class="section">
			<div class="container">
				<div class="row">
                    <div class="sidebar col-md-4 col-sm-4">
                    	<div class="widget clearfix">
                    		<div class="widget-title">공지사항
                    			<div class="widget-title" style="float: right; font-size: 0.9em; color: silver;">
	                    			<a id="hoverList" href="<c:url value="/main/announcce/announcceServiceList.do"/>">
	                    			+ LIST
	                    			</a>  
                    			</div>
                    		</div>
                    		<div class="category-widget">
                    			<ul>
                    				<c:import url="/main/announcce/annServiceDetailList.do"/>
                    			</ul>
		                    	<hr>
		                    	<div>
		                    		<c:if test="${vo.preTitle!='처음 글'}" >
										<button type="button" class="btn btn-primary" style="margin-left: 10px;"
											onclick="location.href='<c:url value='/main/announcce/countUpdate.do?announceNo=${vo.preNo }'/>'">이전 글</button>
									</c:if>
									<c:if test="${vo.nextTitle!='마지막 글'}" >
										<button type="button" class="btn btn-primary" style="float: right; margin-right: 10px;"
											onclick="location.href='<c:url value='/main/announcce/countUpdate.do?announceNo=${vo.nextNo }'/>'">다음 글</button>
									</c:if>   
		                    	</div>
                    		</div><!-- end category -->
                    	</div><!-- end widget -->
                    </div><!-- end col -->
                    
					<div class="content col-md-8 blog-alt">
						<div class="blog-box clearfix">
							<div class="media-box">
								<img src="/jamong/upload/announcce/${vo.fileName }" style="width: 100%;" alt="" class="img-responsive img-thumbnail">
							</div><!-- end media-box -->
							<div class="blog-single">
								${vo.content }
							</div><!-- end blog-desc -->
						</div><!-- end blogbox -->
                         
					</div><!-- end content -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp" %>
	<!-- jQuery Files -->

</body>
</html>
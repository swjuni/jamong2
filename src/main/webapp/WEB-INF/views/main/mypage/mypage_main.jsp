<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp" %>

		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="seo-score">
							<div class="website-screen">
								<img src="<c:url value='/resources/upload/seo_screen.png'/>" alt="" class="img-responsive">
							</div><!-- end website-screen -->

							<div class="circle-detail">
								<div class="progress">
								 	<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="width:67%">
								    	<span>점수</span>
								  	</div>
								</div>
							</div><!-- end circle -->

							<div class="seo-details">
								<table class="table">
									<tbody>
										<tr class="row">
											<td class="first-col col-md-4 good">Good</td>
											<td class="col-md-8">12/24</td>
										</tr>
										<tr class="row">
											<td class="first-col col-md-4 bad">Bad</td>
											<td class="col-md-8">3/24</td>
										</tr>
									</tbody>
								</table>
								<a href="#" class="btn btn-primary btn-block btn-lg">전문가로 전환</a>
							</div>
						</div><!-- end score -->
					</div><!-- end col -->

					<div class="col-md-9">
						<div class="seo-details">
						  <table class="table">
						    <thead>
						      <tr class="row">
						        <th class="col-md-4"><i class="fa fa-search"></i> SEO Analysis</th>
						        <th class="col-md-8">Site Details</th>
						      </tr>
						    </thead>
						    <tbody>
							<tr class="row">
								<td class="first-col col-md-4 good">HTML Version</td>
								<td class="col-md-8">Perfect! You are using the HTML5 version</td>
							</tr>
						   	<tr class="row">
								<td class="first-col col-md-4 good">Character encoding</td>
								<td class="col-md-8">Perfect! Your character encoding supports all languages</td>
							</tr>
						   	<tr class="row">
								<td class="first-col col-md-4 good">Site Title</td>
								<td class="col-md-8">Fantastic! Title tag is fully compatible with SEO</td>
							</tr>
						   	<tr class="row">
								<td class="first-col col-md-4 good">Site Description</td>
								<td class="col-md-8">Fantastic! Site description is fully compatible with SEO</td>
							</tr>
						   	<tr class="row">
								<td class="first-col col-md-4 good">Canonical</td>
								<td class="col-md-8">Perfect! The "Canonical" tags on your site are mukvut and url is structured correctly</td>
							</tr>
						    </tbody>
						  </table>
						</div><!-- end details -->
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
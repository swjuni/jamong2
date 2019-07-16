<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setStatus(HttpServletResponse.SC_OK);
	/* 현재 페이지가 정상적으로 응답되는 페이지임을 지정하는 코드,
	이 코드가 생략되면 웹 브라우저는 자체적으로 제공하는 화면을 표시함 */
%>
<%@include file="../incs/top_main.jsp" %>

		<section class="section">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-12 notfound">
						<h2>404</h2>
						<p class="lead">Sorry we could not reach the page you were looking for. <br>Content has been deleted or modified.</p>
						<form class="calculateform">
						    <div class="item-box">
						        <div class="item-top form-inline">
						            <div class="form-group">
						                <div class="input-group2">
						                    <span class="input-addon">
												<i class="fa fa-search"></i>
											</span>
						                    <input type="url" class="form-control" id="urladres" name="url" placeholder="What you are looking?">
						                </div>
						            </div>
						            <input type="submit" name="send" value="Search" class="btn btn-default" />
						        </div>
						    </div>
						</form>
					</div><!-- end notfound -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

	
<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->

</body>
</html>
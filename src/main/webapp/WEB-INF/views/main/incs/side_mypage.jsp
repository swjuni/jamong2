<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="seo-score">
							<div class="website-screen" style="text-align: center;">
								<img src="<c:url value='/resources/images/userinfo.png'/>" alt="" class="img-thumbnail" style="width: 200px; border-radius: 50%; ">
								<h4 style="margin: 20px 0;">${userName}</h4>
								<c:if test="${empty expert }">
								<a href="<c:url value='/mypage/registExpert.do?state=expert'/>" class="btn btn-primary">
									전문가로 전환
								</a>
								</c:if>
								<c:if test="${!empty expert }">
								<a href="<c:url value='/mypage/mypage_expert.do'/>" class="btn btn-primary">
									전문가 페이지
								</a>
								</c:if>
							</div><!-- end website-screen -->

							<c:if test="${!empty eval }">
								<div class="circle-detail">
									<div class="progress">
									 	<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="${eval }" aria-valuemin="0" aria-valuemax="100" style="width:${eval }%">
									    	<span>${eval }</span>
									  	</div>
									</div>
								</div><!-- end circle -->
						  	</c:if>
							<hr>

							<div class="seo-details">
								<div class="panel-group" id="accordion">
									<c:if test="${!empty expert }">
										<div class="panel panel-default">
										    <div class="panel-heading">
										        <h4 class="panel-title">
										            <a data-toggle="collapse" data-parent="#accordion" href="#collapseSell">
										            	전문가 메뉴
										            <i class="fa fa-angle-down"></i></a>
										        </h4>
										    </div>
										    <div id="collapseSell" class="panel-collapse collapse">
										        <div class="panel-body">
													<ul style="list-style: none; padding-top: 10px; padding-left: 30px;">
						                    			<li><a href="<c:url value='/mypage/expert/menuList.do'/>">나의 서비스</a></li>
						                    			<li><a href="#">수익관리</a></li>
						                    			<li><a href="<c:url value='/mypage/registExpert.do?state=expert'/>">프로필 정보</a></li>
						                    			<li><a href="<c:url value='/mypage/orders/sellList.do'/>">판매관리</a></li>
						                    			<li><a href="<c:url value='/main/bannerexpoert/bannerList.do'/>">배너 관리</a></li>
						                    			<li><a href="<c:url value='/mypage/mypage.do'/>">마이페이지</a></li>
						                    			
						                    		</ul>
										        </div>
										    </div>
									    </div>
								    </c:if>
								    <br><br>
								    <div style="text-align: center;">
								    	<a href="<c:url value='/main/mypage/outUser.do'/>" onclick="return confirm('정말 탈퇴하시겠습니까??');">회원 탈퇴</a>
								    </div>
								</div>
							</div>
						</div><!-- end score -->
					</div><!-- end col -->
					<div class="col-md-9">
    
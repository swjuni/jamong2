<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="seo-score">
							<div class="website-screen" style="text-align: center;">
								<img src="<c:url value='/resources/images/userinfo.png'/>" alt="" class="img-thumbnail" style="width: 200px; border-radius: 50%; ">
								<h4 style="margin: 20px 0;">${userName}</h4>
								<a href="<c:url value='/mypage/registExpert.do?state=expert'/>" class="btn btn-primary">
								<c:if test="${empty expert }">
									전문가로 전환
								</c:if>
								<c:if test="${!empty expert }">
									프로필 수정/서비스 등록
								</c:if>
								</a>
							</div><!-- end website-screen -->

							<div class="circle-detail">
								<div class="progress">
								 	<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="width:67%">
								    	<span>100</span>
								  	</div>
								</div>
							</div><!-- end circle -->
							<hr>

							<div class="seo-details">
								<div class="panel-group" id="accordion">
									<div class="panel panel-default">
									    <div class="panel-heading">
									        <h4 class="panel-title">
									            <a data-toggle="collapse" data-parent="#accordion" href="#collapseBuy">
									            	마이페이지
									            <i class="fa fa-angle-down"></i></a>
									        </h4>
									    </div>
									    <div id="collapseBuy" class="panel-collapse collapse">
									        <div class="panel-body">
												<ul style="list-style: none; padding-top: 10px; padding-left: 30px;">
					                    			<li><a href="#">구매관리</a></li>
					                    			<li><a href="#">결제내역</a></li>
					                    			<li><a href="<c:url value='/mypage/bookmark.do'/>">즐겨찾기</a></li>
					                    			<li><a href="#">최근 본 서비스</a></li>
					                    			<li><a href="#">메시지</a></li>
					                    			<li><a href="#">자료실</a></li>
					                    			<li><a href="#">나의정보</a></li>
					                    			<li><a href="#">알림(신고)</a></li>
					                    		</ul>
									        </div>
									    </div>
									</div>
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
					                    			<li><a href="#">나의 서비스</a></li>
					                    			<li><a href="#">판매관리</a></li>
					                    			<li><a href="#">수익관리</a></li>
					                    			<li><a href="#">배너관리</a></li>
					                    			<li><a href="#">인증(프로필)정보</a></li>
					                    			<li><a href="#">일정표</a></li>
					                    		</ul>
									        </div>
									    </div>
								    </div>
								    <div>
								    	<a href="<c:url value='/main/mypage/outUser.do'/>" onclick="return confirm('정말 탈퇴하시겠습니까??');">회원 탈퇴</a>
								    </div>
								</div>
							</div>
						</div><!-- end score -->
					</div><!-- end col -->
					<div class="col-md-9" style="display: contents;">
    
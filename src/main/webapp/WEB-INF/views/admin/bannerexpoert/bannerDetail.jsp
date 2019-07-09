<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
<style type="text/css">

</style>

<!-- 각자가 분담해서 디자인할 바디 태그 -->
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>전문가 배너 <span>관리화면</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Table-Export</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <h4>전문가 배너  상세보기</h4>
                                </div>
                                <div class="card-body">
									<div class="user-profile">
                    					<div class="row">
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">배너명 가져오기</div>
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">카테고리(대)> 카테고리(중) 가져오기</div>
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">상품명 가져오기</div>
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">전문가 닉네임 가져오기</div>
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">광고기간 가져오기</div>
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">배너 서비스 시작일 ~ 배너서비스 종료일 가져오기</div>
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">승인여부 가져오기</div>
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">활성화 상태 가져오기</div>
                    							<!-- 정지를 누르면 활성화 중지 -->
                    						</div>
                    						<div class="col-lg-12">
                    							<div class="user-profile-name">금액 가져오기</div>
                    							<div class="user-profile-name">전문가 마일리지 가져오기</div>
                    							<div class="user-profile-name">총 금액 가져오기</div>
                    						</div>
                    						<div class="user-photo m-b-30">
			                         				<img class="img-fluid" src="<c:url value='/assets/images/user-profile.jpg'/>" alt=""/>
											</div>
								 			<span>file_name 가져오기</span>
                   						</div>
               						</div>
							        
									<!-- <button class="btn btn-primary" type="submit">등록</button> -->
									<div class="text-center">
							            <input type = "button" value="활성화" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/bannerexpoert/bannerDetail.do'/>'">&nbsp;&nbsp;
							            <input type = "button" value="비활성화" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/bannerexpoert/bannerDetail.do'/>'">&nbsp;&nbsp;
							            <input type = "Button" value="삭제" class="btn btn-primary"
				            			onclick="location.href='<c:url value='/admin/bannerexpoert/bannerDelete.do'/>'">&nbsp;&nbsp;
							            <input type = "Button" value="글목록" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/bannerexpoert/bannerList.do'/>'">
							        </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                </section>
            </div>
        </div>
    </div>



	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->


<%@include file="../inc/admin_bottom.jsp" %>    
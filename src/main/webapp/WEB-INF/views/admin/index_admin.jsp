<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="inc/admin_top.jsp" %>

	<!-- 각자가 분담해서 디자인할 바디 태그 -->
	<div class="content-wrap">
	    <div class="main">
	        <div class="container-fluid">
	            <div class="row">
	                <div class="col-lg-8 p-r-0 title-margin-right">
	                    <div class="page-header">
	                        <div class="page-title">
	                            <h1>Hello, <span>Welcome Jamong</span></h1>
	                        </div>
	                    </div>
	                </div>
	                <!-- /# column -->
	                <div class="col-lg-4 p-l-0 title-margin-left">
	                    <div class="page-header">
	                        <div class="page-title">
	                            <ol class="breadcrumb">
	                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
	                                <li class="breadcrumb-item active">Home</li>
	                            </ol>
	                        </div>
	                    </div>
	                </div>
	                <!-- /# column -->
	            </div>
	            <!-- /# row -->
	            <section id="main-content">
	                <div class="row">
	                    <div class="col-lg-3">
	                        <div class="card">
	                            <div class="stat-widget-one">
	                                <div class="stat-icon dib"><i class="ti-money color-success border-success"></i></div>
	                                <div class="stat-content dib">
	                                    <div class="stat-text">총 매출액</div>
	                                    <div class="stat-digit">1,012</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="card">
	                            <div class="stat-widget-one">
	                                <div class="stat-icon dib"><i class="ti-user color-primary border-primary"></i></div>
	                                <div class="stat-content dib">
	                                    <div class="stat-text">신규 회원(1달 이내)</div>
	                                    <div class="stat-digit">961</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="card">
	                            <div class="stat-widget-one">
	                                <div class="stat-icon dib"><i class="ti-layout-grid2 color-pink border-pink"></i></div>
	                                <div class="stat-content dib">
	                                    <div class="stat-text">상품 개수</div>
	                                    <div class="stat-digit">770</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                </div>
	            
	            
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="footer">
	                            <p>2018 © Admin Board. - <a href="#">jamong.com</a></p>
	                        </div>
	                    </div>
	                </div>
	            </section>
	        </div>
	    </div>
	</div>


	
	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="inc/bottom_js.jsp" %>
	<!-- 화면별 고유 scripit init -->
	

<%@include file="inc/admin_bottom.jsp" %>
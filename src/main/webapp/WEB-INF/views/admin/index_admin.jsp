<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="inc/admin_top.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
	    		url :"<c:url value='/admin/index_adminData.do'/>",
	    		type: 'post',
	    		dataType: "json",
	    		success : function(res) {
	    			$('#totalsale').text(res[0]+"원");
	    			$('#newUser').text(res[1]+"명");
	    			$('#totalMenu').text(res[2]+"개");
	    		}
	    		});	
		});
	</script>
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
	                                    <div class="stat-digit" id="totalsale"></div>
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
	                                    <div class="stat-digit" id="newUser"></div>
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
	                                    <div class="stat-digit" id="totalMenu"></div>
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
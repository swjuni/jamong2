<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
<style type="text/css">
	.dt-buttons{
		margin-bottom: 0;
	}
	.dataTables_info{
		margin-right: 50px;
	}
	.paginate_button{
		margin-left: 5px;
		margin-right: 5px;
	}
	.paginate_button.active a{
		color: red;
	}
</style>
<!-- 각자가 분담해서 디자인할 바디 태그 -->
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>안내 페이지 <span>관리화면</span></h1>
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
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
                                        <table id="bootstrap-data-table-export" class="table table-bordered table-hover"  style="margin-top: 15px;">
                                            <thead>
                                                <tr style="background-color: #C8D0FE; text-align: center;">
                                                    <th style="width: 10%">No</th>
                                                    <th style="width: 80%">페이지명</th>
                                                    <th style="width: 10%; text-align: center;">작성자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach var="vo" items="${list }">
	                                                <tr>
	                                                    <td style="text-align: right;">${vo.guideNo }</td>
	                                                    <td><a href="<c:url value='/admin/guide/guideDetail.do?guideNo=${vo.guideNo }'/>"
	                                                     	class="text-primary">${vo.pageName }</a></td>
	                                                    <td style="text-align: center;">${vo.adminNo }</td>
	                                                </tr>
												</c:forEach>
                                             		<!-- 서비스소개 구매 안내 판매 안내 회사 정보 -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                    <div class="row">
                    	<div class="col-lg-12 text-center">
                    		<button type="button" class="btn btn-primary m-b-10 m-l-5"
                    			onclick="location.href='<c:url value='/admin/guide/guideAdd.do'/>'">안내 페이지 등록</button>
                    	</div>
                    </div>
                </section>
            </div>
        </div>
    </div>
	


	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->
    <script src="<c:url value='/assets/js/lib/data-table/datatables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.dataTables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.flash.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/jszip.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/datatables-init.js'/>"></script>

<%@include file="../inc/admin_bottom.jsp" %>    
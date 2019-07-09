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
	.table{
		margin-top: 15px;
		margin-bottom: 15px;
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
                                <h1>카테고리(중) <span>관리화면</span></h1>
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
                                        <table id="bootstrap-data-table-export" class="table table-bordered table-hover">
                                            <thead>
                                                <tr style="background-color: #C8D0FE; text-align: center;">
                                                    <th>No</th>
                                                    <th>카테고리명</th>
                                                    <th>카테고리 설명(글자 수 제한)</th>
                                                    <th>이미지파일</th>
                                                    <th>카테고리(대)분류</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="map" items="${map }">
		                                                <tr>
		                                                    <td>${map['CATEGORY_NO_M'] }</td>
		                                                    <td>
		                                                    	<a href="<c:url value='/admin/categorym/categoryDetail.do?categoryNoM=${map["CATEGORY_NO_M"] }'/>" class="text-primary">
		                                                    	${map['CATEGORY_NAME'] }
		                                                    	</a>
		                                                    </td>
		                                                    <td><!-- 카테고리 설명이 긴 경우 30글자만 보여주기 -->
															<%--	<c:if test="${fn:length(${map['CATEGORY_DESC']}) >=30 }">
																		${fn:substring(${map['CATEGORY_DESC']}, 0,30)}...
																	</c:if>
																	<c:if test="${fn:length(${map['CATEGORY_DESC']}) <30 }">					
																		${map['CATEGORY_DESC'] }
																	</c:if> --%>
																${map['CATEGORY_DESC'] }
															</td>
		                                                    <td>
			                                                   <c:if test="${!empty map['IMG_NAME'] }">${map['IMG_NAME'] }</c:if>
		                                                    </td>
		                                                    <td>
		                                                    	${map['CATEGORY_NAME_L'] }
		                                                    </td>
		                                                </tr>
	                                            	</c:forEach>

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
                    			onclick="location.href='<c:url value='/admin/categorym/categoryAdd.do'/>'">카테고리(중) 등록</button>
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
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
                                <h1>전문가 배너 목록 <span>관리화면</span></h1>
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
                                                    <th>전문가 닉네임</th>
                                                    <th>카테고리 분류</th>
                                                    <th>파일명</th>
                                                    <th>신청일</th>
                                                    <th>금액</th>
                                                    <th>승인여부</th>
                                                    <th>활성화여부</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            
                                            <c:forEach var="map" items="${map }">
		                                                <tr>
		                                                    <td>${map['ADS_NO'] }</td>
		                                                    <td>
		                                                    	<a href="<c:url value='/admin/bannerexpoert/bannerDetail.do?adsNo=${map["ADS_NO"] }'/>" class="text-primary">
		                                                    		${map['ID'] }
		                                                    	</a>
		                                                    </td>
		                                                    <td>
																${map['CATEGORY_NAME_L'] } > ${map['CATEGORY_NAME'] }
															</td>
															<td>
		                                                    	${map['FILE_NAME']}
		                                                    </td>
		                                                    <td>
		                                                    	${map['REQUEST_PERIOD']}
		                                                    </td>
		                                                    <td>
		                                                    	<fmt:formatNumber value="${map['PRICE'] }" pattern="#,###" />원                                         
		                                                    </td>
		                                                    <td>
		                                                    	<c:if test="${map['APPROVE_DELFLAG'] == 'Y' }">
							                                    	승인
			                                                    </c:if>
			                                                    <c:if test="${map['APPROVE_DELFLAG'] == 'N' }">
							                                    	승인 요청중
	                                                   		 	</c:if>
	                                                   		 	<c:if test="${map['APPROVE_DELFLAG'] == 'C' }">
							                                    	승인 취소
	                                                   		 	</c:if>	
		                                                    </td>
		                                                    <td>
		                                                    	<c:if test="${map['ACTIVATION'] == 'Y' }">
							                                    	활성화
			                                                    </c:if>
			                                                    <c:if test="${map['ACTIVATION'] == 'N' }">
							                                    	비활성화
	                                                   		 	</c:if>	
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
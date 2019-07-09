<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>

<!-- 각자가 분담해서 디자인할 바디 태그 -->
    
<div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>어서오세요, <span>부관리자 페이지입니다</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">대쉬보드</a></li>
                                    <li class="breadcrumb-item active">테이블 행 선택</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <section id="main-content" >
                    <div class="row" style="width: 900px;margin-left: 20%">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <h4>부 관리자 관리 페이지 </h4>
                                    
                                </div>
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive" >
                                        <table id="row-select" class="display table table-borderd table-hover">
                                            <thead>
                                                <tr>
                                                    <th>edit</th>
                                                    <th>id</th>
                                                    <th>pwd</th>
                                                    <th>name</th>
                                                    <th>position</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                
                                                <c:if test="${empty list }">
                                                	<tr>
                                                		<td>데이터가 존재하지 않습니다</td>
                                                	</tr>
                                                </c:if>
                                                <c:if test="${!empty list }">
                                                <c:forEach var="vo" items="${list }">
                                                <tr>
                                                	<td>
                                                    <button type="button" class="btn btn-danger m-b-10 m-l-5" >삭제</button>
                                                    <button type="button" class="btn btn-info m-b-10 m-l-5">수정</button>
                                                    </td>
                                                    <td>${vo.adminId }</td>
                                                    <td>${vo.adminPwd }</td>
                                                    <td>${vo.adminName }</td>
                                                    <td>${vo.authorNo }</td>
                                                </tr>
                                                </c:forEach>
                                                
                                                </c:if>
                                                
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th style="visibility: hidden;"></th>
                                                    <th>id</th>
                                                    <th>pwd</th>
                                                    <th>name</th>
                                                    <th>position</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                    <!-- /# row -->
                    <div class="button-list">
                                    
                                    <button type="button" class="btn btn-default m-b-10">Default</button>
                                    <button type="button" class="btn btn-primary m-b-10 m-l-5">관리자 등록</button>
                                    <button type="button" class="btn btn-success m-b-10 m-l-5">Success</button>
                                    <button type="button" class="btn btn-info m-b-10 m-l-5">Info</button>
                                    <button type="button" class="btn btn-warning m-b-10 m-l-5">Warning</button>
                                    <button type="button" class="btn btn-danger m-b-10 m-l-5">Danger</button>
                                    <button type="button" class="btn btn-pink m-b-10 m-l-5">Pink</button>
                                    <button type="button" class="btn btn-dark m-b-10 m-l-5">Dark</button>
                                    <button type="button" class="btn btn-link m-b-10 m-l-5">Link</button>
                                </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer">
                                <p>관리자 보드 - <a href="#">example.com</a></p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>


<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp" %>

<!-- 화면별 고유 scripit init -->

<!-- jquery vendor -->
    <script src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/jquery.nanoscroller.min.js'/>"></script>
    <!-- nano scroller -->
    <script src="<c:url value='/assets/js/lib/menubar/sidebar.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/preloader/pace.min.js'/>"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->

    <script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="<c:url value='/assets/js/scripts.js'/>"></script>
    <!-- scripit init-->
    <script src="<c:url value='/assets/js/lib/data-table/datatables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/jszip.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.colVis.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/datatables-init.js'/>"></script>
	

<%@include file="../inc/admin_bottom.jsp" %>    
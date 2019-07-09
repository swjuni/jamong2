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
                                <h1>서비스 평가 <span>관리화면</span></h1>
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
                                    <h4>서비스 평가 상세보기</h4>
                                </div>
                                <div class="card-body">
									<div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th style="width: 25%">no</th>
                                                    <td style="width: 75%">${map['EVAL_NO'] }</td>
                                                    <td style="width: 0%"></td>
                                                </tr>
                                                <tr>
                                                    <th>평가일</th>
                                                    <td><fmt:formatDate value="${map['COL'] }" pattern="yyyy-MM-dd"/></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>회원ID</th>
                                                    <td>${map['USER_ID'] }</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>카테고리(대)</th>
                                                    <td>${map['CATEGORY_NAME_L'] }</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>카테고리(중)</th>
                                                    <td>${map['CATEGORY_NAME'] }</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>상품명</th>
                                                    <td class="color-primary">${map['PRODUCT_NAME'] }</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>평가점수</th>
                                                    <td><span class="badge badge-primary">${map['EVAL_SCORE'] }</span></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>전문가닉네임</th>
                                                    <td>${map['ID'] }</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>이용 후기</th>
                                                    <td>${review }</td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <br><br>
									<!-- <button class="btn btn-primary" type="submit">등록</button> -->
									<div class="text-center">
							            <input type = "Button" value="글삭제" class="btn btn-danger"
							            onclick="location.href='<c:url value='/admin/evaluation/evaluationList.do'/>'">
							            <input type = "Button" value="글목록" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/evaluation/evaluationList.do'/>'">
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
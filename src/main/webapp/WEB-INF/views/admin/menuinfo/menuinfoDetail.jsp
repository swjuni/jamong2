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
                                <h1>상품 <span>관리화면</span></h1>
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
                                    <h4>상품  상세보기</h4>
                                </div>
                                <div class="card-body">
									<div class="user-profile">
									
										<table class="table">
	                    						<tbody>
	                    							<tr>
	                    								<th>No</th>
	                    								<td>${map['PRODUCT_NO'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>카테고리</th>
	                    								<td>${map['CATEGORY_NAME_L'] } > ${map['CATEGORY_NAME'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>상품명</th>
	                    								<td>${map['PRODUCT_NAME'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>전문가 닉네임</th>
	                    								<td>${map['ID'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>정렬레벨</th>
	                    								<td>${map['ORDER_LEVEL'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                                                    <th>등록일</th>
	                                                    <td>${map['REGDATE'] }</td>
	                                                    <td></td>
	                                                </tr>
	                                                <tr>
	                                                    <th>활성화 상태</th>
	                                                    <td>
	                                                    <c:if test="${map['ACTIVATION'] == 'Y' }">
					                                    	활성화
	                                                    </c:if>
	                                                    <c:if test="${map['ACTIVATION'] == 'N' }">
					                                    	비활성화
	                                                    </c:if>
	                                                    </td>
	                                                    <td></td>
	                                                </tr>
	                                                <tr>
	                                                    <th>요약 설명</th>
	                                                    <td>${map['SUMMARY'] }</td>
	                                                    <td></td>
	                                                </tr>
	                                                <tr>
	                                                    <th>상세 설명</th>
	                                                    <td>${map['DETAIL_DESC'] }</td>
	                                                    <td></td>
	                                                </tr>
	                    						</tbody>
	                    					</table>
	                    					<br>
	                    					<br>

									<!-- <button class="btn btn-primary" type="submit">등록</button> -->
									<div class="text-center">
										<c:if test="${map['ACTIVATION'] == 'Y' }">
								            <input type = "button" value="비활성화" class="btn btn-primary"
								            onclick="location.href='<c:url value='/admin/menuinfo/menuinfoDetail.do?productNo=${map["PRODUCT_NO"] }&activation=${map["ACTIVATION"] }'/>'">&nbsp;&nbsp;
										</c:if>
										<c:if test="${map['ACTIVATION'] == 'N' }">
								            <input type = "button" value="활성화" class="btn btn-primary"
								            onclick="location.href='<c:url value='/admin/menuinfo/menuinfoDetail.do?productNo=${map["PRODUCT_NO"] }&activation=${map["ACTIVATION"] }'/>'">&nbsp;&nbsp;
							            </c:if>
										<c:if test="${empty map['ACTIVATION']}">
								            <input type = "button" value="활성화" class="btn btn-primary"
								            onclick="location.href='<c:url value='/admin/menuinfo/menuinfoDetail.do?productNo=${map["PRODUCT_NO"] }&activation=N'/>'">&nbsp;&nbsp;
							            </c:if>
							            <input type = "Button" value="삭제" class="btn btn-primary"
				            			onclick="location.href='<c:url value='/admin/menuinfo/menuinfoDelete.do?productNo=${map["PRODUCT_NO"] }'/>'">&nbsp;&nbsp;
							            <input type = "Button" value="글목록" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/menuinfo/menuinfoList.do'/>'">
							        </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                  </div>
                </section>
            </div>
        </div>
    </div>



	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->


<%@include file="../inc/admin_bottom.jsp" %>    
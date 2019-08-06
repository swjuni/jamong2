<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../incs/top_mypage.jsp" %>
<c:import url="/mypage/sideMypage.do"/>
<link href="<c:url value='/assets/css/style2.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/css/lib/themify-icons.css'/>" rel="stylesheet">
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
	.header{
		margin-left: 0px;
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
									
										<table class="table">
	                    						<tbody>
	                    							<tr>
	                    								<th>No</th>
	                    								<td>${map['ADS_NO'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>카테고리</th>
	                    								<td>${map['CATEGORY_NAME_L'] } > ${map['CATEGORY_NAME'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>전문가 닉네임</th>
	                    								<td>${map['ID'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>광고기간</th>
	                    								<td>${map['REQUEST_PERIOD'] }</td>
	                    								<td></td>
	                    							</tr>
	                    							<tr>
	                    								<th>서비스 기간</th>
	                    								<td>
	                    								<c:if test="${map['START_DATE'] != null && map['APPROVE_DELFLAG'] != 'C' && map['ACTIVATION'] == 'Y'}">
	                    								${map['START_DATE'] } ~ ${map ['END_DATE'] }
	                    								</c:if>
	                    								<c:if test="${map['START_DATE'] == null || map['ACTIVATION'] == 'N' || map['APPROVE_DELFLAG'] == 'C'}">
	                    									활성화 되지 않았습니다.
	                    								</c:if>
	                    								</td>
	                    								<td></td>
	                    							</tr>
	                                                <tr>
	                                                    <th>승인 상태</th>
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
	                                                    <th>금액</th>
	                                                    <td><fmt:formatNumber value="${map['PRICE'] }" pattern="#,###" />원</td>
	                                                    <td></td>
	                                                </tr>
	                    						</tbody>
	                    					</table>
	                    					<br>
	                    					<br>
							        
									<!-- <button class="btn btn-primary" type="submit">등록</button> -->
									<div class="text-center">
							            <input type = "Button" value="삭제" class="btn btn-primary"
				            			onclick="location.href='<c:url value='/main/bannerexpoert/bannerDelete.do?adsNo=${map["ADS_NO"] }&fileName=${map["FILE_NAME"] }'/>'">&nbsp;&nbsp;
							            <input type = "button" value="수정" class="btn btn-primary"
							            onclick="location.href='<c:url value='/main/bannerexpoert/bannerEdit.do?adsNo=${map["ADS_NO"] }'/>'">&nbsp;&nbsp;
							            <input type = "Button" value="글목록" class="btn btn-primary"
							            onclick="location.href='<c:url value='/main/bannerexpoert/bannerList.do'/>'">
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




<!-- 화면별 고유 하단js 포함할 위치 -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
	
	<!-- jquery vendor -->
    <script src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/jquery.nanoscroller.min.js'/>"></script>
    <!-- nano scroller -->
    <script src="<c:url value='/assets/js/lib/preloader/pace.min.js'/>"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->

    <script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="<c:url value='/assets/js/scripts.js'/>"></script>
    <!-- scripit init-->

</body>
</html>
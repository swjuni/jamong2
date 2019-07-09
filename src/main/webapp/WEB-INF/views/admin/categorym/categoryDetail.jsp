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
                                <h1>카테고리 <span>관리화면</span></h1>
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
                                    <h4>카테고리 상세보기</h4>
                                </div>
                                <div class="card-body">
									<div class="user-profile">
										<table class="table">
                    						<tbody>
                    							<tr>
                    								<th>카테고리(중)명</th>
                                                    <td>${map['CATEGORY_NAME_L'] } > ${map['CATEGORY_NAME'] }</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>카테고리(중) 설명</th>
                                                    <td>${map['CATEGORY_DESC'] }</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>이미지 파일</th>
                                                    <td>
                                             		<c:if test="${!empty map['IMG_NAME'] }">
					                          			<img class="img-fluid" src="<c:url value='/upload/category_m/${map["IMG_NAME"] }'/>" alt=""/>
													</td>
													<td></td>
												</tr>
												<tr>
													<th>이미지 파일 이름</th>
													<td>${map['IMG_NAME'] }</td>
												
													</c:if>
                                                    <td></td>
                                                </tr>
                    						</tbody>
                    					</table>
                    					<br><br>
									<!-- <button class="btn btn-primary" type="submit">등록</button> -->
									<div class="text-center">
							            <input type = "button" value="수정" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/categorym/categoryEdit.do?categoryNoM=${map["CATEGORY_NO_M"] }'/>'">&nbsp;&nbsp;
							            <input type = "Button" value="삭제" class="btn btn-primary"
				            			onclick="location.href='<c:url value='/admin/categorym/categoryDelete.do?categoryNoM=${map["CATEGORY_NO_M"] }&imgName=${map["IMG_NAME"] }'/>'">&nbsp;&nbsp;
							            <input type = "Button" value="글목록" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/categorym/categoryList.do'/>'">
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
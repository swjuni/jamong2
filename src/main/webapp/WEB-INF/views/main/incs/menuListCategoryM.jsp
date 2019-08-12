<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="col-md-2">
						<c:if test="${!empty categoryNameL }">
							<h3>${categoryNameL }</h3> 
						</c:if>
						<c:if test="${empty categoryNameL }">
							<c:if test="${!empty expertName }">
								<h3>${expertName }</h3> 
							</c:if>
						</c:if>
						<hr class="hrLine">
						<div class="catLine">
							<p><b>카테고리</b></p>
							<hr class="hrSubLine">
							<div class="forFont">
								<c:if test="${!empty cmList }">
									<ul style="padding-left: 5px;">
										<c:forEach var="vo" items="${cmList }">
											<li style="list-style: none;">
												<!-- 클릭이벤트에 searchVo 검색조건을 부여하는 방법으로 구현해야함 -->
												<a href="<c:url value='/main/menuinfo/menuinfo_List.do?categoryNoM=
												${vo.categoryNoM }&categoryNoL=${vo.categoryNoL }'/>"
												<c:if test="${param.categoryNoM == vo.categoryNoM }">
												style="color: orange; font-weight: bold;"
												</c:if>
												>${vo.categoryName }</a>
											</li>
										</c:forEach>
									</ul>
								</c:if>
							</div>
						</div>
						<hr class="hrLine"><!-- 
						<div class="catLine">
							<p><b>전문가 등급</b></p>
							<hr class="hrSubLine">
							클릭이벤트에 위 카테고리 검색조건을 기본으로 주고 추가로 검색조건주는 방법으로 구현해야함
							<div class="forFont">등급 for위치</div>
						</div>
						<hr class="hrLine">
						<div class="catLine">
							<p><b>상품검색 태그</b></p>
							<hr class="hrSubLine">
							클릭이벤트에 위 카테고리 검색조건을 기본으로 주고 추가로 검색조건주는 방법으로 구현해야함
							<div class="forFont">태그 for위치</div>
						</div>
						<br><br> -->
					</div>
					

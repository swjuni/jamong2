<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
	h4{
		font-size: 18px;
		padding: 0;
	}
</style>
					<div class="col-md-4 col-sm-12 col-xs-12 first">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-competition"></i>
							<div class="service-details">
								<h4><a 
								<c:if test="${param.state=='expert' }">
									style="color:#f47664;"
								</c:if>
								 href="<c:url value='/mypage/registExpert.do?state=expert'/>">
								 <c:if test="${empty expert }">
								 전문가 등록
								 </c:if>
								 <c:if test="${!empty expert }">
								 기본정보
								 </c:if>
								 </a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-content"></i>
							<div class="service-details">
								<h4><a 
								<c:if test="${param.state=='profile' }">
									style="color:#f47664;"
								</c:if>>프로필 작성</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12 last">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-html"></i>
							<div class="service-details">
								<h4><a
								<c:if test="${param.state=='service' }">
									style="color:#f47664;"
								</c:if>
								<c:if test='${!empty expert }'>
								 href="<c:url value='/mypage/service.do?state=service'/>"
								</c:if> 
								 >서비스 등록</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->
				</div>

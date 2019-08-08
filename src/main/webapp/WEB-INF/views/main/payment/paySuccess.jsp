<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<%@include file="../incs/top_mypage.jsp"%>
<section class="section bt">
			<div class="container">
				<div class="section-title text-center">
					<small>jamong </small>
					<h3>주문이 완료되었습니다.</h3>
					<hr>
					<p class="lead">주문이 정상적으로 처리되었습니다. 마이페이지 구매내역에서 확인하실 수 있습니다.<br>판매자가 주문 거부시 자동 결제 취소 되며, 주문 수락시 거래가 진행됩니다.
					<br>판매자가 수락하기 전까지 취소가능하며 그 이후에 환불을 원하실 경우 고객센터로 연락주시기바랍니다.</p>
				</div><!-- end section-title -->
				<div class="section-title text-center" style="margin-bottom: 0;margin-top: 110px;">
				<a class="btn btn-primary" href="<c:url value="/main/index_main.do"/>" style="margin-right: 50px;"> ← 메인 페이지로</a>
				<a class="btn btn-primary" href="<c:url value='/mypage/orders/buyList.do'/>" style="margin-left: 50px;"> 구매내역으로 →</a>
				</div>
			</div><!-- end container -->
		</section>
<%@include file="../incs/bottom_main.jsp"%>